import Foundation

final class ButtonColorContextBuilder: CodeGenerationContextBuilder {
    let defaultColor: ColorKeyValue?
    let highlightedColor: ColorState?
    let hoveredColor: ColorState?
    
    init(defaultColor: ColorKeyValue?, highlightedColor: ColorState? = nil, hoveredColor: ColorState? = nil) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
    }
    
    var context: String? {
        if defaultColor == nil, highlightedColor == nil, hoveredColor == nil {
            return nil
        }
        
        let allStates: [(String, ColorState?)] = [
            ("highlightedColor", highlightedColor),
           ( "hoveredColor", hoveredColor)
        ]
        
        let buttonColorString = """
        ButtonColor(defaultColor: \(ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? "")
        """
        
        let colorStatesString = allStates.compactMap { (stateColorString, stateColor) -> String? in
            guard stateColor != nil else {
                return nil
            }
            let colorToken = ColorTokenContextBuilder(stateColor, hasDefault: true).context ?? ""
            return ", \(stateColorString): \(colorToken)"
        }
        
        let combinedColorStatesString = colorStatesString.joined()
        
        return buttonColorString + combinedColorStatesString + ")"
    }
}
