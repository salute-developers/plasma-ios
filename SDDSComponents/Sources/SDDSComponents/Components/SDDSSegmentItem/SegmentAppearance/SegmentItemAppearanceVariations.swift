import Foundation

public struct SegmentItemAppearanceVariation: Hashable {
    public let name: String
    public let appearance: SegmentItemAppearance
    
    public init(name: String = "", appearance: SegmentItemAppearance = SegmentItemAppearance()) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: SegmentItemAppearanceVariation, rhs: SegmentItemAppearanceVariation) -> Bool {
        return lhs.name == rhs.name
    }
}
