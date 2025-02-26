import Foundation

final class PathFunctionContextBuilder: CodeGenerationContextBuilder {
    let shape: ShapeKeyValue?
    let nullify: Bool
    
    init(shape: ShapeKeyValue?, nullify: Bool = false) {
        self.shape = shape
        self.nullify = nullify
    }
    
    var context: String? {
        guard let shape = shape, let value = shape.value else {
            return nullify ? nil : emptyValue
        }
        
        if value.hasSuffix("circle") {
            return
"""
func path(in rect: CGRect) -> Path {
        PathDrawer.circle(in: rect)
    }  
"""
        }
        
        return emptyValue
    }
    
    private var emptyValue: String {
"""
func path(in rect: CGRect) -> Path {
        return Path()
    }
"""
    }
}
