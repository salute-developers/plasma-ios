import Foundation

protocol ColorContext {
    func getColorMap(_ value: String, _ paletteJson: [String: Any]?) throws -> ColorMap
}

extension ColorContext {
    func getColorMap(_ value: String, _ paletteJson: [String: Any]?) throws -> ColorMap {
        let mapper = PaletteMapper(paletteJson: paletteJson)
        return try mapper.colorMap(value)
    }
}
