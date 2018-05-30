//
//  Helper.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 13/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class Helper {
    static let sharedInstance = Helper()
    static let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    static let appDel = UIApplication.shared.delegate
    static var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    private init(){}
    
    
    
    func tt(){
        if #available(iOS 9, *) {
            iOS9Work()
        }
    }
    @available(iOS 8, *)
    func iOS8Work() {
        // do stuff
        
    }
    
    @available(iOS 9, *)
    func iOS9Work() {
        // do stuff
    }
}
