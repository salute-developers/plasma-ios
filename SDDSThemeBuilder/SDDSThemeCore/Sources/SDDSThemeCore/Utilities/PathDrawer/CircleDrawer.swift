import Foundation
import SwiftUI

public final class CircleDrawer: PathDrawer {
    public func path(in rect: CGRect) -> Path {
        let radius = rect.height / 2
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: radius, height: radius))
        return path
    }
    
    public init(){}
}
