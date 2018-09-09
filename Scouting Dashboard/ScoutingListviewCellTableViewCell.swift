//
//  ScoutingListviewCellTableViewCell.swift
//  Rancher
//
//  Created by apple on 7/25/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class ScoutingListviewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var btn_line: UIButton!
    
    @IBOutlet weak var lbl_timer: UILabel!
    @IBOutlet weak var img_scoutingtype: UIImageView!
    
    @IBOutlet weak var lbl_fieldname: UILabel!
    @IBOutlet weak var lbl_notename: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var lbl_additionalinfo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
