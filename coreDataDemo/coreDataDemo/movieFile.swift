//
//  movieFile.swift
//  coreDataDemo
//
//  Created by JETS Mobil Lab -  on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import Foundation

class MovieClass {
    var title = ""
    var releaseDate = 2000
    var rate : Float = 0.0
    init(title : String , releaseDate : Int , rate : Float) {
        self.rate = rate
        self.releaseDate=releaseDate
        self.title = title
    }
}
