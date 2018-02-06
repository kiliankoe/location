import CoreLocation

func print<T: Encodable>(json value: T) {
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(value)
        let str = String(data: data, encoding: .utf8)!
        print(str)
    } catch {
        exit(1)
    }
}

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

        print(json: location.coordinate)

        if !follow {
            exit(0)
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            break
        case .notDetermined:
            break
        case .denied:
            print(json: EncError("Location access denied"))
            exit(1)
        case .restricted:
            print(json: EncError("Location access restricted"))
            exit(1)
        case _:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(json: EncError(error.localizedDescription))
        exit(1)
    }
}
