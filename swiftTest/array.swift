//
//  array.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 21/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//  http://chris.eidhof.nl/post/sort-descriptors-in-swift/

import Foundation

class testArray{
    struct student {
        var name: String
        var mark: Int
    }
    
    let studentArray = [
        student(name:"anuran",mark:100),
        student(name:"bumba",mark:200),
        student(name:"anupam",mark:300),
        student(name:"dipka",mark:400),
    ]
    

    func test(){
        
        let d = UserDefaults.standard
         d.set("", forKey: "anu")
        let p = d.object(forKey:"")
        let nameSortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        
        let markSortDescriptor = NSSortDescriptor(key: "mark", ascending: false)
        
        let sortedByAge = (studentArray as NSArray).sortedArray(using: [nameSortDescriptor,markSortDescriptor])
        print(sortedByAge)
        
    }
    func check(){
        
        var numbers = [15, 40, 10, 30, 60, 25, 5, 100]
        var name = ["A","B","C"];
        var t = numbers.index(of: 40)
        numbers[0..<4].sort()
        print(numbers)
        // Prints "[10, 15, 30, 40, 60, 25, 5, 100]"
        //Here’s an example that sorts the first half of an array of integers:
        
        var array = [1,2,5,3,4,8,6,7,9,10]
        var a = array.sorted()
        var b = a.map{ $0 * 2 }.filter{ $0 % 3 == 0 }.reduce(0,+)
        let numberSum = array.reduce(0, { x, y in
            x + y
        })
        
        var dictionary = ["foo": 1, "bar": 2, "baz": 5]
        var v = dictionary["anu", default: 0]
        
        let newDictionary2 = dictionary.mapValues { $0 * 2 }
        
        let tupleArray = dictionary.map { ($0,$1 * 2)}
        let newDictionary = Dictionary(uniqueKeysWithValues: tupleArray)
        
        
        //print(tupleArray) // prints: ["baz": 6, "foo": 2, "bar": 3]
        var favoriteTVShows = ["Red Dwarf", "Blackadder", "Fawlty Towers", "Red Dwarf"]
        var favoriteCounts = [String: Int]()
        
        for show in favoriteTVShows {
            favoriteCounts[show, default: 0] += 1
        }
        //print(favoriteCounts)
        print(favoriteCounts)
        
        
        let digitWords = ["one", "two", "three", "four", "five"]
        let digit = [1,2,7,4,5]
        //let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, 1...5))
        let wordToValue = Dictionary(uniqueKeysWithValues: zip(digitWords, digit))
        print(wordToValue["three"]!)
        
        let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
        if let firstCountry = countryCodes.first {
            print("First value in dictionary is : \(firstCountry)")
        }
        
        var i = countryCodes.index(forKey: "BR")
        print(i)
        
        
        

    }
}
