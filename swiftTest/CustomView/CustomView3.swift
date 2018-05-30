//
//  CustomView3.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class CustomView3: UIView , NibFileOwnerLoadable{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNibContent()
    }
    
    /*
     In the case you can’t use loadNibContent() (for example because you need a particular configuration for the subview) you can anyway use this protocol to instantiate only the XIB’s view by using instantiateFromNib() .
     */
}
