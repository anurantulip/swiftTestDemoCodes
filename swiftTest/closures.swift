//
//  closures.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

class closureTest{
    lazy var t = {
        return "anuran"
    }()
    var x:Int?
    var com : Int {
        get{
            return 3
        }
        set(c){
            self.x = c
        }
    }
    // closure as property
    var onDataUpdate: ((_ data: String) -> Void)?
    
    func downLoadDataFromUrl(_ url:String, oncomplete:(_ data:String)->()){
        oncomplete("Anuran")
    }
    
    func requestData(completion: ((_ data: String) -> Void)) {
        // the data was received and parsed to String
        let data = "Data from wherever"
        completion(data)
    }
    func dataRequest() {
        // the data was received and parsed to String
        let data = "Data from wherever"
        
        onDataUpdate?(data)
    }
}


