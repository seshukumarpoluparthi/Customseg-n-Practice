//
//  ScoutingListViewController.swift
//  Rancher
//
//  Created by venkatarao on 20/07/18.
//  Copyright © 2018 Exaact. All rights reserved.
//
//import UIKit
//import Kingfisher
//class ScoutingListViewController: UIViewController,ASCircularButtonDelegate,UITableViewDelegate,UITableViewDataSource {
//    @IBOutlet weak var btn_addtasks: ASCircularMenuButton!
//    var spinner=SpinnerVC(title: "Loading...")
//    var str_fieldlistpostion=0
//    var str_farmname=""
//    var total_acr=""
//    var str_farmId=0
//    var str_fieldId=0
//    var selectFarmAndFieldName_Flag=0
//    var farmTableview:UITableView!
//    var fieldsTableview:UITableView!
//    var ary_fieldlist=NSArray()
//     var background_dummyview=UIView()
//    var topconstraint2:NSLayoutConstraint!
//    let extraViewsContainer12 = UIView.init()
//    @IBOutlet var view_popup: UIView!
//    @IBOutlet weak var img_popup: UIImageView!
//   // var ary_scouting=[Models_scoutinglist]()
//   // var ary_scouting_filter=[Models_scoutinglist]()
//    @objc func popup_view()
//    {
//        setup_popupview()
//        background_dummyview.isHidden=false
//        view_popup.slideInFromTop1()
//        topconstraint2.constant=000
//        view_popup.isHidden=false
//    }
//    @objc func Cancelpopup_view()
//    {
//        background_dummyview.isHidden=true
//        view_popup.slideInFromTop1()
//        topconstraint2.constant=1000
//        view_popup.isHidden=true
//    }
//    @IBAction func btn_back(_ sender: UIButton) {
//        let stbd = UIStoryboard(name: "Main", bundle: nil)
//        let vc = stbd.instantiateViewController(withIdentifier: "TimeSheetViewControllerstbd") as! OperationsViewController
//       /// self.present(vc, animated: true, completion: nil)
//        self.dismiss(animated: false, completion: nil)
//    }
//    @IBAction func farm_dropdown(_ sender: Any) {
////        farmTableview.isHidden=false
////        fieldsTableview.isHidden=true
////        farmTableview.reloadData()
//    }
//    @IBOutlet weak var btn_fields: UIButton!
//    @IBAction func fields_dropdown(_ sender: UIButton) {
//        farmTableview.isHidden=true
//        fieldsTableview.isHidden=false
//        fieldsTableview.reloadData()
//    }
//    
//    @IBOutlet weak var scoutingTableview: UITableView!
//    @IBOutlet var shareButton: ASCircularMenuButton!
//    
//    @IBAction func btn_deleteNote(_ sender: UIButton) {
//    }
//    @IBOutlet weak var btn_deletenote: UIButton!
//    @IBAction func btn_addNote(_ sender: UIButton) {
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        scoutingTableview.reloadData()
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       if tableView==farmTableview
//       {
//        return farmslist.count
//        }
//        else if tableView==fieldsTableview
//       {
//        return ary_scouting.count
//        }
//       else{
//        return ary_scouting_filter.count
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if tableView==scoutingTableview
//        {
//            return 175
//        }
//        else{
//            return 50
//        }
//        
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView==farmTableview
//        {
//            let cell = UITableViewCell()
//            cell.textLabel?.text="\(farmslist[indexPath.row].farmName!)"
//            cell.layer.frame=CGRect(x: 5, y: 39, width: fieldsTableview.frame.size.width-10, height: 1)
//            cell.layer.borderColor=UIColor.lightGray.cgColor
//            return cell
//        }
//        else if tableView==fieldsTableview
//        {
//            let cell = UITableViewCell()
//            let lblfieldname=UILabel(frame: CGRect(x: 20, y: 5, width: fieldsTableview.frame.size.width-40, height: 25))
//            lblfieldname.text="\(ary_scouting[indexPath.row].fieldName!)"
//            lblfieldname.textColor=Rancher_orangeColor
//            lblfieldname.font=UIFont.init(name: Rancher_DemiBloldFont, size: 20)
//            cell.addSubview(lblfieldname)
//            let lblfarmname=UILabel(frame: CGRect(x: 20, y: 28, width: fieldsTableview.frame.size.width-40, height: 15))
//            lblfarmname.text="\(ary_scouting[indexPath.row].fieldName!)"
//            lblfarmname.textColor=UIColor.darkGray
//            lblfarmname.font=UIFont.init(name: Rancher_NormalFont, size: 15)
//            cell.addSubview(lblfarmname)
//            let layer=CALayer()
//            layer.frame=CGRect(x: 0, y: 49, width: fieldsTableview.frame.size.width, height: 1)
//            layer.backgroundColor=UIColor.lightGray.cgColor
//            cell.layer.addSublayer(layer)
//            cell.accessoryType = .disclosureIndicator
//            return cell
//        }
//        else{
//            let cell=tableView.dequeueReusableCell(withIdentifier: "ScoutingListviewCellTableViewCellSTB")as! ScoutingListviewCellTableViewCell
//            cell.selectionStyle = .none
//             let dict_img=["3":"disesses","2":"insects","1":"weeds","4":"insects"]
//            let count=ary_scouting_filter[indexPath.row].images.count
//            cell.scrollview.contentSize=CGSize(width: count*62, height: 50)
//            cell.scrollview.showsHorizontalScrollIndicator = false
//            var y_space=0
//              for k in 0..<count
//              {
//                let vw=UIView(frame: CGRect(x: y_space, y: 4, width: 50, height: 50))
//                let btn=UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//                btn.layer.cornerRadius=25
//                let imagename = ary_scouting_filter[indexPath.row].images
//                let scid=(imagename![k] as AnyObject).value(forKey: "scoutId")as? Int ?? 0
//                 let url:URL=URL(string:"http://shamba.exaact.co:8085/Rancher/gallery/image/\(scid)/\((imagename![k] as AnyObject).value(forKey: "imageUrl")as? String ?? "")")!
//                btn.kf.setImage(with: url, for: .normal)
//                // btn.setImage(UIImage(named: "Almond_Brownline_and_Decline"), for: .normal)
//                btn.addTarget(self, action: #selector(popup_view), for: .touchUpInside)
//                vw.layer.shadowOffset=CGSize.zero
//                vw.layer.shadowOpacity=2
//                vw.layer.cornerRadius=25
//                btn.layer.masksToBounds = true
//                vw.layer.shadowColor=UIColor.darkGray.cgColor
//                vw.addSubview(btn)
//                cell.scrollview.addSubview(vw)
//                y_space=y_space+62
//            }
//            cell.img_scoutingtype.layer.shadowColor=UIColor.gray.cgColor
//            cell.img_scoutingtype.layer.shadowOffset=CGSize.zero
//            cell.img_scoutingtype.layer.shadowOpacity=2
//            if indexPath.row==0
//            {
//                cell.btn_line.isHidden=true
//            }
//            else{
//                
//                cell.btn_line.isHidden=false
//            }
//            if ary_scouting[indexPath.row].images.count != 0
//            {
//            cell.img_scoutingtype.image=UIImage(named: "\(dict_img[ary_scouting_filter[indexPath.row].observation!]!)")
//            cell.lbl_additionalinfo.text=ary_scouting_filter[indexPath.row].note!
//            cell.lbl_fieldname.text=UserName
//            let time=ary_scouting_filter[indexPath.row].createdDtm!.split(separator: " ")
//            cell.lbl_timer.text="\(time[1].split(separator: ".")[0])"
//            cell.lbl_notename.text="\(ary_scouting_filter[indexPath.row].farmName!)(\(ary_scouting_filter[indexPath.row].fieldName!))"
//            }
//            return cell
//        }
//        
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        if tableView==fieldsTableview
//        {
//            ary_scouting_filter.removeAll()
//            ary_scouting_filter=ary_scouting.filter({$0.farmName!=="\(ary_scouting[indexPath.row].farmName!)" && $0.fieldName!=="\(ary_scouting[indexPath.row].fieldName!)"})
//            self.scoutingTableview.reloadData()
//            Ary_ZipCodes=ary_scouting[indexPath.row].zipCode!
////          self.str_fieldId=((self.ary_fieldlist[indexPath.row] as AnyObject).value(forKey: "id")as? Int ?? 0)
//            self.btn_fields.setTitle("\(ary_scouting[indexPath.row].fieldName!)(\(ary_scouting[indexPath.row].farmName!))", for: .normal)
////            FieldId="\(self.str_fieldId)"
////            Ary_ZipCodes=(self.ary_fieldlist[indexPath.row] as AnyObject).value(forKey: "zipcode")as? String ?? ""
////             FieldName="\((self.ary_fieldlist[indexPath.row] as AnyObject).value(forKey: "fieldName")as? String ?? "")"
//        }
//        else{
//            selectFarmAndFieldName_Flag=0
//        }
//        farmTableview.isHidden=true
//        fieldsTableview.isHidden=true
//    }
//    @IBOutlet weak var btn_addnote: UIButton!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // setup_popupview()
//        let tapguster=UITapGestureRecognizer(target: self, action: #selector(Cancelpopup_view))
//        view_popup.addGestureRecognizer(tapguster)
//         //self.view.addGestureRecognizer(tapguster)
//        img_popup.layer.cornerRadius=60
//        img_popup.layer.masksToBounds=true
//        view_popup.layer.shadowColor=UIColor.gray.cgColor
//        view_popup.layer.shadowOffset=CGSize.zero
//        view_popup.layer.shadowOpacity=2
//        view_popup.layer.cornerRadius=10
//       
//        let nib=UINib(nibName: "ScoutingListviewCellTableViewCell", bundle: nil)
//        scoutingTableview.register(nib, forCellReuseIdentifier: "ScoutingListviewCellTableViewCellSTB")
//        scoutingTableview.separatorStyle = .none
//        scoutingTableview.showsVerticalScrollIndicator = false
//        farmTableview=UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 250))
//        self.view.addSubview(farmTableview)
//        farmTableview.isHidden=true
//        farmTableview.delegate=self
//        farmTableview.dataSource=self
//        farmTableview.separatorStyle = .none
//        fieldsTableview=UITableView(frame: CGRect(x: 0, y:50, width: self.view.frame.size.width-0, height: 300))
//        self.view.addSubview(fieldsTableview)
//        
//        fieldsTableview.delegate=self
//        fieldsTableview.dataSource=self
//        fieldsTableview.separatorStyle = .none
//        fieldsTableview.isHidden=true
//        configureDynamicCircularMenuButton(button: shareButton, numberOfMenuItems: 4)
//        shareButton.menuButtonSize = .medium
//        btn_addtasks.layer.cornerRadius=btn_addtasks.layer.frame.size.height/2
//        getFarmslistscout()
//    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    func buttonForIndexAt(_ menuButton: ASCircularMenuButton, indexForButton: Int) -> UIButton {
//        let button: UIButton = UIButton()
//        button.tag=indexForButton
//        if menuButton == shareButton{
//            // button.setBackgroundImage(UIImage.init(named: "\(indexForButton+1)"), for: .normal)
//            button.setImage(UIImage.init(named: "\(indexForButton+1)"), for: .normal)
//            
//            button.layer.cornerRadius=15
//            button.backgroundColor=UIColor.init(red: 243/255, green: 156/255, blue: 19/255, alpha: 1)
//        }
//        button.addTarget(self, action: #selector(btn_click), for: .touchUpInside)
//        //        if menuButton == colourPickerButton{
//        //            button.backgroundColor = colourArray[indexForButton]
//        //        }
//        return button
//    }
//    @objc func btn_click(btn:UIButton)
//    {
//        print(btn.tag)
//        let dict=[0:"Diseases",1:"Insects",2:"Weed",3:"Environment"]
//        let dict_img=[0:"disesses",1:"insects",2:"weeds",3:"insects"]
//        let storeboard=UIStoryboard(name: "Main", bundle: nil)
//        //let vc=storeboard.instantiateViewController(withIdentifier: "WeedListViewControllerstb")as! WeedListViewController
//        let vc=storeboard.instantiateViewController(withIdentifier: "NewnoteViewController")as! NewnoteViewController
//        scouting_Type=dict[btn.tag]!
//        Ary_ZipCodes=""
//        weedtype=dict[btn.tag]!
//        weedstr_title=dict[btn.tag]!
//        weedimg_strtype=dict_img[btn.tag]!
//        self.present(vc, animated: false, completion: nil)
//    }
//    func didClickOnCircularMenuButton(_ menuButton: ASCircularMenuButton, indexForButton: Int, button: UIButton) {
//        
//        //        if menuButton == colourPickerButton{
//        //            //self.viewLbl.textColor = button.backgroundColor
//        //        }
//        
//    }
//    func getFarmslistscout(){
//        self.spinner.activityIndicator.startAnimating()
//        self.view.addSubview(self.spinner)
//        UIApplication.shared.beginIgnoringInteractionEvents()
//        var jsonurl:String=""
//        if selectFarmAndFieldName_Flag==1
//        {
//             jsonurl = "http://shamba.exaact.co:8085/Rancher/scout/list/\(FarmId)/\(FieldId)"
//        }
//        else{
//              jsonurl = "http://shamba.exaact.co:8085/Rancher/scout/scoutList"
//        }
//        guard let url = URL(string: jsonurl) else {return}
//        var request = URLRequest(url: url)
//       // var token="44d3861b-2cac-4559-a3c2-e6ae7434779a"
//        //        if UserDefaults.standard.value(forKey: "authKey") != nil
//        //        {
//        //            token = UserDefaults.standard.value(forKey: "authKey")as! String
//        //        }
//        request.httpMethod = "GET"
//        request.setValue("\(deviceToken)", forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data, response, error) in
//            
//            guard let data = data , error == nil ,response != nil else {
//                print("something is wrong")
//                return
//            }
//            
//            DispatchQueue.main.async {
//                ary_scouting.removeAll()
//                ary_scouting_filter.removeAll()
//                do{
//                    //                    self.farmslist = [try JSONDecoder().decode(GetFarmsList.self, from: data)]
//                    //                    print(self.farmslist[0].result[0].farmName)
//                    
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])as! NSDictionary
//                    print("json response:\(json)")
//                    farmslist.removeAll()
//                    let result=json["result"]as! NSArray
//                    for data in result
//                    {
//                        let zipCode=(data as AnyObject).value(forKey: "zipCode")as? String ?? ""
//                        let id=(data as AnyObject).value(forKey: "id")as? Int ?? 0
//                         let cropId=(data as AnyObject).value(forKey: "cropId")as? Int ?? 0
//                         let farmId=(data as AnyObject).value(forKey: "farmId")as? Int ?? 0
//                        let note=(data as AnyObject).value(forKey: "note")as? String ?? ""
//                        let observation=(data as AnyObject).value(forKey: "scoutType")as? Int ?? 0
//                        let userType=(data as AnyObject).value(forKey: "userType")as? String ?? ""
//                        let createdDtm=(data as AnyObject).value(forKey: "createdDtm")as? String ?? ""
//                        let farmName=(data as AnyObject).value(forKey: "farmName")as? String ?? ""
//                        let fieldName=(data as AnyObject).value(forKey: "fieldName")as? String ?? ""
//                        let images=(data as AnyObject).value(forKey: "images")as? NSArray ?? []
//                        let obj=Models_scoutinglist(cropId: cropId, zipCode: zipCode, note: note, images: images, observation: "\(observation)", farmId: farmId, id: id, userType: userType, createdDtm: createdDtm,farmName:farmName,fieldName:fieldName)
//                        ary_scouting.append(obj)
//                    }
//                    // exception
//                    
//                    FieldId = "\(ary_scouting[0].id!)"
//                    FarmId="\(ary_scouting[0].farmId!)"
//                    Ary_ZipCodes=ary_scouting[0].zipCode!
//                    ary_scouting_filter=ary_scouting
//                    self.scoutingTableview.reloadData()
//                }
//                catch{
//                    print(error.localizedDescription)
//                }
//                self.spinner.activityIndicator.stopAnimating()
//                self.spinner.removeFromSuperview()
//                self.spinner.isHidden=true
//                UIApplication.shared.endIgnoringInteractionEvents()
//            }
//            //        if let Responsestr = String(data:data,encoding:.utf8)
//            //            {
//            //                 print("personalcontactsresponse : \(Responsestr)")
//            //            }
//        }
//        task.resume()
//    }
//    func setup_popupview()
//    {
//        let dummyview=UIView.init(frame: CGRect(x: 20, y: (self.view.frame.size.height-382)/2,width: self.view.frame.size.width-40, height: 382))
//        self.view.addSubview(dummyview)
//        dummyview.isHidden=true
//        background_dummyview.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        background_dummyview.backgroundColor=UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
//        self.view.addSubview(background_dummyview)
//        background_dummyview.isHidden=true
//        extraViewsContainer12.translatesAutoresizingMaskIntoConstraints = false
//        background_dummyview.addSubview(extraViewsContainer12)
//        topconstraint2=NSLayoutConstraint(item: extraViewsContainer12, attribute: .top, relatedBy: .equal, toItem: dummyview, attribute: .top, multiplier: 1.0, constant: 1000)
//        topconstraint2.isActive=true
//        extraViewsContainer12.leadingAnchor.constraint(equalTo: dummyview.leadingAnchor).isActive = true
//        extraViewsContainer12.trailingAnchor.constraint(equalTo: dummyview.trailingAnchor).isActive = true
//        extraViewsContainer12.heightAnchor.constraint(equalTo: dummyview.heightAnchor, multiplier: 1).isActive = true
//        extraViewsContainer12.widthAnchor.constraint(lessThanOrEqualTo: dummyview.widthAnchor).isActive=true
//        extraViewsContainer12.backgroundColor = UIColor.clear
//        extraViewsContainer12.addSubview(view_popup)
//        view_popup.leadingAnchor.constraint(equalTo: extraViewsContainer12.leadingAnchor).isActive=true
//        view_popup.trailingAnchor.constraint(equalTo: extraViewsContainer12.trailingAnchor).isActive=true
//        view_popup.widthAnchor.constraint(equalTo: extraViewsContainer12.widthAnchor).isActive=true
//        view_popup.heightAnchor.constraint(equalTo: dummyview.heightAnchor, multiplier: 1).isActive = true
//        view_popup.topAnchor.constraint(greaterThanOrEqualTo: extraViewsContainer12.topAnchor).isActive=true
//        view_popup.translatesAutoresizingMaskIntoConstraints = false
//        view_popup.isHidden=true
//    }
//}
