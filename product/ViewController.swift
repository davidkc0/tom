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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProductManagerDelagte {

    
    var array : [Product] = []
    let productManager = ProductManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productManager.delegate = self
        productManager.loadproducts()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            let dvc = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dvc.productData = array[indexPath.row]
        }
    }


    
    func didLoadProducts() {
        print("Did load Movies!!!!!!!!!!")
        array = productManager.productArray
            tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDataCell")
        
        cell?.textLabel?.text = productManager.productArray[indexPath.row].title
        cell?.detailTextLabel?.text = productManager.productArray[indexPath.row].price
        return cell!
    }
    
    
    
}

