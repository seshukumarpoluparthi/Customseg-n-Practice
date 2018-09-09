//
//  Task1TableViewCell.swift
//  EmpProfile
//
//  Created by apple on 8/9/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import UIKit

class Task1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var img_type: UIImageView!
    
    @IBOutlet weak var lbl_fieldName: UILabel!
    
    @IBOutlet weak var lbl_duration: UILabel!
    
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
