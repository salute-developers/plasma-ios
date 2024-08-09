import Foundation
import SwiftUI

// MARK: - Preview: Text with Subtitle
struct SDDSButtonPreviewTextWithSubtitle: PreviewProvider {
    static var previews: some View {
        SDDSButton.defaultTextWithSubtitle(size: .large)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Large button with text and subtitle")
        
        SDDSButton.defaultTextWithSubtitle(size: .large, layoutMode: .fixedWidth(.packed))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text and subtitle, fixed centered layout")
        
        SDDSButton.defaultTextWithSubtitle(size: .large, layoutMode: .fixedWidth(.spaceBetween))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text and subtitle, fixed side by side layout")
        
        SDDSButton.defaultTextWithSubtitle(size: .medium)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Medium button with text and subtitle")
        
        SDDSButton.defaultTextWithSubtitle(size: .small)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Small button with text and subtitle")
        
        SDDSButton.defaultTextWithSubtitle(size: .extraSmall)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XS button with text and subtitle")
        
        SDDSButton.defaultTextWithSubtitle(size: .extraExtraSmall)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XXS button with text and subtitle")
    }
}
