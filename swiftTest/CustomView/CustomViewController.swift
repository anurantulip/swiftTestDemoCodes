//
//  CustomViewController.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 26/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    @IBOutlet weak var viewCustom:CustomView!
    @IBAction func show_alert_action(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlert") as! CustomAlert
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCustom.textLabel.text = "Anuran"
        
        
        /*
         This approach is used when you need to initialize your UIView directly from your UIViewController instead of its XIB file. I am using the same UIView extension that was mentioned above.
         

         let customView = CustomView().loadNib() as! CustomView
         customView.frame = /* add your frame */
         view.addSubview(customView)
         */
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
