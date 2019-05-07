//
//  ViewController.swift
//  URLSessionDemo
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activityIndecator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndecator.center = view.center
        self.view.addSubview(activityIndecator)
        
        
    }

    @IBOutlet weak var myLabel: UILabel!
    @IBAction func startTaskBtn(_ sender: UIButton) {
        let url = URL (string : "https://api.androidhive.info/json/movies.json")
        let request = URLRequest (url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        //UIApplication.shared.isNetworkActivityIndicatorVisible = true  //indicator
        activityIndecator.startAnimating()       //custom indecator
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do{
            var output = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Array<Dictionary<String,Any>>
                var dict = output[0]
             print(dict["title"]!)
                
                DispatchQueue.main.async {
                    self.myLabel.text=dict["title"]! as? String
                    //UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                
            }catch{
                print("Error")
            }
        }.resume()
        
    }
    
}

