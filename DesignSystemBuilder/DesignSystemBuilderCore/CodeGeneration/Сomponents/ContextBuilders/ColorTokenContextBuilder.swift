import Foundation

final class ColorTokenContextBuilder: CodeGenerationContextBuilder {
    let string: String?
    let alpha: Double?
    let hasDefault: Bool
    let isGradient: Bool
    
    init(_ color: ColorKeyValue?, hasDefault: Bool = false, isGradient: Bool = false) {
        self.string = color?.default
        self.alpha = color?.alpha
        self.hasDefault = hasDefault
        self.isGradient = isGradient
    }
    
    init(_ color: ColorState?, hasDefault: Bool = false, isGradient: Bool = false) {
        self.string = color?.value
        self.alpha = nil
        self.hasDefault = hasDefault
        self.isGradient = isGradient
    }
    
    init(_ string: String?, _ alpha: Double? = nil, hasDefault: Bool = false, isGradient: Bool = false) {
        self.string = string
        self.alpha = alpha
        self.hasDefault = hasDefault
        self.isGradient = isGradient
    }
    
    var context: String? {
        guard let string = string else {
            return hasDefault ? ".clearColor" : nil
        }
        
        var result = "\(tokenName).\(string.camelCase)"
        if let alpha = alpha, !isGradient {
            result += ".withOpacity(\(alpha))"
        }
        
        return result
    }
    
    private var tokenName: String {
        isGradient ? "GradientToken" : "ColorToken"
    }
}
