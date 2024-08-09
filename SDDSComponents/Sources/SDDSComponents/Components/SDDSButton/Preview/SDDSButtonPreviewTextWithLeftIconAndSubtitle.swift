import Foundation
import SwiftUI

//// MARK: - Preview: Text with Left Icon and Subtitle
struct SDDSButtonPreviewTextWithLeftIconAndSubtitle: PreviewProvider {
    static var previews: some View {
        SDDSButton.textWithLeftIconAndSubtitle(size: .large)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Large button with text, subtitle, and left icon")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .large, layoutMode: .fixedWidth(.packed))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text, subtitle, left icon, fixed centered layout")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .large, layoutMode: .fixedWidth(.spaceBetween))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text, subtitle, left icon, fixed side by side layout")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .medium)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Medium button with text, subtitle, and left icon")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .small)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Small button with text, subtitle, and left icon")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .xs)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XS button with text, subtitle, and left icon")
        
        SDDSButton.textWithLeftIconAndSubtitle(size: .xxs)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XXS button with text, subtitle, and left icon")
    }
}
