//
//  dataType.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 23/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
struct abc{
    var name:String = "anuran"
    let age:Int = 5
}
struct xyz{
    var name:String
    let age:Int
}

class c1{
    func t(){
        var obj = abc()
        obj.name = "Sipu"
        var o1 = xyz(name: "sipu", age: 77) // xyz() will give error
    }
    
    func t2(){
        var groups = [Any]()
        groups.append(1.0)
        groups.append(1)
        groups.append("string")
        
        for item in groups {
            switch item {
            case let anInt as Int:
                print("\(item) is an int")
            case let aDouble as Double:
                print("\(item) is a double")
            case let aString as String:
                print("\(item) is a string")
                
            default:
                print("dunno")
            }
        }
    }
}

func data(){
let name: String? = nil
let unwrappedName = name ?? "Anonymous"
    print(unwrappedName)
    print("Hello, \(name ?? "Anonymous")!")
    
    var surname:String?
    surname = "Ghosh"
    surname = nil
    print(surname ?? "Default")
}
