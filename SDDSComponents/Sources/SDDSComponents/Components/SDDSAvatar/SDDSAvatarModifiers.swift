import SwiftUI

// MARK: - SDDSAvatar Modifiers

public extension View where Self == SDDSAvatar {
    func text(_ newText: String) -> SDDSAvatar {
        SDDSAvatar(
            text: newText,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }

    func image(_ newImage: AvatarImageSource?) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: newImage,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }

    func placeholderImage(_ newPlaceholderImage: AvatarImageSource?) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: newPlaceholderImage,
            status: self.status,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }

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

    func appearance(_ newAppearance: AvatarAppearance) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: newAppearance,
            accessibility: self.accessibility
        )
    }

    func size(_ newSize: AvatarSizeConfiguration) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }

    func accessibility(_ newAccessibility: AvatarAccessibility) -> SDDSAvatar {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self._appearance,
            accessibility: newAccessibility
        )
    }
}
