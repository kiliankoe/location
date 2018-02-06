import CoreLocation
import Contacts

func print<T: Encodable>(json value: T) {
    do {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        let data = try encoder.encode(value)
        let str = String(data: data, encoding: .utf8)!
        print(str)
    } catch {
        exit(1)
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let follow: Bool
    let address: Bool

    init(follow: Bool, address: Bool) {
        self.follow = follow
        self.address = address
    }

    func start() {
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let cllocation = locations.first else { return }

        var location = Location(cllocation)

        if self.address {
            if #available(OSX 10.13, *) {
                self.geocoder.reverseGeocodeLocation(cllocation) { placemarks, _ in
                    if let postalAddress = placemarks?.first?.postalAddress {
                        let address = CNPostalAddressFormatter.string(from: postalAddress, style: .mailingAddress)
                        location.address = address
                    } else {
                        location.address = "n/a"
                    }
                    print(json: location)

                    if !self.follow {
                        exit(0)
                    }
                }
            } else {
                print(json: EncError("Address can only be included on macOS >= 10.13"))
                exit(1)
            }
        } else {
            print(json: location)

            if !follow {
                exit(0)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
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
