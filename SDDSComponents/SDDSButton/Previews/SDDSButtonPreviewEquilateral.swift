import Foundation
import SwiftUI

struct SDDSButtonPreviewEquilateral: PreviewProvider {
    static var previews: some View {
        SDDSButton(viewModel: SDDSButtonViewModel.equilateral(size: .large, layoutMode: .square))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large square button")
        
        SDDSButton(viewModel: SDDSButtonViewModel.equilateral(size: .large, layoutMode: .circle))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large circle button")
        
        SDDSButton(viewModel: SDDSButtonViewModel.equilateral(size: .large, layoutMode: .circle, isLoading: true))
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Large circle button loading")
    }
}
