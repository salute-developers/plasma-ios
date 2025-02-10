import Foundation

final class SizeContextBuilder: CodeGenerationContextBuilder {
    enum Style: String {
        case point
        case size
    }
    
    let x: Double?
    let y: Double?
    let style: SizeContextBuilder.Style
    let nullify: Bool
    
    init(x: Double?, y: Double?, style: SizeContextBuilder.Style = SizeContextBuilder.Style.point, nullify: Bool = false) {
        self.x = x
        self.y = y
        self.style = style
        self.nullify = nullify
    }
    
    var context: String? {
        guard let x = x, let y = y else {
            if nullify {
                return nil
            }
            switch style {
            case .point:
                return "CGPoint.zero"
            case .size:
                return "CGSize.zero"
            }
        }
        
        switch style {
        case .point:
            return "CGPoint(x:\(x), y:\(y))"
        case .size:
            return "CGSize(width:\(x), height:\(y))"
        }
    }
}
