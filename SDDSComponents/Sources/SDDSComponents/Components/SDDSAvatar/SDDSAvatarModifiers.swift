import SwiftUI

// MARK: - SDDSAvatar Modifiers

@available(*, deprecated, message: "will be removed in future versions")
public extension View where Self == SDDSAvatar<EmptyView> {
    func status(_ newStatus: AvatarStatus) -> SDDSAvatar<EmptyView> {
        SDDSAvatar(
            text: self.text,
            image: self.image,
            placeholderImage: self.placeholderImage,
            status: newStatus,
            appearance: self.appearance,
            accessibility: self.accessibility
        )
    }
}
