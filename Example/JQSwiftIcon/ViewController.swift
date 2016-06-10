//
//  ViewController.swift
//  JQSwiftIcon
//
//  Created by Jose Quintero on 06/09/2016.
//  Copyright (c) 2016 Jose Quintero. All rights reserved.
//

import UIKit
import JQSwiftIcon

class ViewController: UIViewController {

    @IBOutlet weak var iconLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        iconLabel.processIcons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

