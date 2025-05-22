import Foundation
import SwiftUI

@available(*, deprecated, message: "Don't use it, public struct will be removed")
public struct ViewProvider {
    let view: AnyView
    
    public init<V: View>(_ view: V) {
        self.view = AnyView(view)
    }
}

struct AnyViewWrapperView: View {
    let view: AnyView
    
    var body: some View {
        view
    }
}
