//
//  locationManager.swift
//  swiftTest
//
//  Created by Anuran Ghosh on 13/05/18.
//  Copyright © 2018 Anuran Ghosh. All rights reserved.
//

import Foundation
import CoreLocation
protocol LocationServiceDelegate {
    func tracingLocation(currentLocation: CLLocation)
    func tracingLocationDidFailWithError(error: NSError)
}  
class LocationService:NSObject,CLLocationManagerDelegate{
    static let sharedLocation = LocationService()
    var locationManager: CLLocationManager?
    var lastLocation: CLLocation?
    var delegate: LocationServiceDelegate?

    override private init(){
        
        super.init()
        self.locationManager = CLLocationManager()
        guard let locationManager = locationManager else {
            return
        }
        
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        };
        
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // you have 2 choice
            // 1. requestAlwaysAuthorization
            // 2. requestWhenInUseAuthorization
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
        locationManager.distanceFilter = 2000 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
        locationManager.delegate = self
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            // give alert to user
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else {return}
        if let latitude = locations.last?.coordinate.latitude ,let longitude = locations.last?.coordinate.longitude {
            print ("Lat:\(latitude) Long:\(longitude)")
        }
        
        guard let delegate = self.delegate else {
            return
        }
        delegate.tracingLocation(currentLocation: currentLocation)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        guard let delegate = self.delegate else {
            return
        }
        delegate.tracingLocationDidFailWithError(error: error as NSError)
    }
    func startUpdatingLocation() {
        print("Starting Location Updates")
        self.locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        print("Stop Location Updates")
        self.locationManager?.stopUpdatingLocation()
    }
}
