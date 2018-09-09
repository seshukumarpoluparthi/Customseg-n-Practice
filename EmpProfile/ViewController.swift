//
//  ViewController.swift
//  EmpProfile
//
//  Created by venkatarao on 31/07/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomSegmentedControlDelegate {
//    var task : TasksList!
//   var filter_task : TasksList!
   //var filter_task = [TasksList]()
   var spinner = SpinnerVC(title: "Loading....")
    var task = [TasksList]()
    var filter_task = [Result]()
       var segment_postition = 0
    // var segment_postition : Int!
    func changeToIndex(index: Int) {
        self.segment_postition = view_Segment.selectedIndex
        self.tableView.reloadData()
    }
    @IBOutlet weak var view_Segment: CustomSegmentedControl!{
        didSet{
            view_Segment.setButtonTitles(buttonTitles: ["Active","Pending","Completed"])
            view_Segment.selectorTextColor = UIColor.orange
            view_Segment.selectorViewColor = UIColor.orange
            view_Segment.setIndex(index: 0)
            
        }
    }
    @IBAction func btn_cancelpop(_ sender: UIButton) {
        self.view_Floating.isHidden = true
    }
    @IBOutlet var view_Floating: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetails()
        view_Segment.delegate = self
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CELL")
        view_Floating.frame = CGRect(x: 0, y: self.view.frame.height-350 , width: self.view.frame.width, height: 350)
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "CELL")
        self.tableView.addSubview(view_Floating)
        self.view_Floating.isHidden = true
        self.tableView.reloadData()
    }
    @IBOutlet weak var FloatingButton: UIButton!
    @IBAction func btn_Floating(_ sender: UIButton) {
        view_Floating.slideInFromTop()
        self.view_Floating.isHidden = !self.view_Floating.isHidden
    }
    func getDetails(){
        self.spinner.activityIndicator.startAnimating()
        self.view.addSubview(self.spinner)
        UIApplication.shared.beginIgnoringInteractionEvents()
        APIManager.shared.jsonserviceforGetMethod_Encoding(url: "\(BaseUrl)/task/listOfTasks", token: "0b317b9b-0b2c-480a-b240-5dc7f3ae2f08") { (data) in
            print(data)
            DispatchQueue.main.async {
                do{
                    self.task = [try JSONDecoder().decode(TasksList.self, from: data)]
                    debugPrint(self.task[0].result[0].status)
                    let fld = self.task[0].result.filter({ ($0.status == "planned")})
                    print(fld)
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.reloadData()
                    self.spinner.activityIndicator.stopAnimating()
                    self.spinner.removeFromSuperview()
                    self.spinner.isHidden=true
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
                catch{
                    print(error.localizedDescription)
                }
                self.spinner.activityIndicator.stopAnimating()
                self.spinner.removeFromSuperview()
                self.spinner.isHidden=true
                UIApplication.shared.endIgnoringInteractionEvents()
            }
        }
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        switch (segment_postition) {
        case 0:
            print(segment_postition)
            self.filter_task = self.task[0].result.filter({ ($0.status == "planned")})
            return self.filter_task.count
        case 1:
            print(segment_postition)
            self.filter_task = self.task[0].result.filter({ ($0.status == "scheduled")})
            return self.filter_task.count
        case 2:
            self.filter_task = self.task[0].result.filter({ ($0.status == "completed")})
            return self.filter_task.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (segment_postition) {
        case 0:
            self.filter_task = self.task[0].result.filter({ ($0.status == "planned")})
            return self.filter_task[section].tasks.count
        case 1:
            self.filter_task = self.task[0].result.filter({ ($0.status == "scheduled")})
            return self.filter_task[section].tasks.count
        case 2:
            self.filter_task = self.task[0].result.filter({ ($0.status == "completed")})
            return self.filter_task[section].tasks.count
        default:
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HeaderCell", owner: self, options: nil)?.first as! HeaderCell
        let dat = self.filter_task[section].createdDtm.components(separatedBy: " ")
        let dateformat = dat[0].components(separatedBy: "-")
        let finsl = "\(dateformat[2])-\(dateformat[1])-\(dateformat[0])"
        header.lbl_date.text = finsl
        header.lbl_Name.text = self.filter_task[section].farmName ?? "seshu"
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TaskTableViewCell
        cell.lbl_assignBy.text = self.filter_task[indexPath.section].tasks[0].assignedBy
        cell.lbl_Clocking.text = self.filter_task[indexPath.section].tasks[0].workedHours
        print(self.filter_task[indexPath.section].tasks[0].workedHours)
        cell.lbl_taskType.text = self.filter_task[indexPath.section].tasks[0].task
        cell.lbl_totHrs.text = self.filter_task[indexPath.section].tasks[0].endTime
        cell.lbl_fromTo.text = self.filter_task[indexPath.section].tasks[0].startTime
        return cell
    }
}

