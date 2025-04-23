import Foundation

final class ButtonColorContextBuilder: CodeGenerationContextBuilder {
    let defaultColor: ColorKeyValue?
    let highlightedColor: ColorState?
    let hoveredColor: ColorState?
    let selectedColor: ColorState?
    
    init(defaultColor: ColorKeyValue?, highlightedColor: ColorState?, hoveredColor: ColorState?, selectedColor: ColorState? = nil) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
        self.selectedColor = selectedColor
    }
    
    var context: String? {
        if defaultColor == nil && highlightedColor == nil && hoveredColor == nil {
            return nil
        }
        
        let clearColor = "ColorToken.clearColor"
        
        let defaultColorToken = ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? clearColor
        let highlightedColorToken = ColorTokenContextBuilder(highlightedColor, hasDefault: true).context ?? clearColor
        let hoveredColorToken = ColorTokenContextBuilder(hoveredColor, hasDefault: true).context ?? clearColor
        let selectedColorToken = ColorTokenContextBuilder(selectedColor, hasDefault: true).context ?? clearColor
        return """
        ButtonColor(defaultColor: \(defaultColorToken), highlightedColor: \(highlightedColorToken), hoveredColor: \(hoveredColorToken), selectedColor: \(selectedColorToken))
        """
    }
}
