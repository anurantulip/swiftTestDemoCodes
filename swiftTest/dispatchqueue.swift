//
//  dispatchqueue.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

class dispatchQ{
    func test(){
        DispatchQueue.global(qos:.background).async{
            DispatchQueue.main.async{
                
            }
        }
        
        
        
        let s = DispatchQueue(label:"",qos:.background,attributes:.concurrent)
        s.sync {
            
        }
        s.asyncAfter(deadline:.now() + 200, execute: {
            
        })
    }
    
    
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    private var dictionary: [String: Any] = [:]
    
    public func set(_ value: Any?, forKey key: String) {
        // .barrier flag ensures that within the queue all reading is done
        // before the below writing is performed and
        // pending readings start after below writing is performed
        concurrentQueue.async(flags: .barrier) {
            self.dictionary[key] = value
        }
    }
}
