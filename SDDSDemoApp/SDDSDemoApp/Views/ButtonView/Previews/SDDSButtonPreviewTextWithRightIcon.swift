import Foundation
import SwiftUI

struct SDDSButtonPreviewTextWithRightIcon: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .large, alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Large button with text and right icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .large, alignment: .right, layoutMode: .fixedWidth(.centered)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text and right icon and fixed centered layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .large, alignment: .right, layoutMode: .fixedWidth(.sideBySide)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text and right icon and fixed side by side layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .medium, alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Medium button with text and right icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .small, alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Small button with text and right icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .xs, alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XS button with text and right icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImage(size: .xxs, alignment: .right))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XXS button with text and right icon")
        }
    }
}
