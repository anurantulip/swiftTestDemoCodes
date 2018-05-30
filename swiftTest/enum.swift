//
//  enum.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 20/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation

enum gender{ // enum without type, can't have raw value
    case Male
    case Female
}
enum mark:String{
    case Good
    case VeryGood = "Number above 500"
    func details() -> String{
        return self.rawValue
    }
}
enum serverError{
    case error1(reason:String)
    case error2(String,String)
}
class testEnum{
    func testEnum(){
        let m = mark.Good
        print(m.hashValue) // print 0
        print(mark.VeryGood.hashValue) // print 1
        print(mark.VeryGood.rawValue)  // Number above 500
        print(mark.VeryGood.details()) //// Number above 500
        let er = serverError.error1(reason:"not found")
        
        switch er {
        case .error1(reason: ""):
            print ("")
        case .error2(let s1, _):
            print(s1)
        default:
            print ("default")
        }
        
    }
}



