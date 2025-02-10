import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class ButtonViewModel: ComponentViewModel<ButtonVariationProvider> {
    @Published var iconVisible: Bool = false {
        didSet {
            if iconVisible {
                iconAttributes = .init(image: Image.image("buttonIcon"), alignment: alignment)
            } else {
                iconAttributes = nil
            }
        }
    }
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading {
        didSet {
            guard let iconAttributes = iconAttributes else {
                return
            }
            self.iconAttributes = .init(image: iconAttributes.image, alignment: alignment)
        }
    }
    @Published var label: String = ""
    @Published var value: String = ""
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var isLoading: Bool = false
    @Published var spinnerImage: Image = Image("spinner", bundle: Bundle(for: ButtonViewModel.self))
    @Published var buttonStyle: SDDSComponents.ButtonStyle = .basic
    @Published var layoutMode: ButtonLayoutMode = .wrapContent
    @Published var buttonType: SDDSButtonType = .basic {
        didSet {
            self.variationProvider.buttonType = buttonType
            self.selectVariation(variations.first)
        }
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
    
    init() {
        super.init(variationProvider: ButtonVariationProvider(buttonType: .basic))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
