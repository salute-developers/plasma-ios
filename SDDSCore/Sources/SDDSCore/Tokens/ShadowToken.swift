import SwiftUI

public struct ShadowToken {
    public struct Offset {
        public let width: CGFloat
        public let height: CGFloat
        
        public init(width: CGFloat, height: CGFloat) {
            self.width = width
            self.height = height
        }
    }
        
    public let color: Color
    public let offset: Offset
    public let opacity: CGFloat
    public let radius: CGFloat
    
    public init(color: Color, offset: Offset, opacity: CGFloat, radius: CGFloat) {
        self.color = color
        self.offset = offset
        self.opacity = opacity
        self.radius = radius
    }
}
