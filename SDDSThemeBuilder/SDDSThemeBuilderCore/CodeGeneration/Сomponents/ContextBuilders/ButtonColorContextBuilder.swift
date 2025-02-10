import Foundation

final class ButtonColorContextBuilder: CodeGenerationContextBuilder {
    let defaultColor: ColorKeyValue?
    let highlightedColor: ColorState?
    let hoveredColor: ColorState?
    
    init(defaultColor: ColorKeyValue?, highlightedColor: ColorState?, hoveredColor: ColorState?) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
    }
    
    var context: String? {
        if defaultColor == nil, highlightedColor == nil, hoveredColor == nil {
            return nil
        }
        
        let defaultColorToken = ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? ""
        let highlightedColorToken = ColorTokenContextBuilder(highlightedColor, hasDefault: true).context ?? ""
        let hoveredColorToken = ColorTokenContextBuilder(hoveredColor, hasDefault: true).context ?? ""
        return """
        ButtonColor(defaultColor: \(defaultColorToken), highlightedColor: \(highlightedColorToken), hoveredColor: \(hoveredColorToken))
        """
    }
}
