//
//  Textfield.swift
//  VIT Hack
//
//  Created by Aaryan Kothari on 23/07/20.
//  Copyright © 2020 VIT Hack. All rights reserved.
//

import UIKit

extension UITextField {
func setUnderLine() {
let underline = CALayer()
let origin = CGPoint(x: 0, y:self.frame.height + 4)
let size = CGSize(width: self.frame.width, height: 1)
underline.frame = CGRect(origin: origin, size: size)
underline.backgroundColor = UIColor.black.cgColor
self.layer.addSublayer(underline)
}
}
