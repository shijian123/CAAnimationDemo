//
//  CABasicKeyPathController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class CABasicKeyPathController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let typeArr = ["Position","Opacity","Bounds","BoundsSize","BackgroundColor","CornerRadius","BorderWidth","Contents","TransformScale","TranformRotationX","TranformRotationY","TranformRotationZ","TranformTranslationX","TranformTranslationY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "KeyPathAnimation"

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
        let vc = KeyPathCAAnimationController()
        vc.selectNum = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
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
