import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class DrawerViewModel: ComponentViewModel<DrawerVariationProvider> {
    @Published var alignment: DrawerAlignment = .bottom
    @Published var showHeader: Bool = false
    @Published var showFooter: Bool = false
    @Published var showOverlay: Bool = false
    
    init() {
        super.init(variationProvider: DrawerVariationProvider())
    }
}

