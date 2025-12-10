import Foundation
import SwiftUI

public struct EmbeddedChip: View {
    let title: String
    let isEnabled: Bool
    let iconImage: Image?
    let buttonImage: Image?
    let appearance: ChipAppearance
    let accessibility: ChipAccessibility
    let removeAction: () -> Void
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme

    


    public init(
        title: String,
        isEnabled: Bool,
        iconImage: Image? = nil,
        buttonImage: Image? = nil,
        appearance: ChipAppearance,
        accessibility: ChipAccessibility = ChipAccessibility(),
        removeAction: @escaping () -> Void) {
        self.title = title
        self.isEnabled = isEnabled
        self.iconImage = iconImage
        self.buttonImage = buttonImage
        self.appearance = appearance
        self.accessibility = accessibility
        self.removeAction = removeAction
    }
    
    public var body: some View {
        SDDSChip(
            title: title,
            isEnabled: isEnabled,
            iconImage: iconImage,
            buttonImage: buttonImage,
            appearance: appearance,
            accessibility: accessibility,
            removeAction: removeAction
        )
    }
}
