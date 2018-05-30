//
//  singleTone.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 25/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
final class MySingleton {
    static let shared = MySingleton()
    
    private let nameQueue = DispatchQueue(label: "name.accessor", qos: .default, attributes: .concurrent)
    private var _name = "Initial name"
    
    private init() {}
    
    var name: String {
        get {
            var name = ""
            nameQueue.sync {
                name = _name
            }
            
            return name
        }
        set {
            nameQueue.async(flags: .barrier) {
                self._name = newValue
            }
        }
    }
}
