//
//  ViewController.swift
//  NetworkLab
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 Esraa And Passant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var currentMovie = Movie(title: "", image: "", rating: 0.0, releaseYear: 0, genre: "" )
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = currentMovie.title
        genreLabel.text = currentMovie.genre
        releaseLabel.text=String (currentMovie.releaseYear)
        rateLabel.text=String(currentMovie.rating)
        
       // imgView.image = UIImage(named: currentMovie.image)
        
        
        let url = URL (string: currentMovie.image)
        
        let request = URLRequest (url: url!)
        let session = URLSession (configuration: URLSessionConfiguration.default)
        let task = session.downloadTask(with: request) { (data, response, error) in
            do{
                var output = try! Data(contentsOf: data!)
                
                
                DispatchQueue.main.async {
                    
                    self.imgView.image = UIImage(data: output)
                }
            }catch{
                print("Error")
            }
            
            }.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

