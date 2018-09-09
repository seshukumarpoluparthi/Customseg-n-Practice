//
//  buttonAnimation.swift
//  OneControlApp
//
//  Created by ATG on 28/08/17.
//  Copyright © 2017 ATG. All rights reserved.
//
import Foundation
import UIKit
extension UIButton {
    
    func flsah()
    {
        let flssh=CABasicAnimation(keyPath: "opacity")
        flssh.duration=0.5
        flssh.fromValue=1
        flssh.toValue=0.1
        flssh.timingFunction=CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flssh.autoreverses=true
        flssh.repeatCount=1
        layer.add(flssh, forKey: nil)
    }
    @available(iOS 9.0, *)
    func pulse()
    {
        let pulse=CASpringAnimation(keyPath: "transform.scale")
        pulse.duration=0.6
        pulse.fromValue=0.95
        pulse.toValue=1
        pulse.damping=1
        pulse.autoreverses=true
        pulse.repeatCount=1
        pulse.initialVelocity=0.5
        layer.add(pulse, forKey: nil)
    }
    func shake()
    {
        let shake=CABasicAnimation(keyPath: "position")
        shake.duration=0.1
        shake.repeatCount=2
        shake.autoreverses=true
        let frompoint=CGPoint(x: center.x-5, y: center.y)
        let fromvalue=NSValue(cgPoint: frompoint)
        let topoint=CGPoint(x: center.x+5, y: center.y)
        let tovalue=NSValue(cgPoint: topoint)
        shake.fromValue=fromvalue
        shake.toValue=tovalue
        layer.add(shake, forKey: nil)
    }
    func Spinner()
    {
        UIView.animate(withDuration: 0.02 ,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.02, y: 0.02)
        },
                       completion: { finish in
                        UIView.animate(withDuration: 0.02, animations: {
                            self.transform = CGAffineTransform.identity
                        })
        })
    }
}
