import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SwitchViewModel: ObservableObject {
    // MARK: - Switch Properties
    @Published var title: String = "Switch Title"
    @Published var subtitle: String = "Switch Subtitle"
    @Published var isOn: Bool = true
    @Published var isEnabled: Bool = true
    @Published var size: SDDSSwitchSize = .medium
    @Published var appearance: SwitchAppearance = SDDSSwitch.default.appearance
    @Published var variationName: String = SDDSSwitch.default.name
    @Published var switchAccessibility: SwitchAccessibility = SwitchAccessibility()
    
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

extension SDDSSwitchSize: Hashable, CaseIterable {
    public static func == (lhs: SDDSSwitchSize, rhs: SDDSSwitchSize) -> Bool {
        lhs.hashValue == rhs.hashValue
    }

    public static var allCases: [SDDSSwitchSize] {
        [.large, .medium, .small]
    }

    var description: String {
        switch self {
        case .large:
            return "Large"
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
