//
//  OperationsVC.swift
//  EmpProfile
//
//  Created by apple on 8/16/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit
class OperationsVC: UIViewController {
   // var operations : OperationDetails!
   // var opArray : [Array] = []
   // var opArray : [Result33]!
    var opArray = [Result33]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.getOperationsdetail()
        }
    }
    func gatValue(){
        for i in self.opArray{
            print(i.date)
        }
    }
    func getOperationsdetail(){
        APIManager.shared.jsonserviceforGetMethod_Encoding(url: "\(BaseUrl)/activity/operationslist", token: "d3d41349-c848-455f-8ec8-98ea8f6237eb") { (data) in
            print(data)
            DispatchQueue.main.async {
                do{
//                    guard let operations = try? JSONDecoder().decode(OperationDetails.self, from: data) else {
//                        print("Error: Couldn't decode data into Blog")
//                        return
//                    }
 let operations = try JSONDecoder().decode(OperationDetails.self, from: data)
                    self.opArray = operations.result
                    self.gatValue()
                    let allkeys = self.opArray.filter({ (op) -> Bool in
                        op.date == "2018-08-29"
                    }).filter({ (po) -> Bool in
                        po.status == "Planned"
                    })
                    print(allkeys.count)
                   let dates = self.opArray.filter({$0.date == "2018-08-29"})
                    print(dates.count)
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
