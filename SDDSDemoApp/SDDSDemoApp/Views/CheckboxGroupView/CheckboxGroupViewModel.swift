import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview

final class CheckboxGroupViewModel: ObservableObject {
    @Published var checkboxViewModels: [CheckboxItemViewModel]
    @Published var size: SDDSCheckboxGroupSize = .medium

    var groupBehaviour: CheckboxGroupBehaviour {
        .default(data: checkboxData)
    }

    var checkboxData: [CheckboxData] {
        checkboxViewModels.map { $0.toCheckboxData(with: size.checkboxSize) }
    }

    init() {
        self.checkboxViewModels = (0..<3).map { index in
            CheckboxItemViewModel(
                title: "Label \(index + 1)",
                subtitle: "Description \(index + 1)",
                isSelected: false,
                isEnabled: true
            )
        }
    }
}

// MARK: - CheckboxItemViewModel

struct CheckboxItemViewModel {
    var title: String
    var subtitle: String
    var isSelected: Bool
    var isEnabled: Bool

    func toCheckboxData(with size: SDDSCheckboxSize) -> CheckboxData {
        CheckboxData(
            state: .constant(isSelected ? .selected : .deselected),
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            images: .checkbox,
            size: size,
            appearance: .default,
            accessibility: .init()
        )
    }
}

// MARK: - Extension

private extension SDDSCheckboxGroupSize {
    var checkboxSize: SDDSCheckboxSize {
        switch self {
        case .medium:
            return .medium
        case .small:
            return .small
        }
    }
}
