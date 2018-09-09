//
//  News1TableViewCell.swift
//  EmpProfile
//
//  Created by apple on 8/21/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class News1TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbl_Title: UILabel!
    
    @IBOutlet weak var img_Image: UIImageView!
    
    @IBOutlet weak var lbl_Author: UILabel!
    
    @IBOutlet weak var lbl_PublishedAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
