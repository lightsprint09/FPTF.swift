public struct Location: Item {
    public let type = "location"

    public let name: String?
    public let address: String?

    public let longitude: Double?
    public let latitude: Double?
    public let altitude: Double?

    public init(name: String?, address: String?, longitude: Double?, latitude: Double?, altitude: Double?) {
        self.name = name
        self.address = address
        self.longitude = longitude
        self.latitude = latitude
        self.altitude = altitude
    }
}

#if canImport(CoreLocation)
import class CoreLocation.CLLocation

public extension Location {
    public init(name: String?, address: String?, location: CLLocation) {
        self.name = name
        self.address = address
        self.longitude = location.coordinate.longitude
        self.latitude = location.coordinate.latitude
        self.altitude = location.altitude
    }
}
#endif
