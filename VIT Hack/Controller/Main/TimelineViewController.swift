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
    
    @IBOutlet var dayButtons: [UIButton]!
    
    var timeline = [TimelineData]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var lastContentOffset: CGFloat = 0
    
    var lastDate : Int = 0
    
    var discordButton = UIButton(type: .custom)
    
    let cellIdentifier = "timelinecell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = ControllerDefaults.timeline() { self.timeline = data }
        firebaseNetworking.shared.getTimeline(completion: self.timelinehandler(status:timeline:))
        floatingButton()
        for button in dayButtons{
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor(named: "blue")?.cgColor
            button.layer.cornerRadius = 22.5
        }
        dayTapped(dayButtons[0])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton()
    }
    
    @IBAction func dayTapped(_ sender: UIButton) {
        let blue = UIColor(named: "blue")
        dayButtons[lastDate].backgroundColor = .clear
        dayButtons[lastDate].setTitleColor(blue, for: .normal)
        lastDate = sender.tag
        dayButtons[lastDate].backgroundColor = blue
        dayButtons[lastDate].setTitleColor(.white, for: .normal)
    }
    
    func timelinehandler(status:Bool,timeline : [TimelineData]){
        if status{
            self.timeline = timeline
        }
    }
    
    func floatingButton(){
        setDiscordFrame()
        discordButton.setTitle("Join Discord", for: .normal)
        discordButton.backgroundColor = #colorLiteral(red: 0, green: 0.4431372549, blue: 0.8039215686, alpha: 1)
        discordButton.clipsToBounds = true
        discordButton.addTarget(self,action: #selector(joinDiscord), for: .touchUpInside)
        view.addSubview(discordButton)
        discordButton.bottomShadow(radius: 0.0)
    }
    
    func setDiscordFrame(){
        let width = view.frame.width * 0.56
        let height = width / 4
        let tabHeight = tabBarController?.tabBar.frame.size.height ?? 0.0
        let y = view.frame.height - height - 15 - tabHeight
        discordButton.frame = CGRect(x: 285, y: y, width: width, height: height)
        discordButton.center.x = view.center.x
        discordButton.layer.cornerRadius = height/2
    }
    
    @objc func joinDiscord(){
        
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

extension TimelineViewController {
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastContentOffset < scrollView.contentOffset.y {
            buttonTransition(down: true)
        } else if lastContentOffset > scrollView.contentOffset.y {
            buttonTransition(down: false)
        }
    }
    
    func buttonTransition(down : Bool){
        UIView.animate(withDuration: 0.3){
            self.discordButton.alpha = down ? 0.0 : 1.0
            let transform = CGAffineTransform(translationX: 0, y: 40)
            self.discordButton.transform = down ? transform : .identity
        }
    }
}

extension TimelineViewController {
    @objc func watchnow(sender : UIButton){
        let link = timeline[sender.tag].link
        openWebsite(link)
    }
}
