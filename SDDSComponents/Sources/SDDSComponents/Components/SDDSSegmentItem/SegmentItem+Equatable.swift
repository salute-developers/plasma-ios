import Foundation

extension SDDSSegmentItem: Equatable {
    public static func == (lhs: SDDSSegmentItem, rhs: SDDSSegmentItem) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle &&
        lhs.iconAttributes == rhs.iconAttributes &&
        lhs.isDisabled == rhs.isDisabled &&
        lhs.isSelected == rhs.isSelected &&
        lhs.strech == rhs.strech &&
        lhs.counterEnabled == rhs.counterEnabled
    }
}
