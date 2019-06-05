//
//  CATransitionController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CATransitionController: CYBaseController {
    let nextPageBtn: UIButton? = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 100, y: 400, width: 100, height: 40)
        btn.setTitle("nextPage", for: .normal)
        btn.addTarget(self, action: #selector(nextPageMethod), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TransitionAnimation"
        view.addSubview(self.nextPageBtn!)
    }
    
    override func startAnimMethod() {
        let transition = CATransition()
        transition.duration = 3.0
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        transition.type = .moveIn
        transition.type = CATransitionType(rawValue: "cube")
        transition.subtype = .fromRight
        imgView?.layer.add(transition, forKey: "transition")
        
    }

    
    @objc func nextPageMethod() {
        let transition = CATransition()
        transition.duration = 1.0
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = CATransitionType(rawValue: "cube")
        transition.subtype = .fromRight
        
        navigationController?.view?.layer.add(transition, forKey: "transitionAnim")
        navigationController?.pushViewController(CATransitionDetailController(), animated: false)

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
