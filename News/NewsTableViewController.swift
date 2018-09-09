//
//  NewsTableViewController.swift
//  EmpProfile
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    var Numbers = ["One","Two","Three","Four","Five"]
    // declaring label
    var lbl : UILabel!
    var selected_Type = "technology"
    var ArtcleInfo = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.clearsSelectionOnViewWillAppear = false
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       NewsApiCall()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.lbl?.text = NewsTypeSelection
        self.selected_Type = NewsTypeSelection
        self.tableView.reloadData()
        NewsApiCall()
    }
    
    func NewsApiCall(){
        print(selected_Type)
        APIManager.shared.jsonserviceforGetMethod_Encoding(url: "https://newsapi.org/v2/top-headlines?country=us&category=\(selected_Type)&apiKey=acf80fc8f4cf4ab7a2124dc5fa36d84a", token: "") { (data) in
           // print(data)
            DispatchQueue.main.async {
                do{
         let news = try JSONDecoder().decode(GetNews.self, from: data)
                    self.ArtcleInfo = news.articles
                  //  print(self.ArtcleInfo.count)
                   // print(self.ArtcleInfo[0].url)
                 //   print(self.ArtcleInfo[0].urlToImage ?? "nil")
                    self.tableView.reloadData()
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 1
        case 1:
            return ArtcleInfo.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Select News Type"
        case 1 :
            return "\(selected_Type) News"
        default:
            return "Rancher"
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
       // view.tintColor = UIColor.orange
        let header = view as! UITableViewHeaderFooterView
        header.backgroundView?.backgroundColor = UIColor.orange
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.frame = header.frame
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        header.textLabel?.textAlignment = .justified
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "LableCell", for: indexPath)
            self.lbl = (cell.textLabel)!
        return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "News1") as! News1TableViewCell
            cell.lbl_Title.text = self.ArtcleInfo[indexPath.row].title
            cell.lbl_Author.text = self.ArtcleInfo[indexPath.row].author ?? "seshu"
            let imgurl = self.ArtcleInfo[indexPath.row].urlToImage ?? ""
            cell.img_Image.downloadImageFrom(link: imgurl, contentMode: .scaleToFill)
           // cell.img_Image.load(url: self.ArtcleInfo[indexPath.row].urlToImage)
            cell.lbl_PublishedAt.text = self.ArtcleInfo[indexPath.row].publishedAt
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return 40
        case 1:
            return 270
        default:
            return 40
        }
    }
}
extension UIImageView {
    func downloadImageFrom(link:String, contentMode: UIViewContentMode) {
        let imgeurl = link.replacingOccurrences(of: " ", with: "%20")
        if let url = URL(string: imgeurl) {
            URLSession.shared.dataTask( with: url , completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async() {
                    self.contentMode =  contentMode
                    if let data = data { self.image = UIImage(data: data) } else {
                        self.image = UIImage(named: "avtar")
                    }
                }
            }).resume()
        }
        else{
            print("error")
        }
        
    }
}
