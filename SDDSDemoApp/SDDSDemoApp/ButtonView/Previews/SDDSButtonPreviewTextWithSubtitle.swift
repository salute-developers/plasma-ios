import Foundation
import SwiftUI

struct SDDSButtonPreviewTextWithSubtitle: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .large))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Large button with text and subtitle")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .large, layoutMode: .fixedWidth(.centered)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text and subtitle and fixed centered layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .large, layoutMode: .fixedWidth(.sideBySide)))
                .previewLayout(PreviewLayout.fixed(width: Spacing.Button.previewWidth, height: ButtonSize.large.height))
                .previewDisplayName("Large button with text and subtitle and fixed side by side layout")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .medium))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Medium button with text and subtitle")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .small))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Small button with text and subtitle")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .xs))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XS button with text and subtitle")
            
            SDDSButton(viewModel: SDDSButtonViewModel.textWithSubtitle(size: .xxs))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("XXS button with text and subtitle")
        }
    }
}
