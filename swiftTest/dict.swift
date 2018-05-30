//
//  dict.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 23/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
class r{
    let d = [String:Int]()
}
func dict(){
    let d = [String:Int]()
    let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
    for val in countryCodes.values{
        print (val)
    }
    for key in countryCodes.keys{
        print (key)
    }
    let a = Array(countryCodes.keys)
    let index = countryCodes.index(forKey: "BR")
    
}
