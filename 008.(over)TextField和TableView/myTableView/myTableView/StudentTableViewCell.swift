//
//  StudentTableViewCell.swift
//  myTableView
//
//  Created by lijin on 2019/11/12.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet var genderImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
