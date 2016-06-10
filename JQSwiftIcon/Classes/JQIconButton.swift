//
//  JQIconButton.swift
//  
//
//  Created by Jose Quintero on 6/8/16.
//  Copyright © 2016 Jose Quintero. All rights reserved.
//

import UIKit

@IBDesignable
class JQIconButton: UIButton {

    @IBInspectable var IconText: String = "" {
        didSet {
            self.titleLabel?.text = IconText
            self.processIcons()
        }
    }
    
    override func awakeFromNib() {
        self.processIcons()
    }

}
