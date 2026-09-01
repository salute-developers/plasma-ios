import Foundation

internal enum TokenGroup {
    case `default`
    case onDark
    case onLight
    case inverse
    case none
}

internal extension String {
    func tokenIdentifier(for subtheme: Subtheme) -> String {
        guard subtheme != .none else {
            return self
        }
        
        let currentId = self
        let tokenGroup = detectTokenGroup()
        
        guard subtheme.shouldOverrideTokens(withSubThemeGroup: tokenGroup) else {
            return currentId
        }
        
        guard let foundIdentifier = findIdentifier(for: tokenGroup) else {
            return currentId
        }
        
        let targetGroup: TokenGroup
        if tokenGroup == .inverse {
            targetGroup = subtheme.inverseGroup()
        } else {
            targetGroup = subtheme.toGroup()
        }
        
        guard targetGroup != tokenGroup else {
            return currentId
        }
        
        guard let targetIdentifier = getTargetIdentifier(for: targetGroup, originalCase: foundIdentifier) else {
            return currentId
        }
        
        guard let range = currentId.range(of: foundIdentifier) else {
            return currentId
        }
        
        return currentId.replacingCharacters(in: range, with: targetIdentifier)
    }
    
    private func detectTokenGroup() -> TokenGroup {
        let patterns: [(TokenGroup, [String])] = [
            (.onLight, ["OnLight", "onLight", "Light"]),
            (.onDark, ["OnDark", "onDark", "Dark"]),
            (.inverse, ["Inverse", "inverse"]),
            (.default, ["Default", "default"])
        ]
        
        return patterns.first { group, keywords in
            keywords.contains { self.contains($0) }
        }?.0 ?? .none
    }
    
    private func findIdentifier(for group: TokenGroup) -> String? {
        let identifiers: [TokenGroup: [String]] = [
            .onLight: ["OnLight", "onLight", "Light"],
            .onDark: ["OnDark", "onDark", "Dark"],
            .inverse: ["Inverse", "inverse"],
            .default: ["Default", "default"]
        ]
        
        return identifiers[group]?.first { self.contains($0) }
    }
    
    private func getTargetIdentifier(for targetGroup: TokenGroup, originalCase: String) -> String? {
        let normalized = originalCase.lowercased()
        
        let baseMapping: [TokenGroup: [String: String]] = [
            .onLight: [
                "default": "onlight",
                "inverse": "onlight",
                "ondark": "onlight",
                "dark": "light"
            ],
            .onDark: [
                "default": "ondark",
                "inverse": "ondark",
                "onlight": "ondark",
                "light": "dark"
            ],
            .inverse: [
                "default": "inverse"
            ],
            .default: [
                "inverse": "default"
            ]
        ]
        
        guard let baseTarget = baseMapping[targetGroup]?[normalized] else {
            return nil
        }
        
        return applyCasePattern(from: originalCase, to: baseTarget)
    }
    
    private func applyCasePattern(from source: String, to target: String) -> String {
        let sourceLower = source.lowercased()
        
        if source == sourceLower {
            return target
        }
        
        let knownIdentifiers: [String: [String]] = [
            "onlight": ["OnLight", "onLight", "onlight"],
            "ondark": ["OnDark", "onDark", "ondark"],
            "light": ["Light", "Light", "light"],
            "dark": ["Dark", "Dark", "dark"],
            "inverse": ["Inverse", "inverse", "inverse"],
            "default": ["Default", "default", "default"]
        ]
        
        guard let variants = knownIdentifiers[target] else {
            if source.first?.isUppercase == true {
                return target.prefix(1).uppercased() + target.dropFirst()
            }
            return target
        }
        
        if source == sourceLower {
            return variants[2]
        }
        
        if source.first?.isUppercase == true {
            let hasMultipleUppercase = source.dropFirst().contains { $0.isUppercase }
            return hasMultipleUppercase ? variants[0] : variants[0]
        }
        
        return variants[1]
    }
}

internal extension Subtheme {
    func shouldOverrideTokens(withSubThemeGroup: TokenGroup) -> Bool {
        switch withSubThemeGroup {
        case .inverse:
            return true
        case .onLight, .onDark:
            return false
        case .default:
            return self != .default
        case .none:
            return false
        }
    }
    
    func toGroup() -> TokenGroup {
        switch self {
        case .onLight: return .onLight
        case .onDark: return .onDark
        case .inverse: return .inverse
        case .default: return .default
        case .none: return .none
        }
    }
    
    func inverseGroup() -> TokenGroup {
        switch self {
        case .onLight: return .onDark
        case .onDark: return .onLight
        case .inverse: return .default
        case .default: return .inverse
        case .none: return .none
        }
    }
}

