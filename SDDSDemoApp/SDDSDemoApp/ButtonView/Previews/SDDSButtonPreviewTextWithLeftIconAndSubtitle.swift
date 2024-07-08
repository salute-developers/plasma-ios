import Foundation
import SwiftUI

struct SDDSButtonPreviewTextWithLeftIconAndSubtitle: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .large))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Large button with text, subtitle, and left icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .large, layoutMode: .fixedWidth(.centered)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text, subtitle, and left icon and fixed centered layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .large, layoutMode: .fixedWidth(.sideBySide)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text, subtitle, and left icon and fixed side by side layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .medium))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Medium button with text, subtitle, and left icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .small))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Small button with text, subtitle, and left icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .xs))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XS button with text, subtitle, and left icon")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithImageAndSubtitle(size: .xxs))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XXS button with text, subtitle, and left icon")
        }
    }
}
