import SwiftUI

public struct ShapeContent: Shape, EnvironmentKey {
    public static var defaultValue: ShapeContent {
        return .init(pathDrawer: DefaultPathDrawer())
    }
    
    let pathDrawer: PathDrawer
    
    public init(pathDrawer: PathDrawer) {
        self.pathDrawer = pathDrawer
    }
    
    public init(token: ShapeToken) {
        switch token.kind {
        case .round:
            self.pathDrawer = CornerRadiusDrawer(cornerRadius: token.cornerRadius)
        }
    }
    
    public func path(in rect: CGRect) -> Path {
        pathDrawer.path(in: rect)
    }
}
