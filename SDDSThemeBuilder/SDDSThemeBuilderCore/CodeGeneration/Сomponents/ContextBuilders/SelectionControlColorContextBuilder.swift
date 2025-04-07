import Foundation

final class SelectionControContextBuilder: CodeGenerationContextBuilder {
    let defaultColor: ColorKeyValue?
    let checkedColor: ColorState?
    
    init(defaultColor: ColorKeyValue?, checkedColor: ColorState?) {
        self.defaultColor = defaultColor
        self.checkedColor = checkedColor
    }
    
    var context: String? {
        if defaultColor == nil, checkedColor == nil {
            return nil
        }
        
        let defaultColorToken = ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? ""
        let checkedColorToken = ColorTokenContextBuilder(checkedColor, hasDefault: true).context ?? ""
        
        return """
               SelectionControlColor(defaultColor: \(defaultColorToken), checkedColor: \(checkedColorToken))
               """
    }
}
