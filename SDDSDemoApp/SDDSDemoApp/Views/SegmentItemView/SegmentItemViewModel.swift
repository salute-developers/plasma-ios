import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class SegmentItemViewModel: ComponentViewModel<SegmentItemVariationProvider> {
    @Published var title: String = "Title"
    @Published var subtitle: String = "Value"
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading {
        didSet {
            guard let iconAttributes = iconAttributes else {
                return
            }
            self.iconAttributes = .init(image: iconAttributes.image, alignment: alignment)
        }
    }
    @Published var isCounterVisible: Bool = false
    @Published var isSelected: Bool = true
    @Published var iconVisible: Bool = false {
        didSet {
            if iconVisible {
                iconAttributes = .init(image: Image.image("buttonIcon"), alignment: alignment)
            } else {
                iconAttributes = nil
            }
        }
    }
    
    var counterViewModel = CounterViewModel()
    
    init() {
        super.init(variationProvider: SegmentItemVariationProvider())
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
}

#Preview {
    SegmentItemView()
}
