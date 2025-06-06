import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class ToastViewModel: ComponentViewModel<ToastVariationProvider> {
    @Published var text: String = "Toast message"
    @Published var contentStartEnabled: Bool = true
    @Published var contentEndEnabled: Bool = true
    @Published var position: ToastPosition = .topCenter
    @Published var duration: TimeInterval = 3000
    
    init() {
        super.init(variationProvider: ToastVariationProvider())
    }
    
} 
