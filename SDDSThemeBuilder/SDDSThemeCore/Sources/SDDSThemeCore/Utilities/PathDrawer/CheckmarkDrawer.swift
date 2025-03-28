import Foundation
import SwiftUI

public final class CheckmarkDrawer: PathDrawer {
    private let lineWidth: CGFloat
    
    public init(lineWidth: CGFloat) {
        self.lineWidth = lineWidth
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        path.addLine(to: CGPoint(x: rect.width / 3, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path.strokedPath(
            StrokeStyle(
                lineWidth: lineWidth,
                lineCap: .round
            )
        )
    }
}
