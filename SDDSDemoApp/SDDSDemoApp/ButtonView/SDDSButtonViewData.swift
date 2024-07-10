import Foundation
import SDDSComponents
import SwiftUI

struct SDDSButtonViewData {
    var title: String
    var subtitle: String
    var iconAttributes: ButtonIconAttributes?
    var size: ButtonSizeConfiguration
    var isDisabled: Bool
    var isLoading: Bool
    var spinnerImage: Image
    var spinnerStyle: SpinnerStyle
    var buttonStyle: SDDSComponents.ButtonStyle
    var appearance: ButtonAppearance
    var layoutMode: ButtonLayoutMode
    var action: () -> Void
    
    init(title: String = "",
         subtitle: String = "",
         iconAttributes: ButtonIconAttributes? = nil,
         size: ButtonSizeConfiguration,
         isDisabled: Bool = false,
         isLoading: Bool = false,
         spinnerImage: Image = Image("spinner"),
         spinnerStyle: SpinnerStyle = .solid,
         buttonStyle: SDDSComponents.ButtonStyle = .basic,
         appearance: ButtonAppearance = .black,
         layoutMode: ButtonLayoutMode = .wrapContent,
         action: @escaping () -> Void = {}) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.size = size
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.spinnerStyle = spinnerStyle
        self.buttonStyle = buttonStyle
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.action = action
    }
}

extension SDDSButton {
    static func button(with viewData: SDDSButtonViewData) -> SDDSButton {
        return SDDSButton(
            title: .constant(viewData.title),
            subtitle: .constant(viewData.subtitle),
            iconAttributes: .constant(viewData.iconAttributes),
            size: .constant(viewData.size),
            isDisabled: .constant(viewData.isDisabled),
            isLoading: .constant(viewData.isLoading),
            spinnerImage: .constant(viewData.spinnerImage),
            spinnerStyle: .constant(viewData.spinnerStyle),
            buttonStyle: .constant(viewData.buttonStyle),
            appearance: .constant(viewData.appearance),
            layoutMode: .constant(viewData.layoutMode), 
            action: {}
        )
    }
}
