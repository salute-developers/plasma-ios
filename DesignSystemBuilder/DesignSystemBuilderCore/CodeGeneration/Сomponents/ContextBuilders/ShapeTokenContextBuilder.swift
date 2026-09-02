import Foundation

final class ShapeTokenContextBuilder: CodeGenerationContextBuilder {
    let shape: ShapeKeyValue?
    let nullify: Bool
    
    init(shape: ShapeKeyValue?, nullify: Bool = false) {
        self.shape = shape
        self.nullify = nullify
    }
    
    var context: String? {
        guard let shape = shape, let value = shape.value else {
            return nullify ? nil : "CGFloat(0)"
        }
        
        if value.hasSuffix("circle") {
            return "size.height / 2"
        }
        
        var result = "ShapeToken.\(value.camelCase).cornerRadius"
        if let adjustment = shape.adjustment, adjustment != 0 {
            let absValue = String(abs(adjustment))
            result += "\(adjustment >= 0 ? "+\(absValue)" : "-\(absValue)" )"
        }
        
        return result
    }
}
