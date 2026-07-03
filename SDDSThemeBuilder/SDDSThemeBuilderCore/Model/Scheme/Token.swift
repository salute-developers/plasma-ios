import Foundation

struct Token: Codable {
    let type: TokenKind
    let name: String
    let tags: [String]
    let displayName: String
    let description: String
    let enabled: Bool
}

struct TokensMetaFile: Codable {
    let name: String
    let version: String
    let tokens: [TokenMetaEntry]
}

struct TokenMetaEntry: Codable {
    let theme: String
    let type: String
    let name: String
    let displayName: String
    let description: String
    let tenant: String
    let reference: String
    let themeReference: String
    let value: JSONValue
}

indirect enum JSONValue: Codable {
    case string(String)
    case number(Double)
    case bool(Bool)
    case array([JSONValue])
    case object([String: JSONValue])
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Double.self) {
            self = .number(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .array(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .object(value)
        } else {
            self = .null
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .number(let value):
            if value == value.rounded(), abs(value) < 1e15 {
                try container.encode(Int(value))
            } else {
                try container.encode(value)
            }
        case .bool(let value):
            try container.encode(value)
        case .array(let value):
            try container.encode(value)
        case .object(let value):
            try container.encode(value)
        case .null:
            try container.encodeNil()
        }
    }

    static func make(from any: Any) -> JSONValue {
        if let number = any as? NSNumber {
            if CFGetTypeID(number) == CFBooleanGetTypeID() {
                return .bool(number.boolValue)
            }
            return .number(number.doubleValue)
        }
        switch any {
        case let value as String:
            return .string(value)
        case let value as [Any]:
            return .array(value.map { JSONValue.make(from: $0) })
        case let value as [String: Any]:
            return .object(value.mapValues { JSONValue.make(from: $0) })
        default:
            return .null
        }
    }
}

struct TokenMetaResolver {
    let namespace: String
    let colorJson: [String: Any]
    let gradientJson: [String: Any]
    let typographyJson: [String: Any]
    let shadowJson: [String: Any]
    let shapeJson: [String: Any]
    let spacingJson: [String: Any]

    func entries(for tokens: [Token]) -> [TokenMetaEntry] {
        tokens.compactMap { entry(for: $0) }
    }

    func entry(for token: Token) -> TokenMetaEntry? {
        guard token.enabled else { return nil }
        switch token.type {
        case .color:
            return modeEntry(token, json: colorJson, tokenType: "ColorToken", isGradient: false)
        case .gradient:
            return modeEntry(token, json: gradientJson, tokenType: "GradientToken", isGradient: true)
        case .typography:
            return typographyEntry(token, json: typographyJson)
        case .shadow:
            return plainEntry(token, json: shadowJson, tokenType: "ShadowToken")
        case .shape:
            return plainEntry(token, json: shapeJson, tokenType: "ShapeToken")
        case .spacing:
            return spacingEntry(token, json: spacingJson)
        case .fontFamily:
            return nil
        }
    }

    func modeEntry(_ token: Token, json: [String: Any], tokenType: String, isGradient: Bool) -> TokenMetaEntry? {
        let components = token.name.tokenComponents
        guard let mode = components.first, mode == Mode.light.rawValue || mode == Mode.dark.rawValue else { return nil }
        let varName = Array(components.dropFirst()).camelCase
        guard let modeDict = json[varName] as? [String: Any], let raw = modeDict[mode] else { return nil }
        let value: JSONValue = isGradient
            ? jsonValueConvertingColors(raw)
            : .string(Self.argb(fromRGBAHex: (raw as? String) ?? ""))
        return makeEntry(token, theme: mode, varName: varName, tokenType: tokenType, value: value)
    }

    func typographyEntry(_ token: Token, json: [String: Any]) -> TokenMetaEntry? {
        let components = token.name.keyComponents
        guard let screenRaw = components.first, let screen = ScreenSize(rawValue: screenRaw) else { return nil }
        let varName = Array(components.dropFirst()).camelCase
        guard let screensDict = json[varName] as? [String: Any], let raw = screensDict[screen.tokenValue.rawValue] else { return nil }
        return makeEntry(token, theme: "", varName: varName, tokenType: "AdaptiveTypographyToken", value: jsonValueConvertingColors(raw))
    }

    func plainEntry(_ token: Token, json: [String: Any], tokenType: String) -> TokenMetaEntry? {
        let varName = token.name.camelCase
        guard let raw = json[varName] else { return nil }
        return makeEntry(token, theme: "", varName: varName, tokenType: tokenType, value: jsonValueConvertingColors(raw))
    }

    func spacingEntry(_ token: Token, json: [String: Any]) -> TokenMetaEntry? {
        let varName = token.name.camelCase
        guard let raw = json[varName] else { return nil }
        let value: JSONValue
        if let dict = raw as? [String: Any], let number = dict["value"] {
            value = JSONValue.make(from: number)
        } else {
            value = JSONValue.make(from: raw)
        }
        return makeEntry(token, theme: "", varName: varName, tokenType: "SpacingToken", value: value)
    }

    private func makeEntry(_ token: Token, theme: String, varName: String, tokenType: String, value: JSONValue) -> TokenMetaEntry {
        TokenMetaEntry(
            theme: theme,
            type: token.type.rawValue,
            name: token.name,
            displayName: token.displayName,
            description: token.description,
            tenant: "",
            reference: Self.pascalCase(varName),
            themeReference: "\(namespace).\(tokenType).\(varName)",
            value: value
        )
    }

    func jsonValueConvertingColors(_ any: Any) -> JSONValue {
        switch any {
        case let value as String:
            return .string(value.hasPrefix("#") ? Self.argb(fromRGBAHex: value) : value)
        case let value as [Any]:
            return .array(value.map { jsonValueConvertingColors($0) })
        case let value as [String: Any]:
            return .object(value.mapValues { jsonValueConvertingColors($0) })
        default:
            return JSONValue.make(from: any)
        }
    }

    static func pascalCase(_ value: String) -> String {
        guard let first = value.first else { return value }
        return String(first).uppercased() + String(value.dropFirst())
    }

    static func argb(fromRGBAHex value: String) -> String {
        var hex = value.hasPrefix("#") ? String(value.dropFirst()) : value
        if hex.count == 6 { hex += "FF" }
        guard hex.count == 8 else { return value }
        let rr = String(hex.prefix(2))
        let gg = String(hex.dropFirst(2).prefix(2))
        let bb = String(hex.dropFirst(4).prefix(2))
        let aa = String(hex.dropFirst(6).prefix(2))
        return "0x" + (aa + rr + gg + bb).uppercased()
    }
}
