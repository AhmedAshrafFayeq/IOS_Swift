//
//  ViewController.swift
//  MovieListCoreData1
//
//  Created by JETS Mobil Lab -  on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var movies = Array<NSManagedObject>()
    var myProtocol : MovieProtocol?

    @IBOutlet weak var genreTxt: UITextField!
    @IBOutlet weak var rateTxt: UITextField!
    @IBOutlet weak var imgTxt: UITextField!
    @IBOutlet weak var releaseTxt: UITextField!
    @IBOutlet weak var titleTxt: UITextField!
    
    @IBAction func doneBtn(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managerContext)
        let movie = NSManagedObject (entity: entity!, insertInto: managerContext)
        
        movie.setValue(titleTxt.text, forKey: "title")
        movie.setValue(Int ( releaseTxt.text!), forKey:"releaseDate")
        movie.setValue(imgTxt.text, forKey:"image")
        movie.setValue(Float (rateTxt.text!), forKey:"rate")
        movie.setValue(genreTxt.text, forKey:"genre")

        do{
            try managerContext.save()
           
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        genreTxt.text = ""
        releaseTxt.text=""
        rateTxt.text=""
        imgTxt.text=""
        titleTxt.text=""
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

