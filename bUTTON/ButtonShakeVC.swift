//
//  ButtonShakeVC.swift
//  EmpProfile
//
//  Created by apple on 8/20/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class ButtonShakeVC: UIViewController {
    
    var btn_Icon : UIButton!
    @IBOutlet weak var myBtn: UIButton!
    @IBAction func myButton_Tapped(_ sender: UIButton) {
       sender.shake()
        //sender.pulse()
        //sender.Spinner()
        
        
        
    }
    
    
    @IBOutlet weak var btn_An: UIButton!
    
    @IBAction func btn_AnTapped(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var lbl_An: UILabel!
    
    @IBOutlet weak var view_An: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myBtn.layer.cornerRadius = 50
        myBtn.backgroundColor = UIColor.white
        myBtn.layer.borderWidth = 2
        myBtn.layer.borderColor = UIColor.darkGray.cgColor
       // btn_Icon = createbutton(frame: <#T##CGRect#>)
        btn_Icon=createbutton(frame: CGRect(x: (myBtn.frame.size.width-20)+(myBtn.frame.origin.x), y: (myBtn.frame.size.height-20)+(myBtn.frame.origin.y), width: 20, height: 20))
        self.view.addSubview(btn_Icon)
        
        // Animation
        view_An.slideInFromRight1()
        lbl_An.slideInFromBottom1()
        btn_An.slideInFromTop1()
    }
    
    func createview(frame:CGRect)-> UIView
    {
        let view=UIView(frame: frame)
        view.layer.cornerRadius=8
        return view
    }
    
    func createbutton(frame:CGRect)->UIButton
    {
        let btn=UIButton()
        btn.frame=frame
        btn.layer.borderWidth=1
        btn.layer.borderColor=UIColor.lightGray.cgColor
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("0", for: .normal)
        btn.backgroundColor=UIColor.lightGray
       // btn.titleLabel?.font=UIFont.init(name: UIColor.black, size: 12)
        btn.layer.cornerRadius=10
        return btn
    }
}
