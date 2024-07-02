import Foundation
import SDDSIcons
import SwiftUI

extension SDDSButtonViewModel {
    static func textOnly(size: ButtonSize) -> SDDSButtonViewModel {
        .init(title: "Label", size: size)
    }
    
    static func textWithImage(size: ButtonSize, alignment: Alignment = .left) -> SDDSButtonViewModel {
        .init(title: "Label", iconAttributes: IconAttributes(image: Asset.accessibility.image, alignment: alignment), size: size)
    }
    
    static func textWithSubtitle(size: ButtonSize) -> SDDSButtonViewModel {
        .init(title: "Label", subtitle: "Value", size: size)
    }
    
    static func textWithImageAndSubtitle(size: ButtonSize, alignment: Alignment = .left) -> SDDSButtonViewModel {
        .init(title: "Label", subtitle: "Value", iconAttributes: IconAttributes(image: Asset.accessibility.image, alignment: alignment), size: size)
    }
}
