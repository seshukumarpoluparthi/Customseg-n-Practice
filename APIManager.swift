//
//  APIManager.swift
//  EmpProfile
//
//  Created by apple on 8/7/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import Foundation
import UIKit


let Rancher_NormalFont="HelveticaNeue"
let Rancher_DemiBloldFont="HelveticaNeue-Medium"
let Rancher_BoldFont="HelveticaNeue-Bold"

var NewsTypeSelection : String = ""




let BaseUrl = "http://shamba.exaact.co:8085/Rancher"

class APIManager{
    
    static let shared = APIManager()
    private init(){}
    
    func requestForLocation()  {
        print("seshu")
    }
    // MARK :- HTTP GET METHOD FOR CODABLE
    public func jsonserviceforGetMethod_Encoding(url:String,token:String,completion:@escaping (_ responce:Data) -> Void)
    {
        print(url)
        DispatchQueue.main.async {
            let urlPath: String = url
            let url: URL = URL(string: urlPath)!
            let request = NSMutableURLRequest(url: url)
            //         var token="0b317b9b-0b2c-480a-b240-5dc7f3ae2f08"
            //                if UserDefaults.standard.value(forKey: "authKey") != nil
            //                {
            //                    token = UserDefaults.standard.value(forKey: "authKey")as! String
            //                }
            request.setValue("\(token)", forHTTPHeaderField: "Authorization")
            //    request.setValue("3B4EFC28-2DE5-4104-A313-CCD387EA6D4D", forHTTPHeaderField: "device_unique_token")
            print("Token is : \(token)")
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
                if let urlContent = data {
                    completion(urlContent)
                } else {
                    print("ERROR FOUND HERE")
                    return
                }
            }
            task.resume()
        }
    }
    // HTTP POST METHOD FOR CODABLE
    func generateRequest_Encoding(baseURL:String,array:Dictionary<String, Any>,completion:@escaping (_ responce:Data) -> Void) {
        
        print("array : \(array)")
        var request = URLRequest(url: URL(string: baseURL)!)
        var token="e17bc013-e9c5-4a20-ab2a-6816cc6dbf52"
        //            if UserDefaults.standard.value(forKey: "authKey") != nil
        //            {
        //                token = UserDefaults.standard.value(forKey: "authKey")as! String
        //            }
        request.httpMethod = "POST"
        print("token : \(token)")
        request.setValue("\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject:array, options: .prettyPrinted)
            print("request \(request.debugDescription)")
            
        } catch let error {
            print(error.localizedDescription)
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(String(describing: error))")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            completion(data)
        }
        task.resume()
    }
    
}


