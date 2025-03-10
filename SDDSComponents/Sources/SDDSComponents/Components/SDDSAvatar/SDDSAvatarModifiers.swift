import SwiftUI

// MARK: - SDDSAvatar Modifiers

public extension View where Self == SDDSAvatar {
    func status(_ newStatus: AvatarStatus) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: newStatus,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }
}
