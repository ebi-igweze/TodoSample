//
//  TodoCell.swift
//  TodoSample
//
//  Created by ebi igweze on 12/09/2019.
//  Copyright © 2019 ebi igweze. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var todoCheckIcon: UIImageView!
    @IBOutlet weak var todoTitle: UILabel!
    
    var isChecked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
