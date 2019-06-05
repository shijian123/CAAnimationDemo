//
//  CAKeyframeAnimationController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: CYBaseController {

    var isPath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "KeyframeAnimation-Values"
        imgView?.center = CGPoint(x: 100, y: 200)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "changePath", style: .done, target: self, action: #selector(startAnimMethod))
    }
    
    override func startAnimMethod() {
        if isPath {
            startPathAnimation()
        }else {
            startValuesAnimation()
        }
        isPath = !isPath

    }
    
    func startValuesAnimation() {
        
        imgView?.layer.removeAnimation(forKey: "keyAnim-Path")
        
        //创建动画对象
        let keyAnim = CAKeyframeAnimation(keyPath: "position")
        //设置values
        keyAnim.values = [NSValue(cgPoint: CGPoint(x: 100, y: 200)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 200)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 300)),
                          NSValue(cgPoint: CGPoint(x: 100, y: 300)),
                          NSValue(cgPoint: CGPoint(x: 100, y: 400)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 500))]
        //重复次数 默认为1
        keyAnim.repeatCount = MAXFLOAT
        //设置是否原路返回 默认为false
        keyAnim.autoreverses = true
        //设置移动速度，越小越快
        keyAnim.duration = 4.0
        
        keyAnim.isRemovedOnCompletion = false
        keyAnim.fillMode = .forwards
        
        keyAnim.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        
        imgView?.layer.add(keyAnim, forKey: "keyAnim-Values")
    }

    @objc func startPathAnimation() {
        
        imgView?.layer.removeAnimation(forKey: "keyAnim-Values")
        
        //创建动画对象
        let keyAnim = CAKeyframeAnimation(keyPath: "position")
        
        //创建一个CGPathRef对象，就是动画的路线
        let path = CGMutablePath()
        //自动沿着弧度移动
        path.addEllipse(in: CGRect(x: 150, y: 200, width: 200, height: 100))
        //设置开始位置
        path.move(to: CGPoint(x: 100, y: 100))
        //沿着直线移动
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 400))
        
        //沿着曲线移动
        path.addCurve(to: CGPoint(x: 50.0, y: 275.0), control1: CGPoint(x: 150.0, y: 275.0), control2: CGPoint(x: 70.0, y: 120.0))
        path.addCurve(to: CGPoint(x: 150.0, y: 275.0), control1: CGPoint(x: 250.0, y: 275.0), control2: CGPoint(x: 90.0, y: 120.0))
        path.addCurve(to: CGPoint(x: 250.0, y: 275.0), control1: CGPoint(x: 350.0, y: 275.0), control2: CGPoint(x: 110, y: 120.0))
        path.addCurve(to: CGPoint(x: 350.0, y: 275.0), control1: CGPoint(x: 450.0, y: 275.0), control2: CGPoint(x: 130, y: 120.0))

        keyAnim.path = path
        //重复次数 默认为1
        keyAnim.repeatCount = MAXFLOAT
        //设置是否原路返回 默认为false
        keyAnim.autoreverses = true
        //设置移动速度，越小越快
        keyAnim.duration = 4.0

        keyAnim.isRemovedOnCompletion = false
        keyAnim.fillMode = .forwards
        
        keyAnim.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        
        imgView?.layer.add(keyAnim, forKey: "keyAnim-Path")
        
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
