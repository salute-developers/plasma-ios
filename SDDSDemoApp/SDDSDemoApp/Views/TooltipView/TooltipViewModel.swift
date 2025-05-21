import Foundation
import SDDSComponents

final class TooltipViewModel: ComponentViewModel<TooltipVariationProvider> {
    @Published var placement: PopoverPlacement = .top
    @Published var alignment: PopoverAlignment = .center
    @Published var tailEnabled: Bool = true
    @Published var autoHide: Bool = true
    @Published var contentStartEnabled: Bool = true
    @Published var triggerCentered: Bool = false
    @Published var placementMode: PopoverPlacementMode = .strict
    @Published var buttonPosition: PopoverButtonPosition = .center
    @Published var duration: Int? = nil
    @Published var text: String = "Tooltip text"
    
    init() {
        super.init(variationProvider: TooltipVariationProvider())
    }
}
