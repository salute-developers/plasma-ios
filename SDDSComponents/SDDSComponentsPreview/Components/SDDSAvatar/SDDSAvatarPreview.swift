import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSAvatarPreview: PreviewProvider {
    private static let initTheme: Void = {
        ServThemeInitializer.initialize()
    }()
    
    static var previews: some View {
        let _ = Self.initTheme
        
        return SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            accessibility: AvatarAccessibility()
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Default")
    }
}
