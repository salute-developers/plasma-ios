import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum PopoverButtonPosition: String, CaseIterable {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case center
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

final class PopoverViewModel: ComponentViewModel<PopoverVariationProvider> {
    @Published var placement: PopoverPlacement = .top
    @Published var alignment: PopoverAlignment = .center
    @Published var tailEnabled: Bool = true
    @Published var autoHide: Bool = true
    @Published var triggerCentered: Bool = false
    @Published var placementMode: PopoverPlacementMode = .strict
    @Published var buttonPosition: PopoverButtonPosition = .center
    @Published var duration: Int? = nil
    
    init() {
        super.init(variationProvider: PopoverVariationProvider())
    }
} 
