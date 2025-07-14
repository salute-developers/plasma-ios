import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum DropdownMenuButtonPosition: String, CaseIterable {
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

final class DropdownMenuViewModel: ComponentViewModel<DropdownMenuVariationProvider> {
    @Published var placement: PopoverPlacement = .top
    @Published var alignment: PopoverAlignment = .center
    @Published var autoHide: Bool = true
    @Published var buttonPosition: DropdownMenuButtonPosition = .center
    @Published var duration: Int? = nil
    @Published var textInput: String = "10"
    @Published var itemsCount: Int = 10
    @Published var hasDisclosure: Bool = false
    @Published var dividerEnabled: Bool = false
    @Published var itemAppearance: ListItemAppearance = .init() {
        didSet {
            var appearance = self.appearance
            appearance.listAppearance.listItemAppearance = itemAppearance
            self.appearance = appearance
            onUpdateAppearance()
        }
    }
    @Published var itemStyle: AppearanceVariation<ListItemAppearance>? {
        didSet {
            if let appearance = itemStyle?.appearance {
                self.itemAppearance = appearance
            }
        }
    }
    @Published var itemVariation: Variation<ListItemAppearance>? {
        didSet {
            if let style = itemVariation?.styles.first {
                self.itemStyle = style
            } else if let appearance = itemVariation?.appearance {
                self.itemAppearance = appearance
            }
        }
    }
    @Published var placementMode: PopoverPlacementMode = .loose
    @Published var layout: DropDownMenuLayout = .normal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
            self.itemVariation = variationProvider.itemVariations.first
        }
    }
    
    var itemStyles: [AppearanceVariation<ListItemAppearance>] {
        let result = itemVariation?.styles ?? []
        return result
    }
    
    init() {
        let provider = DropdownMenuVariationProvider()
        let itemVariation = provider.itemVariations[0]
        self.itemVariation = itemVariation
        self.itemStyle = itemVariation.styles.first
        self.itemAppearance = itemVariation.appearance
        
        super.init(variationProvider: provider)
        
        $textInput
            .map { Int($0) ?? 0 }
            .assign(to: \.itemsCount, on: self)
            .store(in: &cancellables)
    }
}
