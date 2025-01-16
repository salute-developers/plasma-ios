import Foundation

final class ColorTokenContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let alpha: Double?
    let hasDefault: Bool
    
    init(_ color: ColorKeyValue?, hasDefault: Bool = false) {
        self.string = color?.default
        self.alpha = color?.alpha
        self.hasDefault = hasDefault
    }
    
    init(_ color: ColorState?, hasDefault: Bool = false) {
        self.string = color?.value
        self.alpha = nil
        self.hasDefault = hasDefault
    }
    
    init(_ string: String?, _ alpha: Double? = nil, hasDefault: Bool = false) {
        self.string = string
        self.alpha = alpha
        self.hasDefault = hasDefault
    }
    
    var context: String? {
        guard let string = string else {
            return hasDefault ? ".clearColor" : nil
        }
        
        var result = "ColorToken.\(string.camelCase)"
        if let alpha = alpha {
            result += ".withOpacity(\(alpha))"
        }
        
        return result
    }
}
