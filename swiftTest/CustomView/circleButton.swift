//
//  circleButton.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class circleButton: UIButton {

    required init?(coder adecoder:NSCoder) {
        super.init(coder: adecoder)
        print ("called required init")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setbuttonStyle()
    }
    override func awakeFromNib() {
        self.setbuttonStyle()
        print("called awakeFromNib")
    }
    
    func setbuttonStyle(){
        self.layer.cornerRadius = self.bounds.width / 2
        self.backgroundColor = UIColor.blue
    }
    
}
