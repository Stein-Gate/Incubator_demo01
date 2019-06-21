//
//  WarnTableViewCell.swift
//  Incubator_demo01
//
//  Created by liangneng on 2019/6/21.
//  Copyright © 2019 liangneng. All rights reserved.
//

import UIKit

class WarnTableViewCell: UITableViewCell {

    @IBOutlet weak var warnName: UILabel!
    @IBOutlet weak var warnFloat: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
