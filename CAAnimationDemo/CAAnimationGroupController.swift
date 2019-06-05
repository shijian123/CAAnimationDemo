//
//  CAAnimationGroupController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CAAnimationGroupController: CYBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AnimationGroup"

    }
    
    override func startAnimMethod() {
        let groupAnim = CAAnimationGroup()
        
        //创建keyAnim
        let keyAnim = CAKeyframeAnimation(keyPath: "position")
        //设置values
        keyAnim.values = [NSValue(cgPoint: CGPoint(x: 100, y: 200)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 200)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 300)),
                          NSValue(cgPoint: CGPoint(x: 100, y: 300)),
                          NSValue(cgPoint: CGPoint(x: 100, y: 400)),
                          NSValue(cgPoint: CGPoint(x: 200, y: 500))]
        keyAnim.duration = 4.0
        
        keyAnim.timingFunctions = [CAMediaTimingFunction(name: .easeInEaseOut)]
        
        //创建渐变圆角
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.toValue = 40
        animation.duration = 4.0
        imgView?.layer.masksToBounds = true
        
        groupAnim.animations = [keyAnim, animation]
        groupAnim.duration = 4.0
        groupAnim.repeatCount = MAXFLOAT
        groupAnim.autoreverses = true

        imgView?.layer.add(groupAnim, forKey: "groupAnim")
        
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
