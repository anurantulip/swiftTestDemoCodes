//
//  CustomView.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//  https://medium.com/@brianclouser/swift-3-creating-a-custom-view-from-a-xib-ecdfe5b3a960

import UIKit

 class CustomView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var textLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func btnShowAction(id:UIButton){
        self.textLabel.text = "Gungun"
    }
    required init?(coder adecoder:NSCoder) {
      super.init(coder: adecoder)
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        /*
        if let customView = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? CustomView {
            
               self.addSubview(customView)
        }
 */
    }
}
