//
//  StudentTableViewCell.swift
//  TableViewDemo2
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
