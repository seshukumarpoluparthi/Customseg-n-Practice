//
//  NewsSelectTypeVC.swift
//  EmpProfile
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class NewsSelectTypeVC: UIViewController {
    
    @IBOutlet weak var selectTableView: UITableView!
    var NewsType = ["business","entertainment","general","health","science","sports","technology"]

    override func viewDidLoad() {
        super.viewDidLoad()
        selectTableView.delegate = self
        selectTableView.dataSource = self
    }
}
extension NewsSelectTypeVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsType.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News2", for: indexPath) as! News2TableViewCell
        cell.lbl_Type.text = NewsType[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NewsTypeSelection = NewsType[indexPath.row]
        
        self.navigationController?.popViewController(animated: true)
       // navigationController?.popViewController(animated: true)
    }
    
    

    
    
    
}
