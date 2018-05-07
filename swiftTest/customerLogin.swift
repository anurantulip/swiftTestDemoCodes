//
//  customerLogin.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 07/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class customerLogin: UIViewController {
    @IBOutlet weak var btnSubmit:UIButton!
    @IBOutlet weak var txtMsn:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setview()
    }
    func setview(){
        btnSubmit.isEnabled = false
        btnSubmit.alpha = 0.5
        let paddingView = UIView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        txtMsn.leftView = paddingView
        txtMsn.leftViewMode = .always
        txtMsn.placeholder = "Enter MSN"
        txtMsn.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        btnSubmit.isEnabled = false
        btnSubmit.alpha = 0.5
        if(!txtMsn.text!.trim().isEmpty)
        {
            btnSubmit.isEnabled = true
            btnSubmit.alpha = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnSubmitAction(id:UIButton){
        txtMsn.resignFirstResponder()
        if(txtMsn.text == customer.sharedInstance.msn){
            let customerDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customerDetails") as! customerDetails
            self.navigationController?.pushViewController(customerDetails, animated: true)
        }else{
            let alert = UIAlertController(title: "Oops", message: "Wrong MSN", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
extension String {
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}
