//
//  movie.swift
//  movieApp
//
//  Created by David Ciaffoni on 10/16/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation

class Movie {
    var movieTitle: String
    var movieSummary: String
    
    init(movieSummary: String, movieTitle: String) {
        self.movieTitle = movieTitle
        self.movieSummary = movieSummary
    }
    
    
}
