//
//  BottomCollectionViewCell.swift
//  Papcorns
//
//  Created by MERT on 10.02.2022.
//

import UIKit

class BottomCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var bottomInnerView: UIView!
    @IBOutlet weak var bottomImage: UIImageView!
    @IBOutlet weak var bottomName: UILabel!
    @IBOutlet weak var bottomDate: UILabel!

    
    //MARK: Properties
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
