//
//  LocationService.swift
//  WeatherSense
//
//  Created by Student on 31/01/2024.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    enum Result <T> {
      case Success(T)
      case Failure(Error)
    }

    static let shared: LocationService = LocationService()

    typealias Callback = (Result <CLLocation?>) -> Void

    var requests: Array <Callback> = Array <Callback>()

    var location: CLLocation? { return sharedLocationManager.location  }

    lazy var sharedLocationManager: CLLocationManager = {
        let newLocationmanager = CLLocationManager()
        newLocationmanager.delegate = self
        return newLocationmanager
    }()


    class func authorize() { shared.authorize() }
    func authorize() { sharedLocationManager.requestWhenInUseAuthorization() }


    func locate(callback: @escaping Callback) {
        self.requests.append(callback)
        sharedLocationManager.startUpdatingLocation()
    }

    func reset() {
        self.requests = Array <Callback>()
        sharedLocationManager.stopUpdatingLocation()
    }


    func locationManager(manager: CLLocationManager, didFailWithError error: Error) {
        for request in self.requests { request(.Failure(error)) }
        self.reset()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: Array <CLLocation>) {
        for request in self.requests { request(.Success(self.location)) }
        self.reset()
    }

}
