import CoreLocation

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let follow: Bool

    init(follow: Bool) {
        self.follow = follow
    }

    func start() {
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let json = try JSONEncoder().encode(location.coordinate)
            let str = String(data: json, encoding: .utf8)!
            print(str)

            if !follow {
                exit(0)
            }
        } catch let error {
            print(error.localizedDescription)
            exit(1)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            break
        case .notDetermined:
            break
        case .denied:
            print("Location Access Denied.")
            exit(1)
        case .restricted:
            print("Location Access Restricted.")
            exit(1)
        case _:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        exit(1)
    }
}
