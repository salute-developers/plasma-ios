import Foundation
import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSServTheme

final class ToolbarViewModel: ComponentViewModel<ToolbarVariationProvider> {
    @Published var toolbarType: ToolbarType = .horizontal {
        didSet {
            variationProvider.toolbarType = toolbarType
            selectVariation(variations.first)
        }
    }
    
    @Published var hasDivider: Bool = true
    @Published var slotsAmount: Int = 3 {
        didSet {
            if slotsAmount < 0 {
                slotsAmount = 0
            }
            if slotsAmount > 10 {
                slotsAmount = 10
            }
        }
    }
    
    var slots: [ToolbarSlotData] {
        (0..<slotsAmount).map { index in
            let isFirst = index == 0
            let isLast = index == slotsAmount - 1
            if isFirst || isLast {
                return ToolbarSlotData(
                    views: [
                        AnyView(
                            IconButton(
                                iconAttributes: ButtonIconAttributes(image: Asset.starFill36.image, alignment: .leading),
                                appearance: BasicButton.m.default.appearance,
                                action: {}
                            )
                        ),
                        AnyView(
                            IconButton(
                                iconAttributes: ButtonIconAttributes(image: Asset.starFill36.image, alignment: .leading),
                                appearance: BasicButton.m.default.appearance,
                                action: {}
                            )
                        )
                    ]
                )
            } else {
                return ToolbarSlotData(
                    views: [
                        AnyView(
                            BasicButton(
                                title: "Label",
                                subtitle: "",
                                appearance: BasicButton.m.default.appearance,
                                action: {}
                            )
                        )
                    ]
                )
            }
        }
    }
    
    init() {
        super.init(variationProvider: ToolbarVariationProvider())
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
