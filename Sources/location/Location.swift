import CoreLocation

struct Location: Encodable {
    let location: CLLocation
    var address: String?

    init(_ location: CLLocation) {
        self.location = location
    }

    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case altitude
        case speed
        case course
        case horizontalAccuracy = "h_accuracy"
        case verticalAccuracy = "v_accuracy"
        case timestamp
        case address
    }

    public func encode(to encoder: Encoder) throws {
        var encoder = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encode(self.location.coordinate.latitude, forKey: .latitude)
        try encoder.encode(self.location.coordinate.longitude, forKey: .longitude)
        try encoder.encode(self.location.altitude, forKey: .altitude)
        try encoder.encode(self.location.speed, forKey: .speed)
        try encoder.encode(self.location.course, forKey: .course)
        try encoder.encode(self.location.horizontalAccuracy, forKey: .horizontalAccuracy)
        try encoder.encode(self.location.verticalAccuracy, forKey: .verticalAccuracy)
        try encoder.encode(self.location.timestamp, forKey: .timestamp)

        if let address = self.address {
            try encoder.encode(address, forKey: .address)
        }
    }
}
