//
//  ScrViewController.swift
//  EmpProfile
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class ScrViewController: UIViewController,UIScrollViewDelegate {
    let dict_types=["NATIONAL","BUSINESS","TECHNOLOGY","MOVIES","SPORTS","POLITICS","GADGET"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        let dict_colors=[UIColor.black,UIColor.orange,UIColor.green,UIColor.red,UIColor.gray,UIColor.blue,UIColor.brown,UIColor.cyan]
        let scrollview=UIScrollView(frame: CGRect(x: 15, y: 100, width: self.view.frame.size.width-30, height: 60))
        scrollview.contentSize=CGSize(width: 790, height: 60)
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.delegate=self
        scrollview.backgroundColor = UIColor.white
        view.addSubview(scrollview)
        var y_space=5
        for k in 0..<dict_types.count
        {
            let vw=UIView(frame: CGRect(x: y_space, y: 0, width: 100, height: 50))
            let btn=UIButton(frame: CGRect(x: 0, y: 15, width: 100, height: 30))
            btn.layer.cornerRadius=15
            btn.setTitle(dict_types[k], for: .normal)
            btn.titleLabel?.font=UIFont.init(name: Rancher_NormalFont, size: 12)
            btn.backgroundColor=dict_colors[k]
            // btn.setImage(UIImage(named: "Almond_Brownline_and_Decline"), for: .normal)
           // btn.addTarget(self, action: #selector(selectType), for: .touchUpInside)
            btn.tag=k
            vw.layer.shadowOffset=CGSize.zero
            vw.layer.shadowOpacity=2
            vw.layer.cornerRadius=22
            btn.layer.masksToBounds = true
            vw.layer.shadowColor=UIColor.darkGray.cgColor
            vw.addSubview(btn)
            scrollview.addSubview(vw)
            y_space=y_space+112
        }

        
    }
//    @objc func selectType(btn:UIButton)
//    {
//        selected_type=dict_types[btn.tag]
//        //  getNews_api()
//        let storeboard=UIStoryboard(name: "Main", bundle: nil)
//        let vc=storeboard.instantiateViewController(withIdentifier: "news_basedotypeClickSTB")as! news_basedotypeClick
//        vc.selected_type=self.selected_type
//        self.present(vc, animated: false, completion: nil)
//    }

   

}
