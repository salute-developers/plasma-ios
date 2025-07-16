import Foundation
import SwiftUI

public final class DefaultPathDrawer: PathDrawer {
    public func path(in rect: CGRect) -> Path {
        return Path(roundedRect: rect, cornerRadius: 0)
    }
    
    public init(){}
}
