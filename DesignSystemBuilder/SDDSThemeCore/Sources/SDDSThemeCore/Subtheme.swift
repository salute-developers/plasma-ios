import Foundation

public enum Subtheme {
    case `default`
    case onDark
    case onLight
    case inverse
    case none
}

public struct SubthemeData {
    public let subtheme: Subtheme
    public let colorMapper: (Subtheme, ColorToken) -> ColorToken
    public let gradientMapper: (Subtheme, GradientToken) -> GradientToken
     
    public init(
        subtheme: Subtheme = .none,
        colorMapper: @escaping (Subtheme, ColorToken) -> ColorToken = { _, _ in ColorToken() },
        gradientMapper: @escaping (Subtheme, GradientToken) -> GradientToken = { _, _ in GradientToken() })
    {
        self.subtheme = subtheme
        self.colorMapper = colorMapper
        self.gradientMapper = gradientMapper
    }
    
    public var isNone: Bool {
        return subtheme == .none
    }
}

extension Subtheme {
    var identifiers: [String] {
        switch self {
        case .default:
            ["default"]
        case .onDark:
            ["onDark", "Dark"]
        case .onLight:
            ["onLight", "Light"]
        case .inverse:
            ["inverse"]
        case .none:
            []
        }
    }
    
    static var allIdentifiers: [String] {
        Subtheme.default.identifiers + Subtheme.onDark.identifiers + Subtheme.onLight.identifiers + Subtheme.inverse.identifiers
    }
}
