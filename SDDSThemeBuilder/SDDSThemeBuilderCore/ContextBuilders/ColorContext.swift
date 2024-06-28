import Foundation

protocol ColorContext {
    func getColorMap(_ value: String, _ paletteJson: [String: Any]?) throws -> ColorMap
}

extension ColorContext {
    func getColorMap(_ value: String, _ paletteJson: [String: Any]?) throws -> ColorMap {
        if value.isAlias {
            let colorAlias = try ColorAlias(string: value)
            return buildColorMap(by: colorAlias, paletteJson: paletteJson)
        } else {
            return ColorMap(hex: value)
        }
    }
    
    private func buildColorMap(by alias: ColorAlias, paletteJson: [String: Any]?) -> ColorMap {
        let color = paletteJson?[alias.palette.color] as? [String: Any]
        let hex = color?[alias.palette.tone] as? String
        return ColorMap(hex: hex, alpha: alias.alpha)
    }
}
