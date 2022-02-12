//
//  SocialCardViewModel.swift
//  Papcorns
//
//  Created by MERT on 11.02.2022.
//

import Foundation
import UIKit
struct SocialTableViewModel {
    var socialList : [MovieDetailModel]
    
    func numberOfSection() -> Int {
        return socialList.count
    }
    func socialAtIndex(_ index: Int) -> MovieDetailViewModel {
        let socials = self.socialList[index]
        return MovieDetailViewModel(social: socials)
    }
}
//struct SocialListViewModel {
//    var socialList : [MovieDetailModel]
//    
//    func numberOfRowSection() -> Int {
//        return 10
//    }
//    
//    func socialAtIndex(_ index: Int) -> MovieDetailViewModel {
//        let socialsCard = self.socialList[index]
//        return MovieDetailViewModel(social: socialsCard)
//    }
//}

struct MovieDetailViewModel {
    let social : MovieDetailModel
    
    var name : String {
        return self.social.movieTitle
    }
    
    var date : Int {
    
        return self.social.movieYear
}
    var genre : String {
        return self.social.movieGenre
    }
    var image : String {
        return self.social.movieImage
    }
    
}

