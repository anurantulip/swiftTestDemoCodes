//
//  CustomView2.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

@IBDesignable class CustomView2: NibView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        print("called required init?")
    }
    
    override func prepareForInterfaceBuilder() {
        setView()
        print("called prepareForInterfaceBuilder")
    }

    func setView(){
        
        //self.backgroundColor = UIColor.cyan
    }
}
