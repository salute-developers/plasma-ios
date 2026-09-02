import Foundation

final class CodeFieldColorContextBuilder: CodeGenerationContextBuilder {
    let defaultColor: ColorKeyValue?
    let errorColor: ColorState?
    
    init(defaultColor: ColorKeyValue?, errorColor: ColorState?) {
        self.defaultColor = defaultColor
        self.errorColor = errorColor
    }
    
    var context: String? {
        if defaultColor == nil && errorColor == nil {
            return nil
        }
        
        let clearColor = "ColorToken.clearColor"
        
        let defaultColorToken = ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? clearColor
        let errorColorToken = ColorTokenContextBuilder(errorColor, hasDefault: true).context ?? clearColor
        return """
        CodeFieldColor(defaultColor: \(defaultColorToken), errorColor: \(errorColorToken))
        """
    }
} 