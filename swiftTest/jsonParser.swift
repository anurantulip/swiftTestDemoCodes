//
//  jsonParser.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 07/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

class jsonParser{
    static var sharedInstance = jsonParser()
    private init(){
        loadJsonfile()
    }
    func loadJsonfile(){
        let url = Bundle.main.url(forResource: "collection", withExtension: "json")!
        
        // Load Data
        let data = try! Data(contentsOf: url)
        
        // Deserialize JSON
        let JSON = try! JSONSerialization.jsonObject(with: data, options: [])
    }
}
