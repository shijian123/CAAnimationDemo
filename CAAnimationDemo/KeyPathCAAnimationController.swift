//
//  KeyPathCAAnimationController.swift
//  CAAnimationDome
//
//  Created by zcy on 2019/5/7.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class KeyPathCAAnimationController: CYBaseController {
    
    var selectNum: NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "点击图像开始动画"
    }
    
    override func startAnimMethod() {
        switch selectNum {
        case 0:
            addLayerAnimationPosition(imgView!.layer)
            
            break
        case 1:
            addLayerAnimationOpacity(imgView!.layer)
            
            break
        case 2:
            addLayerAnimationBounds(imgView!.layer)
            
            break
        case 3:
            addLayerAnimationBoundsSize(imgView!.layer)
            
            break
        case 4:
            imgView?.image = UIImage(named: "")
            addLayerAnimationBackgroundColor(imgView!.layer)
            
            break
        case 5:
            addLayerAnimationCornerRadius(imgView!.layer)
            
            break
        case 6:
            addLayerAnimationBorderWidth(imgView!.layer)
            
            break
        case 7:
            addLayerAnimationContents(imgView!.layer)
            
            break
        case 8:
            addLayerAnimationTransformScale(imgView!.layer)
            
            break
        case 9:
            addLayerAnimationTranformRotationX(imgView!.layer)
            
            break
        case 10:
            addLayerAnimationTranformRotationY(imgView!.layer)
            
            break
        case 11:
            addLayerAnimationTranformRotationZ(imgView!.layer)
            
            break
        case 12:
            addLayerAnimationTranformTranslationX(imgView!.layer)
            break
        case 13:
            addLayerAnimationTranformTranslationY(imgView!.layer)
            break
            
        default:
            break
        }
        
        
        
    }
    
    //移动动画position
    func addLayerAnimationPosition(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        //开始的位置
        animation.fromValue = NSValue(cgPoint: layer.position)
        //移动到的位置
        animation.toValue = NSValue(cgPoint: CGPoint(x: 180, y: 300))
        //持续时间
        animation.duration = 3
        //运动后的显示的位置保持不变（modelLayer的位置保持不变）
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        //添加动画
        layer.add(animation, forKey: "addLayerAnimationPosition")
    }
    
    //透明度 opacity
    func addLayerAnimationOpacity(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationOpacity")
        
    }
    
    //变大小与位置 bounds
    func addLayerAnimationBounds(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.toValue = NSValue(cgRect:CGRect(x: 200, y: 230, width: 140, height: 140))
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationBounds")
    }
    
    //由小变大 bounds.size
    func addLayerAnimationBoundsSize(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "bounds.size")
        animation.fromValue = NSValue(cgSize: layer.bounds.size)
        animation.toValue = NSValue(cgSize:CGSize(width: layer.bounds.size.width+20, height: layer.bounds.size.height+20))
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationBoundsSize")
    }
    
    //改变颜色 backgroundColor
    func addLayerAnimationBackgroundColor(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.toValue = UIColor.blue.cgColor
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationMargin")
    }
    
    //渐变圆角 cornerRadius
    func addLayerAnimationCornerRadius(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.toValue = 40
        animation.duration = 3
        layer.masksToBounds = true
        
        layer.add(animation, forKey: "addLayerAnimationCornerRadius")
    }
    
    //改变边框border的大小(图形周围边框，border默认为黑色)， borderWidth
    func addLayerAnimationBorderWidth(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.toValue = 10
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationBorderWidth")
    }
    
    //改变layer内容(图片)，注意如果想要达到改变内容的动画效果，首先在运行动画之前定义好layer的contents contents
    func addLayerAnimationContents(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "contents")
        let toImage = UIImage.init(named: "壁纸9.jpg")?.cgImage
        animation.toValue = toImage
        animation.duration = 3
        
        layer.add(animation, forKey: "addLayerAnimationBounds")
    }
    
    //缩放、放大 transform.scale
    func addLayerAnimationTransformScale(_ layer:CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        //开始时的倍率
        animation.fromValue = 1.0
        //结束时的倍率
        animation.toValue = 0.5
        animation.duration = 3
        
        animation.autoreverses = true
        
        layer.add(animation, forKey: "addLayerAnimationScale")
    }
    
    //旋转动画(翻转，沿着X轴) transform.rotation.x
    func addLayerAnimationTranformRotationX(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        //旋转180度 = PI
        animation.toValue = Double.pi*2
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformRotationX")
    }
    
    //旋转动画(翻转，沿着Y轴) transform.rotation.y
    func addLayerAnimationTranformRotationY(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        //旋转180度 = PI
        animation.toValue = Double.pi*2
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformRotationY")
    }
    
    //旋转动画（沿着Z轴） transform.rotation.z
    func addLayerAnimationTranformRotationZ(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        //旋转360度 = PI*2
        animation.toValue = Double.pi*2
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformRotationZ")
    }
    
    //横向移动（沿着X轴） transform.translation.x
    func addLayerAnimationTranformTranslationX(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.toValue = 20
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformTranslationX")
    }
    
    //纵向移动（沿着Y轴） transform.translation.y
    func addLayerAnimationTranformTranslationY(_ layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.toValue = 20
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformTranslationY")
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
