import Foundation

final class StrokeCapContextBuilder: CodeGenerationContextBuilder {
    enum EnumValue: String {
        case round = "round"
        case square = "square"
    }
    
    let value: String?
    
    init(_ value: String?) {
        self.value = value
    }
    
    var context: String? {
        guard let value = value, let enumValue = EnumValue(rawValue: value) else {
            return nil
        }
        return "StrokeCap.\(enumValue.rawValue)"
    }
}
