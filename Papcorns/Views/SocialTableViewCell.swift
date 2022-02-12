//
//  SocialTableViewCell.swift
//  Papcorns
//
//  Created by MERT on 11.02.2022.
//

import UIKit

class SocialTableViewCell: UITableViewCell {
    @IBOutlet weak var socialInnerView: UIView!
    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
