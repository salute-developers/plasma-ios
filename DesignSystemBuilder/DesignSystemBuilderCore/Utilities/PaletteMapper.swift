import Foundation

final class PaletteMapper {
    private var paletteJson: [String: Any]?
    
     init?(paletteURL: URL) {
        guard let data = try? Data(contentsOf: paletteURL) else {
            return nil
        }
    
        self.paletteJson = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }
    
    init(paletteJson: [String: Any]?) {
        self.paletteJson = paletteJson
    }
    
    func colorMap(_ value: String) throws -> ColorMap {
        if value.isAlias {
            let colorAlias = try ColorAlias(string: value)
            return buildColorMap(by: colorAlias)
        } else {
            return ColorMap(hex: value)
        }
    }
    
    private func buildColorMap(by alias: ColorAlias) -> ColorMap {
        let color = paletteJson?[alias.palette.color] as? [String: Any]
        let hex = color?[alias.palette.tone] as? String
        return ColorMap(hex: hex, alpha: alias.alpha)
    }
}
