//
//  location.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 13/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import UIKit
import CoreLocation
class location: UIViewController, CLLocationManagerDelegate {
    var locationmanager: CLLocationManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
          First, open your Info.plist file, add key called “Privacy - Location Always and When In Use Usage Description” and "Privacy - Location When In Use Usage Description”, then give both of them whatever text you want to show to users when you ask for their location.
         */
        
        /*
         The final step is to tell Xcode that we want location updates to continue being delivered while the app is in the background. Select your project using the project navigator, then find your app’s target and choose the Capabilities tab. You need to enable Background Modes, then check the box marked “Location updates”.
         */
        locationmanager = CLLocationManager()
        locationmanager?.delegate = self
        locationmanager?.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            // give alert to user
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let latitude = locations.last?.coordinate.latitude ,let longitude = locations.last?.coordinate.longitude {
            print ("Lat:\(latitude) Long:\(longitude)")
        }
        
        
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
