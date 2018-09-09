//
//  TaskTableViewCell.swift
//  EmpProfile
//
//  Created by venkatarao on 31/07/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_icon: UIImageView!
    
    
    @IBOutlet weak var lbl_taskType: UILabel!
    
    @IBOutlet weak var lbl_assignBy: UILabel!
    
    @IBOutlet weak var lbl_fromTo: UILabel!
    @IBOutlet weak var lbl_totHrs: UILabel!
    
    @IBOutlet weak var lbl_Clocking: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
