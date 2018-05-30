//
//  CustomAlert.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 27/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class CustomAlert: UIViewController {
    @IBOutlet weak var textHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var txtview:UITextView!
    @IBOutlet weak var containerView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
    self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    override func viewWillAppear(_ animated: Bool) {
        adjustTextViewHeight()
    }
    override func viewDidAppear(_ animated: Bool) {
        
    
    }
    func adjustTextViewHeight() {
        //let fixedWidth = txtview.frame.size.width
        let fixedWidth = CGFloat(600)

        let newSize = txtview.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        self.textHeightConstraint?.constant = newSize.height
        self.view.layoutIfNeeded()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCloseaction(id:UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
