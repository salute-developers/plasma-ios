import SwiftUI

public struct ShapeToken {
    public enum Kind: String {
        case round
    }
    
    public let cornerRadius: CGFloat
    public let kind: Kind
    
    public init(cornerRadius: CGFloat, kind: Kind = .round) {
        self.cornerRadius = cornerRadius
        self.kind = kind
    }
}
