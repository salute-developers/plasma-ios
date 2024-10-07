import Foundation
import SwiftUI

public struct ViewProvider {
    let view: AnyView
    
    public init<V: View>(_ view: V) {
        self.view = AnyView(view)
    }
}
