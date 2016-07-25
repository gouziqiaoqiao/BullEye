//
//  ViewController.swift
//  BullsEye
//
//  Created by 王钧 on 16/7/25.
//  Copyright © 2016年 王钧. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetValueLabel: UILabel!
    
    @IBOutlet weak var valueSlider: UISlider!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
   
    @IBOutlet weak var roundLabel: UILabel!
    
    // 定义变量
    
    // 目标分数
    var targetValue = 0
    // 当前分数
    var currentValue = 0
    // 总分
    var totalValue = 0
    // 总回合
    var totalRound = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        setupView()
        
    }

    // 定义函数
    func setupView() {
        // 设置slider
        // 设置滑块
        let thumbImage = UIImage(named: "SliderThumb-Normal") // named函数返回值为可选类型
        
        valueSlider.setThumbImage(thumbImage, forState: .Normal) // UIControlState.Normal
    
        let thumbImageHightLight = UIImage(named: "SliderThumb-Highlighted")
        valueSlider.setThumbImage(thumbImageHightLight, forState: .Highlighted)
        
        // 设置滑槽
        let trackImageLeft = UIImage(named: "SliderTrackLeft")
        // 可空链,开火车
        if let stretchImage = trackImageLeft?.stretchableImageWithLeftCapWidth(4, topCapHeight: 0) {
            valueSlider.setMinimumTrackImage(stretchImage, forState: .Normal)
            
            
        }
        
        let trackImageRight = UIImage(named: "SliderTrackRight")
        if let stretchImage = trackImageRight?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 14, 0, 14)) {
            
            valueSlider.setMaximumTrackImage(stretchImage, forState: .Normal)
        }
    }
    


    @IBAction func hitMeAction(sender: UIButton) {
    }
    
    
    @IBAction func restartOver(sender: UIButton) {
    }
    
    
    @IBAction func helpAction(sender: UIButton) {
    }
    
}

