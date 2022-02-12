//
//  MovieViewModel.swift
//  Papcorns
//
//  Created by MERT on 10.02.2022.
//

import Foundation
import UIKit

struct MovieListViewModel {
    var movieList : [MovieModel]
    
    func numberOfRowSection() -> Int {
        return self.movieList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movies = self.movieList[index]
        return MovieViewModel(movie: movies)
    }
    func popularAtIndex(_ index: Int) -> MovieViewModel {
            let movies = self.movieList[index]
            return MovieViewModel(movie: movies)
    }
    
}

struct MovieViewModel {
    let movie : MovieModel
    
    var name : String {
        return self.movie.userFullName
    }
    
    var date : String {
    
        return self.movie.createdAt
}
    var like : Int {
        return self.movie.likeCount
    }
    var image : String {
        return self.movie.userImageUrl
    }
    
}
