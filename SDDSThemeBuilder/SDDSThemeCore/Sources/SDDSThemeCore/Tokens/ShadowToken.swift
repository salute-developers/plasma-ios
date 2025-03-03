import SwiftUI

public struct ShadowToken {
    public struct Layer {
        public let color: Color
        public let offsetX: CGFloat
        public let offsetY: CGFloat
        public let blurRadius: CGFloat
        public let spreadRadius: CGFloat
        
        public init(color: Color, offsetX: CGFloat, offsetY: CGFloat, blurRadius: CGFloat, spreadRadius: CGFloat) {
            self.color = color
            self.offsetX = offsetX
            self.offsetY = offsetY
            self.blurRadius = blurRadius
            self.spreadRadius = spreadRadius
        }
    }
    
    public let layers: [Layer]
    
    public init(layers: [Layer]) {
        self.layers = layers
    }
}
