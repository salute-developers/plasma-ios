import Foundation

extension SelectionControlColor: Hashable {
    public static func ==(lhs: SelectionControlColor, rhs: SelectionControlColor) -> Bool {
        return lhs.defaultColor == rhs.defaultColor &&
               lhs.checkedColor == rhs.checkedColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(defaultColor)
        hasher.combine(checkedColor)
    }
}
