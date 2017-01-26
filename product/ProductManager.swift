//
//  MovieManager.swift
//  movieApp
//
//  Created by David Ciaffoni on 10/16/16.
//  Copyright © 2016 David Ciaffoni. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ProductManagerDelagte {
    func didLoadProducts()
}

class ProductManager {
    var productArray = [Product]()
    var delegate: ProductManagerDelagte?
    
    func loadproducts() {
        
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = JSON(data: data)
                if json != JSON.null {
                    print("jsonData:\(json)")
                    
                    let entries = json["product_sales"].array!
                    
                    for entry in entries {
                        let title = entry["name"].string!
                        let price = entry["price"].string!
                        let image = entry["default_photo"].string!
                        
                        print("****************")
                        print(title)
                        print("****************")
                        print(price)
                        print("****************")
                        print(image)
                        
                        let tempProduct : Product = Product(title : title, price : price, image : image)
                        self.productArray.append(tempProduct)
                        
                    }
                    
                    //
                    if let delegate = self.delegate {
                        DispatchQueue.main.async {
                            delegate.didLoadProducts()
                        }
                        
                    }

                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
        
        
//        let itunes = "http://www.touchofmodern.com/iconic/category/bedroom.json"
//        let url = URL(string: itunes)!
//        
//        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            guard let data = data else {
//                print("data was nil")
//                return
//            }
//            
//            let json = JSON(data: data)
//            print(json)
//            let entries = json["id"].array!
//            
//            for entry in entries {
//                let title = entry["name"].string!
//                let price = entry["price"].string!
//                let image = entry["photo"]["url"].string!
//                
//                print("****************")
//                print(title)
//                print("****************")
//                print(price)
//                print("****************")
//                print(image)
//                
//                let tempProduct : Product = Product(title : title, price : price, image : image)
//                self.productArray.append(tempProduct)
//                
//            }
//            
//            // 
//            if let delegate = self.delegate {
//                DispatchQueue.main.async {
//                    delegate.didLoadProducts()
//                }
//                
//            }
//            
//        }
//        
//        session.resume()
//    }
}







