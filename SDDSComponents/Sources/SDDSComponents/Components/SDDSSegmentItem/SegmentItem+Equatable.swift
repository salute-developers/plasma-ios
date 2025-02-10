import Foundation

extension SDDSSegmentItem: Equatable {
    public static func == (lhs: SDDSSegmentItem, rhs: SDDSSegmentItem) -> Bool {
        return lhs.id == rhs.id && lhs.isSelected == rhs.isSelected
    }
}
