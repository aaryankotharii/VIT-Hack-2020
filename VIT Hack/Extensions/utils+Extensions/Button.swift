//
//  Button.swift
//  VIT Hack
//
//  Created by Aaryan Kothari on 27/07/20.
//  Copyright © 2020 VIT Hack. All rights reserved.
//

import UIKit

extension UIButton {
    func bottomShadow(){
        layer.cornerRadius = 8.0
        layer.borderWidth = 0.0
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }
}