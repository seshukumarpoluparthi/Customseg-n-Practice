//
//  extension+CALayer.swift
//  EmpProfile
//
//  Created by venkatarao on 02/08/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import Foundation
import UIKit
// Layer extension for adding border on one of the sides
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat , hgt : CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
           border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width+hgt, height: thickness)
            
           // border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.size.width, height: thickness)
           // border.frame = CGRect.init(x: 0, y: frame.height, width: frame.width+40, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor
        self.addSublayer(border)
}
}
