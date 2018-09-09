//
//  HeaderCell.swift
//  EmpProfile
//
//  Created by venkatarao on 31/07/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var lbl_Name: UILabel!
    
    @IBOutlet weak var lbl_date: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
