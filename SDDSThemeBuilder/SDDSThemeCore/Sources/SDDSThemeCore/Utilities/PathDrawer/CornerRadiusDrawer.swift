import Foundation
import SwiftUI

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
