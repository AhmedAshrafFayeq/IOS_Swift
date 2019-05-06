//
//  ViewController.swift
//  MovieListLab
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseYear: UILabel!
    @IBOutlet weak var rating: UILabel!
    var currentMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: "" )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgView.image = UIImage(named: currentMovie.image) 
        titleLabel.text = currentMovie.title
        genre.text = currentMovie.genre
        releaseYear.text=String (currentMovie.releaseYear)
        rating.text=String(currentMovie.rating)
    }
    func setMovie(movie : Movie)
    {
        currentMovie.image=movie.image
        currentMovie.title=movie.title
        currentMovie.genre=movie.genre
        currentMovie.releaseYear = movie.releaseYear
        currentMovie.rating = movie.rating

    }


}

