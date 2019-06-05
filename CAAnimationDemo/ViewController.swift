//
//  ViewController.swift
//  CAAnimationDemo
//
//  Created by zcy on 2019/6/5.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let typeArr = ["BasicAnimation","BasicAnimation-KeyPath","KeyframeAnimation","SpringAnimation","TransitionAnimation","AnimationGroup","CATransaction"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Animation"
        
        let tableV = UITableView(frame: self.view.bounds)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "CELLID")
        view.addSubview(tableV)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELLID")
        cell?.textLabel?.text = typeArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(CABasicAnimationController(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(CABasicKeyPathController(), animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(CAKeyframeAnimationController(), animated: true)
            break
        case 3:
            self.navigationController?.pushViewController(CASpringAnimationController(), animated: true)
            break
        case 4:
            self.navigationController?.pushViewController(CATransitionController(), animated: true)
            break
        case 5:
            self.navigationController?.pushViewController(CAAnimationGroupController(), animated: true)
            break
        case 6:
            self.navigationController?.pushViewController(CATransactionController(), animated: true)
            break;
        default:
            break
        }
    }
    
}



