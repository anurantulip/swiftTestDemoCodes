//
//  customerDetails.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 07/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class customerDetails: UIViewController {
    @IBOutlet weak var lblcustomerName:UILabel!
    @IBOutlet weak var lblDataBalance:UILabel!
    @IBOutlet weak var lblProductName:UILabel!
    @IBOutlet weak var lblProductPrice:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let customerObj = customer.sharedInstance
        lblcustomerName.text = customerObj.name
        lblDataBalance.text = customerObj.dataBalance
        lblProductName.text = customerObj.productName
        lblProductPrice.text = customerObj.productPrice
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
