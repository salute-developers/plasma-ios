import SwiftUI

// MARK: - Avatar Modifiers

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
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: newStatus,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }

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
}
