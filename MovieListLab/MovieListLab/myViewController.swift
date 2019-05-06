//
//  myViewController.swift
//  MovieListLab
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class myViewController: UIViewController {

    @IBOutlet weak var genreTxt: UITextField!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var imgTxt: UITextField!
    @IBOutlet weak var ratingTxt: UITextField!
    @IBOutlet weak var releaseTxt: UITextField!
	
	var myProtocol : addMovieProtocol?
	
    @IBAction func addBtn(_ sender: UIButton) {
        var movie = Movie (title: titleTxt.text! , image: imgTxt.text!, rating: Float (ratingTxt.text!)!, releaseYear: Int (releaseTxt.text!)!, genre: genreTxt.text!)
        var view = myTableViewController()
        view.addMovie(movie: movie)
        
        
//        movie.genre = genreTxt.text!
//        movie.title = titleTxt.text!
//        movie.image = imgTxt.text!
//        movie.rating = Float (ratingTxt.text!)!
//        movie.releaseYear = Int (releaseTxt.text!)!
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
