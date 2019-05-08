//
//  myTableViewController.swift
//  MovieListCoreData1
//
//  Created by JETS Mobil Lab -  on 5/7/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import CoreData

class myTableViewController: UITableViewController ,MovieProtocol{
    var movies = Array<NSManagedObject>()
    
    func addMovie(movie: MovieClass) {
        
        self.tableView.reloadData()
    }
    
    
    

    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        var addView = self.storyboard?.instantiateViewController(withIdentifier : "addView") as! ViewController
        addView.myProtocol = self
        self.navigationController?.pushViewController(addView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"Movie")
        do{
            movies = try managerContext.fetch(fetchRequest)
            self.tableView.reloadData()
        }catch{
            print("error")
        }
        
    }

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
        cell.textLabel?.text = movies[indexPath.row].value(forKey: "title") as! String
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondVC = myViewController ()
        secondVC = (segue.destination as? myViewController)!
        var currentMovie = MovieClass()
        currentMovie.image=movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "image") as! String
        currentMovie.title=movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "title") as! String
        currentMovie.genre=movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "genre") as! String
        currentMovie.releaseDate = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "releaseDate") as! NSDecimalNumber as! Int
        currentMovie.rating = movies[(self.tableView.indexPathForSelectedRow?.row)!].value(forKey: "rate") as! Float
        secondVC.setMovie(movie: currentMovie)
          
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
