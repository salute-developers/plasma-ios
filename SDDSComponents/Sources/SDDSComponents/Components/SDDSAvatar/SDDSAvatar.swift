import SwiftUI

// MARK: - SDDSAvatar
/**
 `AvatarExtraPlacement` определяет расположение дополнительного контента (`extra`) относительно аватара.

 - Cases:
    - `none`: Дополнительный контент не отображается.
    - `bottomLeft`: В левом нижнем углу аватара.
    - `bottomRight`: В правом нижнем углу аватара.
    - `topLeft`: В левом верхнем углу аватара.
    - `topRight`: В правом верхнем углу аватара.
 */
public struct AvatarExtra<Content: View> {
    let placement: AvatarExtraPlacement
    let content: Content
    
    public init(placement: AvatarExtraPlacement, @ViewBuilder content: () -> Content = { EmptyView() }) {
        self.placement = placement
        self.content = content()
    }
}

/**
 `AvatarExtra` позволяет добавить произвольный контент (например, бейдж, иконку или счетчик) к аватару с возможностью указания его расположения.

 - Parameters:
    - placement: Положение дополнительного контента относительно аватара ``AvatarExtraPlacement``.
    - content: View-контент, который будет отображаться в выбранном положении.
*/
public enum AvatarExtraPlacement: String, CaseIterable {
    case none
    case bottomLeft
    case bottomRight
    case topLeft
    case topRight
}

/**
 `SDDSAvatar` представляет собой аватар пользователя, отображающий текст, изображение или плейсхолдер с возможностью указания статуса.

 - Parameters:
    - text: Текст, который отображается, если нет изображения; обычно инициалы.
    - image: Изображение аватара, передается как `AvatarImageSource`.
    - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
    - status: Статус аватара (`hidden`, `online`, `offline`).
    - appearance: Параметры внешнего вида аватара.
    - accessibility: Параметры доступности для аватара.
 
 ```swift
 SDDSAvatar(
     text: "JD",
     image: nil,
     placeholderImage: nil,
     status: .online,
     appearance: Avatar.xxl.appearance,
     accessibility: AvatarAccessibility()
 )
 ```
 */
public struct SDDSAvatar<Content: View>: View {
    let text: String
    let image: AvatarImageSource?
    let placeholderImage: AvatarImageSource?
    let status: AvatarStatus
    let accessibility: AvatarAccessibility
    let extra: AvatarExtra<Content>
    private var _appearance: AvatarAppearance?
    private let extraContent: Content
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.avatarAppearance) private var environmentAppearance
    
    public init(
        text: String,
        image: AvatarImageSource?,
        placeholderImage: AvatarImageSource?,
        status: AvatarStatus,
        appearance: AvatarAppearance? = nil,
        accessibility: AvatarAccessibility,
        extra: AvatarExtra<Content> = AvatarExtra(placement: .none)
    ) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self._appearance = appearance
        self.extra = extra
        self.extraContent = extra.content
        self.accessibility = accessibility
    }
    
    public init(data: SDDSAvatarData) where Content == AnyView {
        self.text = data.text
        self.image = data.image
        self.placeholderImage = data.placeholderImage
        self.status = data.status
        self.extra = data.extra
        self.extraContent = extra.content
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
                    ZStack {
                        Text(text)
                            .typography(textTypography)
                            .fillText(style: appearance.textFillStyle)
                            .frame(width: appearance.size.avatarSize.width, height: appearance.size.avatarSize.height)
                        indicatorView
                    }
                }
            }
            
            if extraPlacement != .none {
                AvatarPlacementContainer(extraPlacement: extraPlacement, extraOffset: appearance.size.extraOffset) {
                    extraContent
                        .environment(\.badgeAppearance, appearance.badgeAppearance ?? .defaultValue)
                        .environment(\.counterAppearance, appearance.counterAppearance)
                }
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
                    .shape(pathDrawer: appearance.size.pathDrawer)
                
                indicatorView
            }
        }
    }
    
    @ViewBuilder
    private var indicatorView: some View {
        if status != .hidden && (extraPlacement != .bottomRight) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    statusView
                        .padding(.trailing, appearance.size.statusInsets.trailing)
                        .padding(.bottom, appearance.size.statusInsets.bottom)
                }
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        AvatarPlacementContainer(extraPlacement: extraPlacement) {
            Group {
                switch appearance.backgroundFillStyle {
                case .color(let colorToken):
                    Rectangle()
                        .fill(colorToken.color(for: colorScheme))
                        .shape(pathDrawer: appearance.size.pathDrawer)
                case .gradient(let gradientToken):
                    ZStack {
                        Rectangle()
                            .fill(gradientBackgroundColor)
                            .shape(pathDrawer: appearance.size.pathDrawer)
                        Rectangle()
                            .fill(gradientBackgroundColor)
                            .gradient(gradientToken, colorScheme: colorScheme)
                            .opacity(appearance.backgroundOpacity)
                            .shape(pathDrawer: appearance.size.pathDrawer)
                    }
                }
            }
            .frame(width: appearance.size.avatarSize.width, height: appearance.size.avatarSize.height)
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
        case .image(let image):
            image
                .resizable()
                .scaledToFill()
        }
    }
    
    private var gradientBackgroundColor: Color {
        colorScheme == .dark ? .black : .white
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
    
    private var extraPlacement: AvatarExtraPlacement {
        extra.placement
    }
}
