public struct Schedule: Item, Codable {
    public let id: String
    public let route: Ref<Route>
    public let mode: Mode
    public let sequence: [Element]
    public let starts: [Int]

    public init(id: String, route: Ref<Route>, mode: Mode, sequence: [Element], starts: [Int]) {
        self.id = id
        self.route = route
        self.mode = mode
        self.sequence = sequence
        self.starts = starts

        if let last = sequence.last {
            // is failing here the best option? Maybe an optional or throwing initializer?
            assert(last.arrival != nil)
        }

        for element in sequence[..<(sequence.count - 1)] {
            assert(element.departure != nil)
        }
    }

    public struct Element: Codable {
        public let arrival: Int? // required for last stop
        public let departure: Int? // required for all but last stop

        public init(arrival: Int?, departure: Int?) {
            self.arrival = arrival
            self.departure = departure
        }
    }
}
