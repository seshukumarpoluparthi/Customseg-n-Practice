//
//  LeavesViewController.swift
//  EmpProfile
//
//  Created by venkatarao on 01/08/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit
class LeavesViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    // datePicker
    var to_fromDate_flag=1
    @IBOutlet var view_datePicker: UIView!
    @IBAction func btn_DoneSelectDate(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone.local
       //formatter.dateFormat = "HH:mm:ss a"
       // formatter.dateFormat = "HH:mm"
        formatter.dateFormat = "hh:mm"
        
       // formatter.dateFormat = "HH:mm"
        // if you user 24 hrs in datepicker use to set AM or PM
       // formatter.dateFormat = "hh:mm a"
        print(formatter.string(from: datePicker.date))
        if to_fromDate_flag==1
        {
            btn_showFromDate.setTitle(formatter.string(from: datePicker.date), for: .normal)
            UIView.animate(withDuration: 0.4) {
                self.img_From.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)/180.0)
            }
        }
        else if to_fromDate_flag==2
        {
            btn_showToDate.setTitle(formatter.string(from: datePicker.date), for: .normal)
            UIView.animate(withDuration: 0.4) {
                self.img_To.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)/180.0)
            }
        }
        self.view.endEditing(true)
        self.view_datePicker.isHidden = true
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var view_TotnRemainLeaves: UIView!
    @IBOutlet weak var lbl_TotalLeaves: UILabel!
    @IBOutlet weak var lbl_RemainLeaves: UILabel!
    @IBOutlet weak var view_leaveDropdown: UIView!
    @IBOutlet weak var btn_showLeaveType: UIButton!
    @IBOutlet weak var btn_showFromDate: UIButton!
    @IBOutlet weak var img_To: UIImageView!
    @IBOutlet weak var img_From: UIImageView!
    @IBOutlet weak var img_leaveType: UIImageView!
    @IBOutlet weak var btn_showToDate: UIButton!
    @IBOutlet weak var textVw_Comment: UITextView!
    let LeavetypetableView : UITableView = UITableView()
    let vehichlemodeltableView : UITableView = UITableView()
    var leaves = ["Casual Leave","Sick Leave","Others"]
    // viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        LeavetypetableView.delegate = self
        LeavetypetableView.dataSource = self
        LeavetypetableView.register(UITableViewCell.self, forCellReuseIdentifier: "leave")
        LeavetypetableView.frame = CGRect(x: 20, y: view_leaveDropdown.frame.size.height+view_leaveDropdown.frame.origin.y, width: self.view.frame.size.width-40, height: 150)
        LeavetypetableView.isHidden = true
        self.scrollview.addSubview(LeavetypetableView)
        // MARK :-  datepicker
        
        // for 12 hours time
        // datePicker.locale = Locale(identifier: "en_US")
        // for 24 hours time in picker
      datePicker.locale = Locale(identifier: "en_GB")
        
        view_datePicker.frame = CGRect(x: 0, y: self.view.frame.height-150 , width: self.view.frame.width, height: 150)
        self.view.addSubview(view_datePicker)
        self.view_datePicker.isHidden = true
        textVw_Comment.text = "Comments"
        textVw_Comment.textColor = UIColor.lightGray
        textVw_Comment.delegate = self
        // adding border
        view_leaveDropdown.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5, hgt: 40)
        lbl_TotalLeaves.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5, hgt: 0)
        lbl_RemainLeaves.layer.addBorder(edge: .bottom, color: UIColor.gray, thickness: 0.5, hgt: 0)
    }
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    @IBAction func btn_FromDate(_ sender: UIButton) {
        to_fromDate_flag = 1
        UIView.animate(withDuration: 0.4) {
            self.img_From.transform=CGAffineTransform(rotationAngle: 180.0*CGFloat(Double.pi)/180.0)
        }
         self.view_datePicker.isHidden = !self.view_datePicker.isHidden
    }
    @IBAction func btn_ToDate(_ sender: UIButton) {
        to_fromDate_flag = 2
        UIView.animate(withDuration: 0.4) {
            self.img_To.transform=CGAffineTransform(rotationAngle: 180.0*CGFloat(Double.pi)/180.0)
        }
        self.view_datePicker.isHidden = !self.view_datePicker.isHidden
    }
    @IBAction func btn_BackVC(_ sender: UIButton) {
    }
    @IBAction func btn_LeaveType(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            self.img_leaveType.transform=CGAffineTransform(rotationAngle: 180.0*CGFloat(Double.pi)/180.0)
            self.LeavetypetableView.isHidden = !self.LeavetypetableView.isHidden
        }
    }
    @IBAction func btn_Save(_ sender: UIButton) {
        
        
    }
}
extension LeavesViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaves.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeavetypetableView.dequeueReusableCell(withIdentifier: "leave", for: indexPath)
        cell.textLabel?.text = leaves[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.btn_showLeaveType.setTitle(leaves[indexPath.row], for: .normal)
        UIView.animate(withDuration: 0.4) {
            self.img_leaveType.transform=CGAffineTransform(rotationAngle: CGFloat(Double.pi)/180.0)
            self.LeavetypetableView.isHidden = true
        }
}
}
extension LeavesViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n"){
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textVw_Comment.textColor == UIColor.lightGray{
            textVw_Comment.text = nil
            textVw_Comment.textColor = UIColor.black
        }
        animateViewMoving(up: true, moveValue: 0)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textVw_Comment.text.isEmpty{
            textVw_Comment.text = "Comment"
            textVw_Comment.textColor = UIColor.lightGray
        }
        animateViewMoving(up: false, moveValue: 0)
    }
}


