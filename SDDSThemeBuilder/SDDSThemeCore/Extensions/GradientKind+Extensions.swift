import Foundation

extension GradientKind {
    var linearGradient: LinearGradient? {
        switch self {
        case .linear(let data):
            return data
        default:
            return nil
        }
    }
    
    var radialGradient: RadialGradient? {
        switch self {
        case .radial(let data):
            return data
        default:
            return nil
        }
    }
    
    var angularGradient: AngularGradient? {
        switch self {
        case .angular(let data):
            return data
        default:
            return nil
        }
    }
    
    var plainColor: PlainColor? {
        switch self {
        case .color(let data):
            return data
        default:
            return nil
        }
    }
}
