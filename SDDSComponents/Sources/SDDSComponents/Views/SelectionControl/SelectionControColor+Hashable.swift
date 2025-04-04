import Foundation

extension SelectionControColor: Hashable {
    static func ==(lhs: SelectionControColor, rhs: SelectionControColor) -> Bool {
        return lhs.defaultColor == rhs.defaultColor &&
               lhs.checkedColor == rhs.checkedColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(defaultColor)
        hasher.combine(checkedColor)
    }
}
