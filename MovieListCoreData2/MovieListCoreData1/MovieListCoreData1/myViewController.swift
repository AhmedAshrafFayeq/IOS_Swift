//
//  myViewController.swift
//  MovieListCoreData1
//
//  Created by JETS Mobil Lab -  on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class myViewController: UIViewController {
    
    var currentMovie = MovieClass()
    @IBOutlet weak var rateTxt: UILabel!
    @IBOutlet weak var releaseTxt: UILabel!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var imgLabel: UILabel!
    
    @IBOutlet weak var genreTxtView: UITextView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imgView.image = UIImage(named: currentMovie.image!)
        imgLabel.text = currentMovie.image
        titleTxt.text = currentMovie.title
        genreTxtView.text = ""
        for x in 0..<(currentMovie.genre?.count)!{
            genreTxtView.text?.append((currentMovie.genre?[x])!)
            genreTxtView.text?.append("\n")
        }
        releaseTxt.text = String(currentMovie.releaseDate!)
        rateTxt.text = String(currentMovie.rating!)

        // Do any additional setup after loading the view.
    }
    func setMovie(movie : MovieClass)
    {
        currentMovie = movie
        
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
