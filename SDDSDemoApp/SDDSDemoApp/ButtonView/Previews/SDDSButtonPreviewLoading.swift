import Foundation
import SwiftUI

struct SDDSButtonPreviewLoading: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.textOnlyLoading(size: .large))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Loading large button with text")
        
        SDDSButton(viewModel: SDDSButtonViewModel.textOnlyLoadingTransparent(size: .large))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Transparent loading large button with text")
    }
}
