//
//  CATransitionDetailController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CATransitionDetailController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "goBack", style: .done, target: self, action: #selector(goBackAnimMethod))
    }
    
    @objc func goBackAnimMethod() {
        let transition = CATransition()
        transition.duration = 1.0
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = CATransitionType(rawValue: "cube")
        transition.subtype = .fromLeft        
        navigationController?.view?.layer.add(transition, forKey: "transitionAnim")
        navigationController?.popViewController(animated: false)
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
