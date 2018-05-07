//
//  customer.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 07/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

class customer{
    static let sharedInstance = customer()
    var name:String?
    var msn:String?
    var dataBalance:String?
    var productName:String?
    var productPrice:String?
    
    private init(){
        loadJsonfile()
    }
    func loadJsonfile(){
        print ("loadJsonfile called")
        let url = Bundle.main.url(forResource: "collection", withExtension: "json")!
        // Load Data
        let data = try! Data(contentsOf: url)
        // Deserialize JSON
        if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String : Any],
            let data = json["data"] as? [String : Any],
            let included = json["included"] as? [[String : Any]],
            
            let firstName = (data["attributes"] as? [String : Any])?["first-name"] as? String ,
            let lastName = (data["attributes"] as? [String : Any])?["last-name"] as? String ,
            
            let msn = (included[0]["attributes"] as? [String : Any])?["msn"] as? String,
        
            let dataBalance = (included[1]["attributes"] as? [String : Any])?["included-data-balance"] as? Int,
            let productName = (included[2]["attributes"] as? [String : Any])?["name"] as? String,
             let productPrice = (included[2]["attributes"] as? [String : Any])?["price"] as? Int {
            
            self.name = firstName + " " + lastName
            self.dataBalance = String(dataBalance)
            self.productName = productName
            self.productPrice = String(productPrice)
            self.msn = msn
 
            print ("Data received.")
        }else{
            print ("error........")
        }
        
        
    }
}
