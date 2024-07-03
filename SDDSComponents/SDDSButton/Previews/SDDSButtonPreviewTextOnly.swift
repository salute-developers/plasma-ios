import Foundation
import SwiftUI

struct SDDSButtonPreviewTextOnly: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .large))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .large, layoutMode: .fixedWidth(.centered)))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large button with text and fixed centered layout")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .large, layoutMode: .fixedWidth(.sideBySide)))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large button with text and fixed side by side layout")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .medium))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Medium button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .small))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Small button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .xs))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("XS button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnly(size: .xxs))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("XXS button with text")
    }
}
