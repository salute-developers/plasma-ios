import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class RadioboxGroupViewModel: ComponentViewModel<RadioboxGroupVariationProvider> {
    @Published var radioboxViewModels: [RadioboxItemViewModel]

    var radioboxData: [RadioboxData] {
        radioboxViewModels.map { $0.toRadioboxData(with: size.radioboxSize) }
    }

    init() {
        self.radioboxViewModels = (0..<3).map { index in
            RadioboxItemViewModel(
                title: "Label \(index + 1)",
                subtitle: "Description \(index + 1)",
                isSelected: false,
                isEnabled: true
            )
        }
    }
}

struct RadioboxItemViewModel {
    var title: String
    var subtitle: String
    var isSelected: Bool
    var isEnabled: Bool

    func toRadioboxData(with size: SDDSRadioboxSize) -> RadioboxData {
        var appearance = Radiobox.m.appearance
        appearance.size = size
        return RadioboxData(
            title: title,
            subtitle: subtitle,
            isSelected: .constant(isSelected),
            isEnabled: isEnabled,
            appearance: appearance,
            accessibility: .init()
        )
    }
}
