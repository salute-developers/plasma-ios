import Foundation

extension SegmentItemAppearance: Hashable {
    public static func == (lhs: SegmentItemAppearance, rhs: SegmentItemAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
