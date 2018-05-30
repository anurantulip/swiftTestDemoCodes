//
//  jsonParser.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 07/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

//  https://medium.com/swiftly-swift/swift-4-decodable-beyond-the-basics-990cc48b7375
// http://roadfiresoftware.com/2018/02/how-to-parse-json-with-swift-4/
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
