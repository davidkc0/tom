//
//  MovieManager.swift
//  movieApp
//
//  Created by David Ciaffoni on 10/16/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol MovieManagerDelagte {
    func didLoadMovies()
}

class MovieManager {
    var moviesArray = [Movie]()
    var delegate: MovieManagerDelagte?
    
    func loadmovies() {
        let itunes = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: itunes)!
        
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            let json = JSON(data: data)
            let entries = json["feed"]["entry"].array!
            
            for entry in entries {
                let movieName = entry["im:name"]["label"].string!
                let movieSummary = entry["summary"]["label"].string!
                let movieGenre = entry["category"]["attributes"]["label"].string!
                
                print("****************")
                print(movieName)
                print("****************")
                print(movieSummary)
                print("****************")
                print(movieGenre)
                
                let tempMovie : Movie = Movie(movieSummary: movieSummary, movieTitle: movieName, movieGenre: movieGenre)
                self.moviesArray.append(tempMovie)
                
            }
            
            // 
            if let delegate = self.delegate {
                DispatchQueue.main.async {
                    delegate.didLoadMovies()
                }
                
            }
            
        }
        
        session.resume()
    }
}







