//
//  AirportCell.swift
//  Assigment2
//
//  Created by 麥可不可 on 2021/5/10.
//

import UIKit

class AirportCell: UITableViewCell {

    @IBOutlet weak var airportimage: UIImageView!
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var countrylabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
