//
//  WebService.swift
//  Papcorns
//
//  Created by MERT on 10.02.2022.
//

import Foundation

class WebService {
    
    func downloadMovies(url: URL, completion: @escaping([MovieModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
               let movieList = try? JSONDecoder().decode([MovieModel].self, from: data)
                
                
                
                if let movieList = movieList{
                    completion(movieList)
                }
            }
        }.resume()
        
    }
    func downloadSocials(url: URL, completion: @escaping([MovieDetailModel]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
               let socialList = try? JSONDecoder().decode([MovieDetailModel].self, from: data)
                
                
                
                if let socialList = socialList{
                    completion(socialList)
                }
            }
        }.resume()
        
    }
    
}
