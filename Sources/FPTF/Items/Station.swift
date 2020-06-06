/// Larger building or area that can be identified by a name. Usually represented by a single
/// node on a public transport map. Whereas a `Stop` usually specifies a location, a `Station`
/// is often a broader area that may span across multiple levels or buildings.
public struct Station: Item {
    public let type = "station"

    public var id: String
    public var name: String
    public var location: Location?
    public var regions: [Ref<Region>]?
    
    public var products: Products

    public init(id: String, name: String, location: Location?, regions: [Ref<Region>]?, products: Products) {
        self.id = id
        self.name = name
        self.location = location
        self.regions = regions
        self.products = products
    }
}

public struct Products: Codable, Equatable {
    public var nationalExpress: Bool
    public var national: Bool
    public var regionalExp: Bool
    public var regional: Bool
    public var suburban: Bool
    public var bus: Bool
    public var ferry: Bool
    public var subway: Bool
    public var tram: Bool
    public var taxi: Bool
}
