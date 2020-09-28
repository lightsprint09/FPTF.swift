public struct Line: Item {
    public let type = "line"

    public var id: String?
    public var name: String?
    public var mode: Mode
    public var `operator`: Ref<Operator>

    public init(id: String?, name: String?, mode: Mode, operator: Ref<Operator>) {
        self.id = id
        self.name = name
        self.mode = mode
        self.operator = `operator`
    }
}
