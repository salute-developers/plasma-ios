import Foundation
import SwiftUI
import SDDSComponents

struct SDDSButtonPreviewTextOnly: PreviewProvider {
    static var previews: some View {
        SDDSButton.button(with: SDDSButtonViewData(
            title: "Large button with text",
            size: ButtonSize.large,
            layoutMode: .wrapContent
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Large button with text")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "Large button with text and fixed centered layout",
            size: ButtonSize.large,
            layoutMode: .fixedWidth(.centered)
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Large button with text and fixed centered layout")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "Large button with text and fixed side by side layout",
            size: ButtonSize.large,
            layoutMode: .fixedWidth(.sideBySide)
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Large button with text and fixed side by side layout")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "Medium button with text",
            size: ButtonSize.medium
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Medium button with text")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "Small button with text",
            size: ButtonSize.small
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Small button with text")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "XS button with text",
            size: ButtonSize.xs
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("XS button with text")
        
        SDDSButton.button(with: SDDSButtonViewData(
            title: "XXS button with text",
            size: ButtonSize.xxs
        ))
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("XXS button with text")
    }
}

