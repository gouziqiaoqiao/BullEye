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
        
        // 调用方法
        startNewRound()
        updateLabels()
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
    
    
    // 开始一轮游戏
    func startNewRound() {
        
        totalRound += 1
        targetValue = Int(arc4random_uniform(100)) + 1 // 随机生成1~100
        valueSlider.value = 50
    }
    
    
    // 更新视图
    func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        scoreLabel.text = "Score: " + "\(totalValue)"
        roundLabel.text = "Round:\(totalRound)"
        
    }


    @IBAction func hitMeAction(sender: UIButton) {
        // 游戏逻辑
        currentValue = Int(valueSlider.value)
    
        let diffence = abs(currentValue - targetValue)
        var currentScore = 100 - diffence
        var msg: String
        if diffence < 5 {
            msg = "Perfect"
            currentScore += 100
        }
        else if diffence < 10 {
            msg = "Good"
            currentScore += 50
        }
        else {
            msg = "get hard"
        }
        msg += "current round score:\(currentScore)"
        
        // 汇总
        totalValue += currentScore
        let alert = UIAlertController(title: "提示", message: msg, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in
        }
        alert.addAction(okAction)
//        presentViewController(alert, animated: true, completion: nil)
//        startNewRound()
//        updateLabels()
        presentViewController(alert, animated: true) {
            // 这里是一个闭包/block
            self.startNewRound()
            self.updateLabels()
        }
    }
    
    
    @IBAction func restartOver(sender: UIButton) {
        totalValue = 0
        totalRound = 0
        startNewRound()
        updateLabels()
        
        // 添加一些动画
        // 创建动画
        let transition = CATransition()
        // 动画时间
        transition.duration = 0.5
        // 时间函数.减缓
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        self.view.layer.addAnimation(transition, forKey: nil)
        
        
    }
    
    
    @IBAction func helpAction(sender: UIButton) {
        // 查看详情
        
        
    }
    
}

