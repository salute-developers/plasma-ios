import SwiftUI
@_exported import SDDSThemeCore

// MARK: - SDDSAvatar

/**
 `SDDSAvatar` представляет собой аватар пользователя, отображающий текст, изображение или плейсхолдер с возможностью указания статуса.

 - Properties:
    - text: Текст, который отображается, если нет изображения; обычно инициалы.
    - image: Изображение аватара, передается как `AvatarImageSource`.
    - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
    - status: Статус аватара (`hidden`, `online`, `offline`).
    - appearance: Параметры внешнего вида аватара.
    - size: Конфигурация размеров для аватара.
    - accessibility: Параметры доступности для аватара.
 */
public struct SDDSAvatar: View {
    let text: String
    let image: AvatarImageSource?
    let placeholderImage: AvatarImageSource?
    let status: AvatarStatus
    let appearance: AvatarAppearance
    let size: AvatarSizeConfiguration
    let accessibility: AvatarAccessibility
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        text: String,
        image: AvatarImageSource?,
        placeholderImage: AvatarImageSource?,
        status: AvatarStatus,
        appearance: AvatarAppearance,
        size: AvatarSizeConfiguration,
        accessibility: AvatarAccessibility) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self.appearance = appearance
        self.size = size
        self.accessibility = accessibility
    }
    
    public init(data: SDDSAvatarData) {
        self.text = data.text
        self.image = data.image
        self.placeholderImage = data.placeholderImage
        self.status = data.status
        self.appearance = data.appearance
        self.size = data.size
        self.accessibility = data.accessibility
    }
    
    public var body: some View {
        ZStack {
            if let placeholderImage = placeholderImage {
                avatarImage(for: placeholderImage)
                    .frame(width: size.avatarSize.width, height: size.avatarSize.height)
            } else {
                backgroundView
            }

            if let image = image {
                avatarImage(for: image)
                    .frame(width: size.avatarSize.width, height: size.avatarSize.height)
            } else {
                Text(text)
                    .typography(textTypography)
                    .fillText(style: appearance.textFillStyle)
            }
            
            if status != .hidden {
                statusView
                    .frame(
                        width: size.statusSize.width,
                        height: size.statusSize.height
                    )
                    .position(
                        x: size.statusInsets.leading + size.statusSize.width / 2,
                        y: size.statusInsets.top + size.statusSize.height / 2
                    )
            }
        }
        .frame(width: size.avatarSize.width, height: size.avatarSize.height)
        .accessibilityElement()
        .accessibilityLabel(accessibility.label)
        .accessibilityHint(accessibility.hint)
    }
    
    @ViewBuilder
    private var backgroundView: some View {
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
            return appearance.onlineStatusColor.color(for: colorScheme)
        case .offline:
            return appearance.offlineStatusColor.color(for: colorScheme)
        default:
            return .clear
        }
    }
    
    private var textTypography: TypographyToken {
        if let typography = appearance.textTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Avatar Typography")
        }
    }
}

// MARK: - AvatarStatus

public enum AvatarStatus: String {
    case hidden
    case online
    case offline
}

// MARK: - AvatarSizeConfiguration

/**
 `AvatarSizeConfiguration` определяет размеры и отступы для аватара.

 - Properties:
    - avatarSize: Размер аватара.
    - statusSize: Размер иконки статуса.
    - statusInsets: Отступы иконки статуса относительно нижнего правого угла.
 */
public protocol AvatarSizeConfiguration {
    var avatarSize: CGSize { get }
    var statusSize: CGSize { get }
    var statusInsets: EdgeInsets { get }
}

// MARK: - AvatarAppearance

/**
 `AvatarAppearance` определяет внешний вид аватара, включая цвет текста, фона, цвета статусов и типографику.

 - Properties:
    - textFillStyle: Стиль заливки текста (цвет или градиент).
    - backgroundFillStyle: Стиль заливки фона (цвет или градиент).
    - onlineStatusColor: Цвет индикатора статуса "онлайн".
    - offlineStatusColor: Цвет индикатора статуса "оффлайн".
    - textTypography: Типографика текста.
 */
public struct AvatarAppearance: Hashable {
    public let id = UUID()
    public let textFillStyle: FillStyle
    public let backgroundFillStyle: FillStyle
    public let backgroundOpacity: CGFloat
    public let onlineStatusColor: ColorToken
    public let offlineStatusColor: ColorToken
    public let textTypography: TypographyConfiguration
    
    public init(
        textFillStyle: FillStyle,
        backgroundFillStyle: FillStyle,
        backgroundOpacity: CGFloat,
        onlineStatusColor: ColorToken,
        offlineStatusColor: ColorToken,
        textTypography: TypographyConfiguration
    ) {
        self.textFillStyle = textFillStyle
        self.backgroundFillStyle = backgroundFillStyle
        self.backgroundOpacity = backgroundOpacity
        self.onlineStatusColor = onlineStatusColor
        self.offlineStatusColor = offlineStatusColor
        self.textTypography = textTypography
    }
    
    public static func == (lhs: AvatarAppearance, rhs: AvatarAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - AvatarImageSource

/**
 `AvatarImageSource` определяет источник изображения для аватара.

 - Cases:
    - url: URL изображения, загружаемого асинхронно.
    - image: Локальное изображение типа `Image`.
 */
public enum AvatarImageSource {
    case url(URL)
    case image(Image)
}

// MARK: - AvatarAccessibility

/**
 `AvatarAccessibility` предоставляет параметры доступности для аватара.

 - Properties:
    - label: Метка доступности для аватара.
    - hint: Подсказка доступности для аватара.
 */
public struct AvatarAccessibility {
    public let label: String
    public let hint: String
    
    public init(label: String = "", hint: String = "") {
        self.label = label
        self.hint = hint
    }
}
