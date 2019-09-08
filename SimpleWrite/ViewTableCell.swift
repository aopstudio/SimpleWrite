//
//  ViewTableCell.swift
//  SimpleWrite
//
//  Created by macOS on 2019/7/25.
//  Copyright © 2019 macOS. All rights reserved.
//

import UIKit

class ViewTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var labelText: UILabel!
}
