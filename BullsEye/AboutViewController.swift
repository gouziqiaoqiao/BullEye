//
//  AboutViewController.swift
//  BullsEye
//
//  Created by 王钧 on 16/7/26.
//  Copyright © 2016年 王钧. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = NSBundle.mainBundle().URLForResource("BullsEye", withExtension: "html") {
            webView.loadRequest(NSURLRequest(URL: url))
        }
        
    }

    
    
    @IBAction func closeAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
