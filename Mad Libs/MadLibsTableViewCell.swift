//
//  MadLibsTableViewCell.swift
//  Mad Libs
//
//  Created by Jack Cable on 7/1/15.
//  Copyright © 2015 Jack Cable. All rights reserved.
//

import UIKit

class MadLibsTableViewCell: UITableViewCell {

    @IBOutlet var typeLabel: UILabel!
    
    @IBOutlet var inputField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
