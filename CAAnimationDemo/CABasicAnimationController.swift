//
//  CABasicAnimationController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CABasicAnimationController: CYBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BasicAnimation"
    }
    
    override func startAnimMethod() {
        let baseAnim = CABasicAnimation(keyPath: "position")
        baseAnim.duration = 2;
        //开始的位置
        baseAnim.fromValue = NSValue(cgPoint: (imgView?.layer.position)!)
        baseAnim.toValue = NSValue(cgPoint: CGPoint(x: 260, y: 260))
        baseAnim.isRemovedOnCompletion = false
        baseAnim.fillMode = .forwards
        imgView?.layer.add(baseAnim, forKey: "baseAnim-position")
        imgView?.center = CGPoint(x: 260, y: 260)

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
