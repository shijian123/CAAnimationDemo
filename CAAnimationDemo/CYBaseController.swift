//
//  CYBaseController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CYBaseController: UIViewController {
    let imgView: UIImageView? = {
        let view = UIImageView()
        view.image = UIImage(named: "壁纸8.jpg")
        view.frame = CGRect(x: 180, y: 180, width: 80, height: 80)
        view.backgroundColor = UIColor.purple
        view.isUserInteractionEnabled = true
        let btn = UIButton(type: .custom)
        btn.frame = view.bounds
        btn.addTarget(self, action: #selector(startAnimMethod), for: .touchUpInside)
        view.addSubview(btn)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(self.imgView!)
    }
    
    
    @objc func startAnimMethod() {
    
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
