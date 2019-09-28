//
//  TodoTableViewCell.swift
//  Todo
//
//  Created by 野崎陽奈子 on 2019/09/27.
//  Copyright © 2019 野崎陽奈子. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet var todoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
