import Foundation

extension SDDSSegmentItem: Hashable {
    public static func == (lhs: SDDSSegmentItem, rhs: SDDSSegmentItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
