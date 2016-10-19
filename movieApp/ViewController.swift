//
//  ViewController.swift
//  movieApp
//
//  Created by David Ciaffoni on 10/16/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieManagerDelagte {
    
    var array : [Movie] = []
    let movieManager = MovieManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieManager.loadmovies()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let dvc = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dvc.movieData = array[indexPath.row]
        }
    }


    
    func didLoadMovies() {
        print("Did load Movies!!!!!!!!!!")
        array = movieManager.moviesArray
            tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieManager.moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDataCell")
        
        cell?.textLabel?.text = movieManager.moviesArray[indexPath.row].movieTitle
        cell?.detailTextLabel?.text = movieManager.moviesArray[indexPath.row].movieSummary
        return cell!
    }
    
    
    
}

