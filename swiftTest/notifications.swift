//
//  notifications.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 14/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class notifications: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setToPeru(notification:)), name: .peru, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setToArgentina(notification:)), name: .peru, object: nil)
        NotificationCenter.default.post(name: .peru, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @objc func setToArgentina(notification:Notification){
        
    }
   @objc func setToPeru(notification:Notification){
        
    }
    

}

extension Notification.Name{
    static let peru = Notification.Name("peru")
    static let argentina = Notification.Name("argentina")
}
