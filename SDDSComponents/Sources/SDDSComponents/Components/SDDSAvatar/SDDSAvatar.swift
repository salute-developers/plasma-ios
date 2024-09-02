import SwiftUI
import SDDSThemeCore

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
            } else {
                backgroundView
            }

            if let image = image {
                avatarImage(for: image)
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
        case .gradient(let gradientToken):
            Circle()
                .gradient(gradientToken, colorScheme: colorScheme)
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
            return appearance.onlineStatusColor
        case .offline:
            return appearance.offlineStatusColor
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

public enum AvatarStatus {
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
public struct AvatarAppearance {
    public let textFillStyle: FillStyle
    public let backgroundFillStyle: FillStyle
    public let onlineStatusColor: Color
    public let offlineStatusColor: Color
    public let textTypography: TypographyConfiguration
    
    public init(
        textFillStyle: FillStyle,
        backgroundFillStyle: FillStyle,
        onlineStatusColor: Color,
        offlineStatusColor: Color,
        textTypography: TypographyConfiguration
    ) {
        self.textFillStyle = textFillStyle
        self.backgroundFillStyle = backgroundFillStyle
        self.onlineStatusColor = onlineStatusColor
        self.offlineStatusColor = offlineStatusColor
        self.textTypography = textTypography
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

// MARK: - Preview

struct SDDSAvatarPreview: PreviewProvider {
    static var previews: some View {
        Group {
            // Online Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .online,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .online,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Placeholder with Text")

            // Offline Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Placeholder with Text")
            
            // Hidden Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Placeholder with Text")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
    
    static var defaultAppearance: AvatarAppearance {
        AvatarAppearance(
            textFillStyle: .color(Color.green.token),
            backgroundFillStyle: .color(Color.blue.token),
            onlineStatusColor: .green,
            offlineStatusColor: .red,
            textTypography: AvatarTypography(token: .semibold(32)).asContainer
        )
    }
    
    static var defaultSize: AvatarSizeConfiguration {
        return DefaultAvatarSize()
    }
    
    static var defaultAccessibility: AvatarAccessibility {
        AvatarAccessibility(label: "User Avatar", hint: "Displays user status and initials or image")
    }
}

struct DefaultAvatarSize: AvatarSizeConfiguration {
    var avatarSize: CGSize { CGSize(width: 88, height: 88) }
    var statusSize: CGSize { CGSize(width: 12, height: 12) }
    var statusInsets: EdgeInsets { EdgeInsets(top: 69, leading: 69, bottom: 0, trailing: 0) }
}

struct AvatarTypography: GeneralTypographyConfiguration {
    let token: TypographyToken
    
    func typography(with size: AvatarSizeConfiguration) -> TypographyToken? {
        return token
    }
}
