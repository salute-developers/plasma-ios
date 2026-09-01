import Foundation

final class BottomSheetHandlePlacementContextBuilder: CodeGenerationContextBuilder {
    enum Placement: String {
        case auto
        case inner
        case outer
        case none
        
        var name: String {
            return "BottomSheetHandlePlacement.\(self.rawValue)"
        }
    }
    
    let string: String
    
    init(_ string: String) {
        self.string = string
    }
    
    var context: String? {
        guard let placement = Placement(rawValue: string) else {
            return Placement.none.name
        }
        
        return placement.name
    }
}
