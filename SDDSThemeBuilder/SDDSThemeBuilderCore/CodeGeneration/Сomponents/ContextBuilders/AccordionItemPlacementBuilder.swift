import Foundation

final class AccordionItemPlacementContextBuilder: CodeGenerationContextBuilder {
    enum EnumValue: String {
        case start = "start"
        case end = "end"
    }
    
    let value: String?
    let nullify: Bool
    
    init(_ value: String?, nullify: Bool) {
        self.value = value
        self.nullify = nullify
    }
    
    var context: String? {
        guard let value = value else {
            return nullify ? nil : "nil"
        }
        
        return "\(AccordionItemPlacementContextBuilder.enumName).\(value)"
    }
    
    static var defaultContext: String {
        return "\(enumName).\(EnumValue.start.rawValue)"
    }
    
    static var enumName: String {
        "AccordionItemPlacement"
    }
}
