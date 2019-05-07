//
//  myTableViewController.swift
//  coreDataDemo
//
//  Created by JETS Mobil Lab -  on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class myTableViewController: UITableViewController {

    //var movies = Array<MovieClass>()
    var movies = Array<NSManagedObject>()
    var counter = 1
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
//        movies.append(MovieClass(title: "movie \(counter)", releaseDate: 2009, rate: 7.3))
//        counter += 1
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managerContext)
        let movie = NSManagedObject (entity: entity!, insertInto: managerContext)
        
        movie.setValue("Movie \(counter) ", forKey: "title")
        movie.setValue(2000, forKey:"releaseDate")
        movie.setValue(5.9, forKey: "rate")
        do{
            try managerContext.save()
            movies.append(movie)
            counter += 1 
            self.tableView.reloadData()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var movie = MovieClass (title: "movie 1", releaseDate: 2000 , rate: 5.9)
//        movies.append(movie)
//        movies.append(MovieClass(title: "movie 2", releaseDate: 2009, rate: 7.3))
//        movies.append(MovieClass(title: "movie 3", releaseDate: 2019, rate: 9.3))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        //cell.textLabel?.text = movies[indexPath.row].title
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
