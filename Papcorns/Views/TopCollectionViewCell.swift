//
//  TopCollectionViewCell.swift
//  Papcorns
//
//  Created by MERT on 9.02.2022.
//

import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var TopinnerView: UIView!
    @IBOutlet weak var TopmovieImage: UIImageView!
    @IBOutlet weak var TopmovieName: UILabel!
    @IBOutlet weak var TopmovieDate: UILabel!
    
    @IBOutlet weak var TopMovieClass: UILabel!
    
    //MARK: Properties
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.TopinnerView.layer.cornerRadius = 12
        
    }
    
}
