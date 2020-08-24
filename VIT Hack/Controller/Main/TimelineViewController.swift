//
//  TimelineViewController.swift
//  VIT Hack
//
//  Created by Aaryan Kothari on 15/07/20.
//  Copyright © 2020 VIT Hack. All rights reserved.
//

import UIKit
import SafariServices

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var timeline = [TimelineData]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let cellIdentifier = "timelinecell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = ControllerDefaults.timeline() { self.timeline = data }
        firebaseNetworking.shared.getTimeline(completion: self.timelinehandler(status:timeline:))
    }
    
    func timelinehandler(status:Bool,timeline : [TimelineData]){
        if status{
            self.timeline = timeline
        }
    }
    
}

//MARK: Tableview delegate + datasource methods
extension TimelineViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TimelineCell
        
        let timelineData = timeline[indexPath.row]
        
        cell.setupCell(timelineData)
        
        cell.watchNowButton.addTarget(self, action: #selector(watchnow(sender:)), for: .touchUpInside)
        
        cell.watchNowButton.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = timeline[indexPath.row]
        var height = extimateFrameForText(text: data.subtitle ?? "")
        if !(data.link == "") {
            height += 62
        }
        return height + 92
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension TimelineViewController {
    private func extimateFrameForText(text: String) -> CGFloat {
        let width = (view.frame.width * 0.6) - 50
        
        let size = CGSize(width: width, height: 1000)
        
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        let height = NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Lato-Regular", size: 14)!], context: nil).height
        
        return height
    }
}

extension TimelineViewController : SFSafariViewControllerDelegate {
    @objc func watchnow(sender : UIButton){
        let link = timeline[sender.tag].link
        openWebsite(link)
    }
    
    
    func openWebsite(_ link : String?){
        if let link = link,let url = URL(string: link) {
            if ["http", "https"].contains(url.scheme?.lowercased() ?? "") {
                let safariVC = SFSafariViewController(url: url)
                self.present(safariVC, animated: true, completion: nil)
                safariVC.delegate = self
            }
        }
    }
}
