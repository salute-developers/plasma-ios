import Foundation

public struct ScrollViewMetrics {
    public var visibleHeight: CGFloat = 0
    public var contentHeight: CGFloat = 0
    public var contentOffset: CGPoint = .zero
    
    public func thumbOffset() -> CGFloat {
        let scrollableHeight = contentHeight - visibleHeight
        guard scrollableHeight > 0 else { return 0 }
        let scrollProgress = contentOffset.y / scrollableHeight
        let availableSpace = visibleHeight - calculateThumbHeight()
        return scrollProgress * availableSpace
    }
    
    public func calculateThumbHeight() -> CGFloat {
        guard contentHeight > 0 else {
            return visibleHeight
        }
        let thumbHeight = pow(visibleHeight, 2) / contentHeight
        let minThumbHeight: CGFloat = 20
        let maxThumbHeight: CGFloat = visibleHeight
        return max(min(thumbHeight, maxThumbHeight), minThumbHeight)
    }
}
