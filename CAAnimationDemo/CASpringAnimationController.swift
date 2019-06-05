//
//  CASpringAnimationController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CASpringAnimationController: CYBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SpringAnimation"

        // Do any additional setup after loading the view.
    }
    
    override func startAnimMethod() {
        let springAnim = CASpringAnimation(keyPath: "bounds")

        springAnim.toValue = NSValue(cgRect:CGRect(x: 200, y: 230, width: 140, height: 140))
        
        //mass模拟的是质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大 默认值：1
        springAnim.mass = 5
        //stiffness刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快。默认值： 100
        springAnim.stiffness = 80
        //damping阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快。默认值：10；
        springAnim.damping = 8
    //initialVelocity初始速率，动画视图的初始速度大小。默认值：0；速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反；
        springAnim.initialVelocity = 10
        //估算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算；
        springAnim.duration = springAnim.settlingDuration
        
        imgView?.layer.add(springAnim, forKey: "springAnim")
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
