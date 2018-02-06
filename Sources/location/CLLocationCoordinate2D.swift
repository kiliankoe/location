import CoreLocation

extension CLLocationCoordinate2D: Encodable {
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    public func encode(to encoder: Encoder) throws {
        var encoder = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encode(self.latitude, forKey: .latitude)
        try encoder.encode(self.longitude, forKey: .longitude)
    }
}
