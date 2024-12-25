import Foundation

public struct SegmentElementAppearanceVariation: Hashable {
    public let name: String
    public let appearance: SegmentElementAppearance
    
    public init(name: String = "", appearance: SegmentElementAppearance = SegmentElementAppearance()) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: SegmentElementAppearanceVariation, rhs: SegmentElementAppearanceVariation) -> Bool {
        return lhs.name == rhs.name
    }
}
