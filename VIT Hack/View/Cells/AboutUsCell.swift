//
//  AboutUsCell.swift
//  VIT Hack
//
//  Created by Aaryan Kothari on 22/07/20.
//  Copyright © 2020 VIT Hack. All rights reserved.
//

import UIKit

protocol SocialDelegate : class {
    func didPressButton(_ tag: Int)
}

class AboutUsCell: UICollectionViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var photoBack: UIView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var topanchor: NSLayoutConstraint!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var delegate: SocialDelegate?
    
//    override func layoutIfNeeded() {
//        profilePhoto.layer.cornerRadius = profilePhoto.frame.width/2
//        photoBack.layer.cornerRadius = photoBack.frame.size.width/2
//        photoBack.clipsToBounds = true
//    }
    
    func setupCell(_ data : [socialMedia]){
        
        /// Corner radius
        card.layer.cornerRadius = 12

       //profilePhoto.clipsToBounds = true
        //photoBack.clipsToBounds = true
        let halfValue = photoBack.frame.width/2
        
        topanchor.constant = -halfValue
        
        layoutIfNeeded()
        
        /// Background Shadow
        layer.cornerRadius = 15.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 24
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        
        
        ///Social Media
        image1.image = UIImage(named: data[0].rawValue)
        image2.image = UIImage(named: data[1].rawValue)
        image3.image = UIImage(named: data[2].rawValue)
        
//        photoBack.layer.cornerRadius = photoBack.frame.size.width/2
//        profilePhoto.layer.cornerRadius = profilePhoto.frame.width/2
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.didPressButton(sender.tag)
}

}
