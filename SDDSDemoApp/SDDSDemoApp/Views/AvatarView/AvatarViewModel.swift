import SwiftUI
import Combine
import SDDSComponents

import SDDSServTheme

final class AvatarViewModel: ObservableObject {
    @Published var text: String = "AB"
    @Published var image: AvatarImageSource? = nil
    @Published var placeholderImage: AvatarImageSource? = nil
    @Published var status: AvatarStatus = .online
    @Published var appearance: AvatarAppearance = SDDSAvatar.default.appearance
    @Published var variationName: String = SDDSAvatar.default.name
    @Published var size: SDDSAvatarSize = .medium
    @Published var accessibility: AvatarAccessibility = AvatarAccessibility()
    @Published var isPlaceholder = false
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        observeSizeChange()
    }
    
    private func observeSizeChange() {
        $size
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                self.appearance = self.appearance.size(value)
            }
            .store(in: &cancellables)
    }
}

extension AvatarStatus: CaseIterable, Identifiable {
    public var id: String { rawValue }

    public static var allCases: [AvatarStatus] {
        [.hidden, .online, .offline]
    }
}

extension SDDSAvatarSize: CaseIterable, Hashable {
    public static func == (lhs: SDDSAvatarSize, rhs: SDDSAvatarSize) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public static var allCases: [SDDSAvatarSize] {
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
