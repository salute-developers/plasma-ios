import SwiftUI

public struct ShadowToken {
    public struct Offset {
        public let width: CGFloat
        public let height: CGFloat
    }
        
    public let color: Color
    public let offset: Offset
    public let opacity: CGFloat
    public let radius: CGFloat
}
