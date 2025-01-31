import Foundation
import Combine
import SwiftUI
import SDDSComponents

import SDDSServTheme

final class RadioboxViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var isSelected: Bool = false
    @Published var isEnabled: Bool = true
    @Published var size: SDDSRadioboxSize = SDDSRadioboxSize.medium
    @Published var appearance: RadioboxAppearance = SDDSRadiobox.default.appearance
    @Published var variationName: String = SDDSRadiobox.default.name
    
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

extension SDDSRadioboxSize: Hashable {
    public static func == (lhs: SDDSRadioboxSize, rhs: SDDSRadioboxSize) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public static var allCases: [SDDSRadioboxSize] {
        [.medium, .small]
    }

    var description: String {
        switch self {
        case .medium:
            return "Medium"
        case .small:
            return "Small"
        }
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}
