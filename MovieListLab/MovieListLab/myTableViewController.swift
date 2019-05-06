//
//  myTableViewController.swift
//  MovieListLab
//
//  Created by JETS Mobil Lab -  on 5/5/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController , addMovieProtocol {
    var movies : [Movie]?

    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        var addView = self.storyboard?.instantiateViewController(withIdentifier: "addView") as! myViewController
        
        
        addView.myProtocol = self
        self.navigationController?.pushViewController(addView, animated: true)
        
    }
    func addMovie (movie : Movie){
        movies?.append(movie)
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var movie1 = Movie(title: "movie 1 ", image: "cr1.jpg", rating: 3.4, releaseYear: 2017, genre: "genre 1" )
        var movie2 = Movie(title: "movie 2 ", image: "cr2.jpg", rating: 3.4, releaseYear: 2018, genre: "genre 2" )
        var movie3 = Movie(title: "movie 3 ", image: "cr3.jpg", rating: 3.4, releaseYear: 2010, genre: "genre 3" )
        var movie4 = Movie(title: "movie 4 ", image: "cr4.jpg", rating: 3.4, releaseYear: 2012, genre: "genre 4" )
        var movie5 = Movie(title: "movie 5 ", image: "cr5.jpg", rating: 3.4, releaseYear: 2019, genre: "genre 5" )
        movies = [movie1 , movie2 , movie3 ,movie4 ,movie5]

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
        return (movies?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = movies![indexPath.row].title
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Movies"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
//        secondVC.titleLabel.text = movies![indexPath.row].title
//        secondVC.genre.text = movies![indexPath.row].genre
//        secondVC.img.text = movies![indexPath.row].image
//        secondVC.rating.text = String (movies![indexPath.row].rating )
//        secondVC.releaseYear.text = String (movies![indexPath.row].releaseYear)
        //secondVC.colleagueObject=[maleColleagues objectAtIndex:indexPath.row];
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondVC = ViewController()
        secondVC = (segue.destination as? ViewController)!
        secondVC.setMovie(movie: movies![(self.tableView.indexPathForSelectedRow?.row)!])
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
