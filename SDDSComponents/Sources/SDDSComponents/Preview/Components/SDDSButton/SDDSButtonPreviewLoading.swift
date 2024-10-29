import Foundation

import SwiftUI

//// MARK: - Preview: Loading Buttons
struct SDDSButtonPreviewLoading: PreviewProvider {
    static var previews: some View {
        SDDSButton.loadingButton(size: .large)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Loading large button with text")
        
        SDDSButton.transparentLoadingButton(size: .large)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Transparent loading large button with text")
    }
}
