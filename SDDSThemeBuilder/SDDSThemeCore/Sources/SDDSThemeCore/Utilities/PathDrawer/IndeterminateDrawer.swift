import Foundation
import SwiftUI

public final class IndeterminateDrawer: PathDrawer {
    private let lineWidth: CGFloat
    
    public init(lineWidth: CGFloat) {
        self.lineWidth = lineWidth
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 1, y: rect.height - 1))
        path.addLine(to: CGPoint(x: rect.width - 1, y: rect.height - 1))
        return path.strokedPath(
            StrokeStyle(
                lineWidth: lineWidth,
                lineCap: .round
            )
        )
    }
}
