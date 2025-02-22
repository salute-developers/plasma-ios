import SwiftUI

// MARK: - Avatar Modifiers

<<<<<<< HEAD
public extension View where Self == SDDSAvatar {
    func status(_ newStatus: AvatarStatus) -> SDDSAvatar {
        SDDSAvatar(
=======
public extension View where Self == Avatar {
    func text(_ newText: String) -> Avatar {
        Avatar(
            text: newText,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }

    func image(_ newImage: AvatarImageSource?) -> Avatar {
        Avatar(
            text: self.text,
            image: newImage,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }

    func placeholderImage(_ newPlaceholderImage: AvatarImageSource?) -> Avatar {
        Avatar(
            text: self.text,
            image: self.image,
            placeholderImage: newPlaceholderImage,
            status: self.status,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }

    func status(_ newStatus: AvatarStatus) -> Avatar {
        Avatar(
>>>>>>> 2bf45767 (chore: generate cell+base-variations)
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: newStatus,
            appearance: self._appearance,
            accessibility: self.accessibility
        )
    }
<<<<<<< HEAD
=======

    func appearance(_ newAppearance: AvatarAppearance) -> Avatar {
        Avatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: newAppearance,
            accessibility: self.accessibility
        )
    }

    func size(_ newSize: AvatarSizeConfiguration) -> Avatar {
        Avatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }

    func accessibility(_ newAccessibility: AvatarAccessibility) -> Avatar {
        Avatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: self.status,
            appearance: self.appearance,
            accessibility: newAccessibility
        )
    }
>>>>>>> 2bf45767 (chore: generate cell+base-variations)
}
