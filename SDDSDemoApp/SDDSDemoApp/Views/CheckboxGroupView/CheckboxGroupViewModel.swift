import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class CheckboxGroupViewModel: ObservableObject {
    @Published var checkboxViewModels: [CheckboxItemViewModel] = [] {
        didSet {
            self.updateGroupBehaviour()
        }
    }
    @Published var size: SDDSCheckboxGroupSize = .medium {
        didSet {
            self.update()
        }
    }
    @Published var groupBehaviour: CheckboxGroupBehaviour?
    
    @Published var states: [Int: SelectionControlState] = [:]

    var checkboxData: [CheckboxData] {
       return checkboxViewModels.enumerated().map { index, value in
           return value.toCheckboxData(with: size.checkboxSize, state: Binding(get: { [weak self] in
               self?.states[index] ?? .deselected
           }, set: { [weak self] newState in
               self?.states[index] = newState
           }))
       }
    }
    
    init() {
        self.update()
    }
    
    func update() {
        checkboxViewModels = (0..<3).map { [weak self] index in
            self?.states[Int(index)] = .deselected
            return CheckboxItemViewModel(
                id: index,
                title: "Label \(index + 1)",
                subtitle: "Description \(index + 1)",
                isEnabled: true
            )
        }
        updateGroupBehaviour()
    }
    
    func update(at index: Int, to newState: SelectionControlState) {
        states[index] = newState
        updateGroupBehaviour()
    }
    
    func updateGroupBehaviour() {
        self.groupBehaviour = .default(data: checkboxData, onChange: { [weak self] index, state in
            self?.states[index] = state
            self?.updateGroupBehaviour()
        })
    }
}

struct CheckboxItemViewModel: Identifiable {
    var id: Int
    var title: String
    var subtitle: String
    var isEnabled: Bool

    func toCheckboxData(with size: SDDSCheckboxSize, state: Binding<SelectionControlState>) -> CheckboxData {
        var appearance = Checkbox.m.default.appearance
        appearance.size = size
        return CheckboxData(
            state: state,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            images: CheckboxView.checkbox,
            appearance: appearance,
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
