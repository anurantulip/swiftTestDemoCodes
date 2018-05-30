//
//  RoundButton.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
import UIKit
/*
 init(frame:) is for programmatically created buttons
 init?(coder:) is for Storyboard/.xib created buttons
 prepareForInterfaceBuilder() is called within the Storyboard editor itself for rendering @IBDesignable controls
 */
@IBDesignable class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    /*
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
 */
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
        print("called required init?")
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
        print("called prepareForInterfaceBuilder")
    }
    
    func sharedInit() {
        // Common logic goes here
        self.backgroundColor = UIColor.red
        refreshCorners(value: cornerRadius)
    }
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
}

