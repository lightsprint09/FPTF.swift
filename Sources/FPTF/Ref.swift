public enum Ref<T: Item>: Codable, Equatable {
    case reference(String)
    case inline(T)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let ref = try? container.decode(String.self) {
            self = .reference(ref)
        } else {
            let inline = try container.decode(T.self)
            self = .inline(inline)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .reference(let ref):
            try container.encode(ref)
        case .inline(let inline):
            try container.encode(inline)
        }
    }
}

extension Ref: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: Ref.StringLiteralType) {
        self = .reference(value)
    }
}

public enum RefTwo<A: Item, B: Item>: Codable, Equatable {
    case reference(String)
    case inlineA(A)
    case inlineB(B)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let ref = try? container.decode(String.self) {
            self = .reference(ref)
        } else if let a = try? container.decode(A.self) {
            self = .inlineA(a)
        } else {
            let b = try container.decode(B.self)
            self = .inlineB(b)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .reference(let ref):
            try container.encode(ref)
        case .inlineA(let a):
            try container.encode(a)
        case .inlineB(let b):
            try container.encode(b)
        }
    }
}

extension RefTwo: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: RefTwo.StringLiteralType) {
        self = .reference(value)
    }
}

public enum RefThree<A: Item, B: Item, C: Item>: Codable, Equatable {
    case reference(String)
    case inlineA(A)
    case inlineB(B)
    case inlineC(C)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let ref = try? container.decode(String.self) {
            self = .reference(ref)
        } else if let a = try? container.decode(A.self) {
            self = .inlineA(a)
        } else if let b = try? container.decode(B.self) {
            self = .inlineB(b)
        } else {
            let c = try container.decode(C.self)
            self = .inlineC(c)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .reference(let ref):
            try container.encode(ref)
        case .inlineA(let a):
            try container.encode(a)
        case .inlineB(let b):
            try container.encode(b)
        case .inlineC(let c):
            try container.encode(c)
        }
    }
}

extension RefThree: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: RefThree.StringLiteralType) {
        self = .reference(value)
    }
}
