import Foundation

final class EdgeInsetsContextBuilder: CodeGenerationContextBuilder {
    let top: Double?
    let leading: Double?
    let bottom: Double?
    let trailing: Double?
    let nullify: Bool
    
    init(top: Double?, leading: Double?, bottom: Double?, trailing: Double?, nullify: Bool = false) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.nullify = nullify
    }
    
    var context: String? {
        if top == nil, leading == nil, bottom == nil, trailing == nil, nullify {
            return nil
        }

        let topValue = String(top ?? 0)
        let leadingValue = String(leading ?? 0)
        let bottomValue = String(bottom ?? 0)
        let trailingValue = String(trailing ?? 0)
        
        return "EdgeInsets(top: \(topValue), leading: \(leadingValue), bottom: \(bottomValue), trailing: \(trailingValue))"
    }
}
