import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview

final class AvatarViewModel: ObservableObject {
    @Published var text: String = "AB"
    @Published var image: AvatarImageSource? = nil
    @Published var placeholderImage: AvatarImageSource? = nil
    @Published var status: AvatarStatus = .online
    @Published var appearance: AvatarAppearance = .default
    @Published var size: DefaultAvatarSize = .large
    @Published var accessibility: AvatarAccessibility = AvatarAccessibility()

    init() {}
}

extension AvatarAppearance: CaseIterable {
    public static var allCases: [AvatarAppearance] {
        [.default]
    }

    public var name: String {
        return "Default"
    }
}

extension AvatarStatus: CaseIterable, Identifiable {
    public var id: String { rawValue }

    public static var allCases: [AvatarStatus] {
        [.hidden, .online, .offline]
    }
}

extension DefaultAvatarSize: CaseIterable, Hashable {
    public static func == (lhs: DefaultAvatarSize, rhs: DefaultAvatarSize) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public static var allCases: [DefaultAvatarSize] {
        [.extraExtraLarge, .large, .medium, .small]
    }

    var description: String {
        switch self {
        case .extraExtraLarge:
            return "Extra Extra Large"
        case .large:
            return "Large"
        case .medium:
            return "Medium"
        case .small:
            return "Small"
        case .scalable(let height):
            return "Scalable (\(height)pt)"
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
