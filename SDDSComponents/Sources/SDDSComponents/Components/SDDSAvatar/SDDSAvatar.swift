import SwiftUI

// MARK: - Avatar

/**
 `SDDSAvatar` представляет собой аватар пользователя, отображающий текст, изображение или плейсхолдер с возможностью указания статуса.

 - Properties:
    - text: Текст, который отображается, если нет изображения; обычно инициалы.
    - image: Изображение аватара, передается как `AvatarImageSource`.
    - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
    - status: Статус аватара (`hidden`, `online`, `offline`).
    - appearance: Параметры внешнего вида аватара.
    - accessibility: Параметры доступности для аватара.
 */
public struct SDDSAvatar: View {
    let text: String
    let image: AvatarImageSource?
    let placeholderImage: AvatarImageSource?
    let status: AvatarStatus
<<<<<<< HEAD
=======
    let appearance: AvatarAppearance?
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    let accessibility: AvatarAccessibility
    var _appearance: AvatarAppearance?
    private var appearance: AvatarAppearance {
        _appearance ?? avatarAppearance
    }
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.avatarAppearance) var avatarAppearance
    
    public init(
        text: String,
        image: AvatarImageSource?,
        placeholderImage: AvatarImageSource?,
        status: AvatarStatus,
        appearance: AvatarAppearance? = nil,
        accessibility: AvatarAccessibility) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self._appearance = appearance
        self.accessibility = accessibility
    }
    
    public init(data: SDDSAvatarData) {
        self.text = data.text
        self.image = data.image
        self.placeholderImage = data.placeholderImage
        self.status = data.status
        self._appearance = data.appearance
        self.accessibility = data.accessibility
    }
    
    public var body: some View {
        ZStack {
            if let placeholderImage = placeholderImage {
                avatarImage(for: placeholderImage)
                    .frame(width: selectedAppearance.size.avatarSize.width, height: selectedAppearance.size.avatarSize.height)
            } else {
                backgroundView
            }

            if let image = image {
                avatarImage(for: image)
                    .frame(width: selectedAppearance.size.avatarSize.width, height: selectedAppearance.size.avatarSize.height)
            } else {
                Text(text)
                    .typography(textTypography)
                    .fillText(style: selectedAppearance.textFillStyle)
            }
            
            if status != .hidden {
                statusView
                    .frame(
                        width: selectedAppearance.size.statusSize.width,
                        height: selectedAppearance.size.statusSize.height
                    )
                    .position(
                        x: selectedAppearance.size.statusInsets.leading + selectedAppearance.size.statusSize.width / 2,
                        y: selectedAppearance.size.statusInsets.top + selectedAppearance.size.statusSize.height / 2
                    )
            }
        }
        .frame(width: selectedAppearance.size.avatarSize.width, height: selectedAppearance.size.avatarSize.height)
        .accessibilityElement()
        .accessibilityLabel(accessibility.label)
        .accessibilityHint(accessibility.hint)
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch selectedAppearance.backgroundFillStyle {
        case .color(let colorToken):
            Circle()
                .fill(colorToken.color(for: colorScheme))
                .clipShape(Circle())
        case .gradient(let gradientToken):
            ZStack {
                Circle()
                    .fill(.white)
                    .clipShape(Circle())
                Circle()
                    .fill(.white)
                    .gradient(gradientToken, colorScheme: colorScheme)
                    .opacity(selectedAppearance.backgroundOpacity)
                    .clipShape(Circle())
            }
        }
    }
    
    @ViewBuilder
    private func avatarImage(for source: AvatarImageSource) -> some View {
        switch source {
        case .url(let url):
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                backgroundView
            }
            .clipShape(Circle())
        case .image(let image):
            image
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
        }
    }
    
    private var statusView: some View {
        Circle()
            .fill(statusColor)
    }
    
    private var statusColor: Color {
        switch status {
        case .online:
            return selectedAppearance.onlineStatusColor.color(for: colorScheme)
        case .offline:
            return selectedAppearance.offlineStatusColor.color(for: colorScheme)
        default:
            return .clear
        }
    }
    
    private var textTypography: TypographyToken {
        if let typography = selectedAppearance.textTypography.typography(with: selectedAppearance.size) {
            return typography
        } else {
            fatalError("Undefined Avatar Typography")
        }
    }
    
    private var selectedAppearance: AvatarAppearance {
        appearance ?? avatarAppearance
    }
}
