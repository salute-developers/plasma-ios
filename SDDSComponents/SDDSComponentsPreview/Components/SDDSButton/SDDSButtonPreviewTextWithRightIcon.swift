import Foundation
import SDDSComponents
import SwiftUI

//// MARK: - Preview: Text with Right Icon
struct SDDSButtonPreviewTextWithRightIcon: PreviewProvider {
    static var previews: some View {
        SDDSButton.textWithRightIcon(size: .large)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Large button with text and right icon")
        
        SDDSButton.textWithRightIcon(size: .large, layoutMode: .fixedWidth(.packed))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text and right icon, fixed centered layout")
        
        SDDSButton.textWithRightIcon(size: .large, layoutMode: .fixedWidth(.spaceBetween))
            .previewLayout(.fixed(width: 200, height: ButtonSize.large.height))
            .previewDisplayName("Large button with text and right icon, fixed side by side layout")
        
        SDDSButton.textWithRightIcon(size: .medium)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Medium button with text and right icon")
        
        SDDSButton.textWithRightIcon(size: .small)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Small button with text and right icon")
        
        SDDSButton.textWithRightIcon(size: .extraSmall)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XS button with text and right icon")
        
        SDDSButton.textWithRightIcon(size: .extraExtraSmall)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("XXS button with text and right icon")
    }
}
