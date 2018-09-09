//
//  SpinnerVC.swift
//  DPM_12_11_2017
//
//  Created by ATG on 17/11/17.
//  Copyright © 2017 Sashank Palaparthi. All rights reserved.
//

import UIKit

class SpinnerVC: UIView {
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var lbltitle:UILabel=UILabel()
    var activityIndicator: UIImageView = UIImageView()
    init(title:String)
    {
        super.init(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height))
        //container.center = UIScreen.main.bounds.center
        loadingView.frame = CGRect(x:0, y:0, width:80, height:80)
        loadingView.center = self.center
        loadingView.backgroundColor = UIColor.white
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        activityIndicator.frame = CGRect(x:0, y:0, width:55, height:55)
        
         let jeremyGif = UIImage.gifImageWithName("loader")
            activityIndicator.image=jeremyGif

//        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.tintColor=UIColor.clear
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y:loadingView.frame.size.height / 2-10);
        
        
        loadingView.addSubview(activityIndicator)
        lbltitle.frame = CGRect(x:0, y:60, width:80, height:20)
        lbltitle.textColor = UIColor.orange
        lbltitle.clipsToBounds = true
        lbltitle.textAlignment = .center
        lbltitle.text = title
        lbltitle.font=UIFont.init(name: "normal", size: 11)
        loadingView.addSubview(lbltitle)
        self.addSubview(loadingView)
        activityIndicator.startAnimating()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    // MARK :- CONVERT HEXA TO RGB
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
    
}
