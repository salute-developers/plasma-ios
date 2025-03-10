import Foundation

enum PathDrawerSupportedType: String {
    case circle = "round.circle"
    
    var name: String {
        switch self {
        case .circle:
            "CircleDrawer()"
        }
    }
}

final class PathDrawerContextBuilder: CodeGenerationContextBuilder {
    let shape: ShapeKeyValue?
    let nullify: Bool
    
    init(shape: ShapeKeyValue?, nullify: Bool = false) {
        self.shape = shape
        self.nullify = nullify
    }
    
    var context: String? {
        guard let shape = shape, let value = shape.value else {
            return nullify ? nil : PathDrawerContextBuilder.context(name: PathDrawerContextBuilder.defaultContext)
        }
        
        guard let supportedType = PathDrawerSupportedType(rawValue: value) else {
            return PathDrawerContextBuilder.context(name: PathDrawerContextBuilder.defaultContext)
        }
        
        return PathDrawerContextBuilder.context(name: supportedType.name)
    }
    
    private static func context(name: String) -> String {
        "\(name) as PathDrawer"
    }
    
    private static var defaultPathDrawer: String {
        "DefaultPathDrawer()"
    }
    
    static var defaultContext: String {
        context(name: defaultPathDrawer)
    }
}
