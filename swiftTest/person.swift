//
//  person.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 13/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
/*
 https://useyourloaf.com/blog/swift-equatable-and-comparable/
 If you’re using Swift 4.1 or later, and have no special requirements, that’s your code complete – Swift can take care of the rest.
 
 If you’re on an earlier version of Swift, if you don’t just want to check all properties for equality, or if any of your properties are not also Equatable, then you need to write your own == function like this:
 
 if a array elements type equatable then we can user arr.contain(obj) function, if array element type comparable then we can user array.sort()
 */
struct Person {
    var name: String
    var age: String
    
    
}
extension Person : Comparable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    static func < (lhs:Person, rhs:Person) -> Bool{
        return lhs.age < rhs.age
    }
}

struct Complex<T> {
    let real: T
    let imaginary: T
}
var st = Complex(real:"", imaginary:"")
// MARK: Equatable


