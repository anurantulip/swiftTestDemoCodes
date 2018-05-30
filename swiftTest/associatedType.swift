//
//  associatedType.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
//The idea is that you can define a protocol with functions that take in a type that is defined by the object that uses that protocol:
protocol Animal {
    // the type Food can be any type
    // - Array, String, Enum, etc
    associatedtype Food
    
    // the function eat takes in the unknown type!
    func eat(food: Food)
}
// Cow
struct Cow: Animal {
    // For the Cow, the Food is of String Type
    typealias Food = String
    
    func eat(food: Food) {
        print("My food can be any string!!! But it is \(food)")
    }
}
let cow = Cow()
//cow.eat("corn")

// Chicken
struct Chicken: Animal {
    
    // For the Chicken, the Food is of Enum Type
    enum Food: String {
        case Grass, Corn
    }
    
    func eat(food: Food) {
        switch food {
        case .Grass:
            print("my food is a grass enum")
        case .Corn:
            print("my food is a corn enum")
        }
    }
}
let chicken = Chicken()
//chicken.eat(food: .Grass)

// Dog
struct Dog: Animal {
    // For the Dog, the Food is an Array of Strings Type
    typealias Food = [String]
    
    func eat(food: Food) {
        food.forEach {
            print("I'm eating an array of food. Currently \($0)")
        }
    }
}

let dog = Dog()
//dog.eat(["cake", "treat", "bone"])

//This means that if you want to have a protocol extension with a default implementation for the eat function, you need to specify the type:

extension Animal where Food: ExpressibleByStringLiteral {
    
    // default implementation of eat
    // if the Food is a String
    func eat(food: Food) {
        print("My food can be any string!!! But it is \(food)")
    }
}

let cow2 = Cow()
//cow2.eat("corn") // "My food can be any string!!! But it is corn"
