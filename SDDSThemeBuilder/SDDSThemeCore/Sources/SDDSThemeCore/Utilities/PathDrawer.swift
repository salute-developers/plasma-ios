import Foundation
import SwiftUI

public protocol PathDrawer: AnyObject {
    func path(in rect: CGRect) -> Path
}

public final class DefaultPathDrawer: PathDrawer {
    public func path(in rect: CGRect) -> Path {
        return Path(rect)
    }
    
    public init(){}
}

public final class CircleDrawer: PathDrawer {
    public func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: .zero, endAngle: .degrees(360), clockwise: false)
        return path
    }
    
    public init(){}
}

public final class CornerRadiusDrawer: PathDrawer {
    let cornerRadius: CGFloat
    
    public init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        return path
    }
    
}
