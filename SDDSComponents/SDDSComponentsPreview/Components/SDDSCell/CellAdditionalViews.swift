import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
//import SDDSIcons

extension CellPreview {    
//    static var iconButton: IconButton {
//        IconButton(
//            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
//            isDisabled: false,
//            isLoading: false,
//            spinnerImage: Image.image("spinner"),
//            appearance: IconButton.l.accent.appearance,
//            layoutMode: .fixedWidth(.packed),
//            action: {}
//        )
//    }
    
    static var text: CellCustomViewProvider {
        CellCustomViewProvider(
            view: Text("Custom text")
        )
    }
    
    static var avatar: SDDSAvatar {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: SDDSAvatar.extraExtraLarge.large.appearance,
            accessibility: AvatarAccessibility()
        )
    }
//    static var avatar: SDDSAvatarData {
//        SDDSAvatarData(
//            text: "AB",
//            image: .image(Image.image("checker")),
//            placeholderImage: nil,
//            status: .online,
//            appearance: SDDSAvatar.extraExtraLarge.large.appearance,
//            accessibility: AvatarAccessibility()
//        )
//    }
}
