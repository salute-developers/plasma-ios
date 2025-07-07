import Foundation

enum PathDrawerSupportedType: String {
    static let pathDrawerArgument: String = "%@"
    
    case circle = "round.circle"
    case `default` = "round"
    
    var name: String {
        switch self {
        case .circle:
            "CircleDrawer()"
        case .`default`:
            "CornerRadiusDrawer(cornerRadius: \(PathDrawerSupportedType.pathDrawerArgument))"
        }
    }
    
    func applyArgument(argument: String) -> String {
        switch self {
        case .circle:
            return name
        case .default:
            return name.replacingOccurrences(
                of: PathDrawerSupportedType.pathDrawerArgument,
                with: argument
            )
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
        
        if let recognizedType = PathDrawerSupportedType(rawValue: value) {
            return PathDrawerContextBuilder.context(name: recognizedType.name)
        } else {
            let prefix = value.components(separatedBy: ".").first ?? ""
            if prefix == PathDrawerSupportedType.default.rawValue {
                let defaultType = PathDrawerSupportedType.default
                var cornerRadius = ShapeTokenContextBuilder.init(shape: shape).context ?? ""
                return PathDrawerContextBuilder.context(name: defaultType.applyArgument(argument: cornerRadius))
            }
            
            return PathDrawerContextBuilder.context(name: PathDrawerContextBuilder.defaultContext)
        }
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
