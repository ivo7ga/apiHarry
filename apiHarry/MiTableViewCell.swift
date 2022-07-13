//
//  MiTableViewCell.swift
//  apiHarry
//
//  Created by Iván González on 9/3/22.
//

import UIKit

class MiTableViewCell: UITableViewCell {

    @IBOutlet weak var potterImagen: UIImageView!
    @IBOutlet weak var potterLabel: UILabel!
    @IBOutlet weak var potterHouse: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
