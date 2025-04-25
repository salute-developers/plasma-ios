import SwiftUI

// MARK: - SDDSAvatar

public enum AvatarExtraPlacement: String, CaseIterable {
    case bottomLeft
    case bottomRight
    case topLeft
    case topRight
}

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
public struct SDDSAvatar<Content: View>: View {
    let text: String
    let image: AvatarImageSource?
    let placeholderImage: AvatarImageSource?
    let status: AvatarStatus
    let accessibility: AvatarAccessibility
    let extraContent: Content
    let extraPlacement: AvatarExtraPlacement
    private var _appearance: AvatarAppearance?
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.avatarAppearance) private var environmentAppearance
    
    public init(
        text: String,
        image: AvatarImageSource?,
        placeholderImage: AvatarImageSource?,
        status: AvatarStatus,
        appearance: AvatarAppearance? = nil,
        accessibility: AvatarAccessibility,
        @ViewBuilder extraContent: () -> Content =  { EmptyView() },
        extraPlacement: AvatarExtraPlacement = .topRight
    ) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self._appearance = appearance
        self.extraContent = extraContent()
        self.extraPlacement = extraPlacement
        self.accessibility = accessibility
    }
    
    public init(data: SDDSAvatarData) where Content == AnyView {
        self.text = data.text
        self.image = data.image
        self.placeholderImage = data.placeholderImage
        self.status = data.status
        self.extraContent = data.extraContent
        self.extraPlacement = data.extraPlacement
        self._appearance = data.appearance
        self.accessibility = data.accessibility
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            if let placeholderImage = placeholderImage {
                avatar(imageSource: placeholderImage)
            } else {
                backgroundView
            }

            if let image = image {
                avatar(imageSource: image)
            } else {
                AvatarPlacementContainer(extraPlacement: extraPlacement) {
                    Text(text)
                        .typography(textTypography)
                        .fillText(style: appearance.textFillStyle)
                }
            }
                        
            AvatarPlacementContainer(extraPlacement: extraPlacement, extraOffset: appearance.size.extraOffset) {
                extraContent
                    .environment(\.badgeAppearance, appearance.badgeAppearance)
                    .environment(\.counterAppearance, appearance.counterAppearance)
            }
        }
        .frame(width: appearance.size.avatarSize.width, height: appearance.size.avatarSize.height)
        .accessibilityElement()
        .accessibilityLabel(accessibility.label)
        .accessibilityHint(accessibility.hint)
    }
    
    @ViewBuilder
    private func avatar(imageSource: AvatarImageSource) -> some View {
        AvatarPlacementContainer(extraPlacement: extraPlacement) {
            ZStack {
                avatarImage(for: imageSource)
                    .frame(width: appearance.size.avatarSize.width, height: appearance.size.avatarSize.height)
                
                if status != .hidden && extraPlacement != .bottomRight {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            statusView
                                .padding(.trailing, appearance.size.statusInsets.trailing)
                                .padding(.bottom, appearance.size.statusInsets.bottom)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        AvatarPlacementContainer(extraPlacement: extraPlacement) {
            Group {
                switch appearance.backgroundFillStyle {
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
                            .opacity(appearance.backgroundOpacity)
                            .clipShape(Circle())
                    }
                }
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
        SDDSIndicator(appearance: indicatorAppearance)
    }
    
    private var indicatorAppearance: IndicatorAppearance {
        var appearance = appearance.indicatorAppearance
        appearance.backgroundColor = statusColor
        return appearance
    }
    
    private var statusColor: ColorToken {
        switch status {
        case .online:
            return appearance.onlineStatusColor
        case .offline:
            return appearance.offlineStatusColor
        default:
            return Color.clear.token
        }
    }
    
    private var textTypography: TypographyToken {
        if let typography = appearance.textTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Avatar Typography")
        }
    }
    
    var appearance: AvatarAppearance {
        _appearance ?? environmentAppearance
    }
}
