import Foundation

enum PaletteAliasError: Error {
    case aliasComponents
    case paletteComponents
    case alpha
}

struct PaletteAlias {
    let palette: String
    let color: String
    let tone: String
    
    init(palette: String, color: String, tone: String) {
        self.palette = palette
        self.color = color
        self.tone = tone
    }
}

struct ColorAlias {
    let palette: PaletteAlias
    let alpha: CGFloat?
    
    init(string: String) throws {
        let aliasComponents = string.parseBracketedString
        guard !aliasComponents.isEmpty, aliasComponents.count <= 2 else {
            throw PaletteAliasError.aliasComponents
        }
        guard let paletteComponents = aliasComponents.first?.components(separatedBy: "."), paletteComponents.count == 3 else {
            throw PaletteAliasError.paletteComponents
        }
        let palette = PaletteAlias(
            palette: paletteComponents[0],
            color: paletteComponents[1],
            tone: paletteComponents[2]
        )
        var alpha: CGFloat?
        if aliasComponents.count == 2 {
            if let alphaDoubleValue = Double(aliasComponents[1]) {
                let alphaCGFloatValue = CGFloat(alphaDoubleValue)
                alpha = alphaCGFloatValue
            } else {
                throw PaletteAliasError.alpha
            }
            
        }
        self.palette = palette
        self.alpha = alpha
    }
}

extension String {
    var isAlias: Bool {
        !parseBracketedString.isEmpty
    }
}

private extension String {
    var parseBracketedString: [String] {
        let pattern = "\\[(.*?)\\]"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return []
        }
        
        let matches = regex.matches(in: self, options: [], range: NSRange(self.startIndex..., in: self))
        
        let results = matches.map { match -> String in
            let range = Range(match.range(at: 1), in: self)!
            return String(self[range])
        }
        
        return results
    }
}
