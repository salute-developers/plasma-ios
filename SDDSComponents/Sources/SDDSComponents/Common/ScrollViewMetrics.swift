import Foundation

public struct ScrollMetrics {
    public var visibleHeight: CGFloat = 0
    public var contentHeight: CGFloat = 0
    public var contentOffset: CGPoint = .zero
    
    public func calculateThumbHeight() -> CGFloat {
        guard contentHeight > 0 else {
            return visibleHeight
        }
        return max(min((visibleHeight / contentHeight) * visibleHeight, visibleHeight), 20)
    }
    
    public func thumbOffset() -> CGFloat {
        let maxContentOffset = max(0, contentHeight - visibleHeight)
        let thumbMaxOffset = visibleHeight - calculateThumbHeight()
        let max = max(0, (contentOffset.y / maxContentOffset) * thumbMaxOffset)
        let thumbPosition = min(max, thumbMaxOffset)
        return thumbPosition
    }
}
