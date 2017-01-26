//
//  DetailViewController.swift
//  movieApp
//
//  Created by David Ciaffoni on 10/17/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var productData: Product? = nil
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let productData = productData else {
            return
        }
        titleLabel.text = productData.title
        genreLabel.text = productData.price
        descriptionLabel.text = productData.image
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
