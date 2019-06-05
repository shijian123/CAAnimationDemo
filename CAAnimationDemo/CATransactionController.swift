//
//  CATransactionController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CATransactionController: UIViewController {
    let layer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let leftBtn = UIButton(type: .system)
        leftBtn.frame = CGRect(x: 40, y: 120, width: 100, height: 30)
        leftBtn.setTitle("隐式事务", for: .normal)
        leftBtn.addTarget(self, action: #selector(leftBtnMethod), for: .touchUpInside)
        view.addSubview(leftBtn)
        
        let rightBtn = UIButton(type: .system)
        rightBtn.frame = CGRect(x: 180, y: 120, width: 100, height: 30)
        rightBtn.setTitle("显式事务", for: .normal)
        rightBtn.addTarget(self, action: #selector(rightBtnMethod), for: .touchUpInside)
        view.addSubview(rightBtn)
        
        //隐式事务
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.position = CGPoint(x: 100, y: 350)
        layer.backgroundColor = UIColor.red.cgColor
        layer.borderColor = UIColor.black.cgColor
        layer.opacity = 1.0
        view.layer.addSublayer(layer)

    }
    
    @objc func leftBtnMethod() {
        // 设置变化动画过程是否显示，默认为true不显示
        CATransaction.setDisableActions(false)
        layer.cornerRadius = (layer.cornerRadius == 0.0) ? 30.0 : 0.0
        layer.opacity = (layer.opacity == 1.0) ? 0.5 : 1.0
    }
    
    @objc func rightBtnMethod() {
        //显式事务
//        CATransaction.begin()
//        layer.zPosition = 200.0
//        layer.opacity = 0.0
//        CATransaction.setValue(8.0, forKey: "animationDuration")
//        CATransaction.commit()
        
        
        //事务嵌套
        CATransaction.begin()   // 外部transaction
        CATransaction.setValue(2.0, forKey: "animationDuration")
        layer.position = CGPoint(x: 140, y: 140)
        
        CATransaction.begin()   // 内部transaction
        CATransaction.setValue(5.0, forKey: "animationDuration")
        layer.zPosition = 200.0
        layer.opacity = 0.0
        
        CATransaction.commit()  // 内部transaction
        CATransaction.commit()  // 外部transaction
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
