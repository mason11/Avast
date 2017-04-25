//
//  StoreTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Mason Killgore on 3/29/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
