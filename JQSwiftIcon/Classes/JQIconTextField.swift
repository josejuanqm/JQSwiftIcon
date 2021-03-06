//
//  JQIconTextField.swift
//
//  Created by Jose Quintero on 6/9/16.
//  Copyright © 2016 Jose Quintero. All rights reserved.
//

import UIKit

@IBDesignable
class JQIconTextField: UITextField {

    @IBInspectable var IconText: String = "" {
        didSet {
            self.text = IconText
            self.processIcons()
        }
    }

    override func awakeFromNib() {
        if self.font!.fontName.contains("Awesome") || self.font!.fontName.contains("icon") || self.font!.fontName.contains("themify"){
            return
        }
        self.processIcons()
    }

}
