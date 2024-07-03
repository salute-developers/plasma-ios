import Foundation
import SwiftUI

struct SDDSButtonPreviewDisabled: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.textOnlyDisabled(size: .large))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Disabled large button with text")
    }
}
