import Foundation
import Combine
import SwiftUI
import SDDSComponents

import SDDSServTheme

final class CheckboxViewModel: ObservableObject {
    // MARK: - Checkbox Properties
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var state: SelectionControlState = .deselected
    @Published var isEnabled: Bool = true
    @Published var size: SDDSCheckboxSize = SDDSCheckboxSize.medium
    @Published var appearance: CheckboxAppearance = SDDSCheckbox.default.appearance
    @Published var variationName: String = SDDSCheckbox.default.name
    
    // MARK: - Screen properties
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

extension SDDSCheckboxSize: Hashable {
    public static func == (lhs: SDDSCheckboxSize, rhs: SDDSCheckboxSize) -> Bool {
        lhs.rawValue == rhs.rawValue
    }

    public static var allCases: [SDDSCheckboxSize] {
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
