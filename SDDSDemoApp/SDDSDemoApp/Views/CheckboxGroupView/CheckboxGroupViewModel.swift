import SwiftUI
import SDDSComponents
import SDDSServTheme

final class CheckboxGroupViewModel: ComponentViewModel<CheckboxGroupVariationProvider>, ViewModelDelegate {
    @Published var checkboxViewModels: [CheckboxItemViewModel] = [] {
        didSet {
            self.updateGroupBehaviour()
        }
    }
    @Published var groupBehaviour: CheckboxGroupBehaviour?
    
    @Published var states: [Int: SelectionControlState] = [:]

    var checkboxData: [CheckboxData] {
       return checkboxViewModels.enumerated().map { index, value in
           return value.toCheckboxData(with: appearance.checkboxAppearance, state: Binding(get: { [weak self] in
               self?.states[index] ?? .deselected
           }, set: { [weak self] newState in
               self?.states[index] = newState
           }))
       }
    }
    
    init() {
        super.init(variationProvider: CheckboxGroupVariationProvider())
        self.update()
        delegate = self
    }
    
    func update() {
        checkboxViewModels = (0..<3).map { [weak self] index in
            self?.states[Int(index)] = .deselected
            return CheckboxItemViewModel(
                id: index,
                title: "Label \(index + 1)",
                subtitle: "Description \(index + 1)",
                isEnabled: true,
                appearance: self?.appearance.checkboxAppearance ?? .init()
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
    
    func updateAppearance() {
        checkboxViewModels = checkboxViewModels.map { item in
            var itemViewModel = item
            itemViewModel.appearance = appearance.checkboxAppearance
            return itemViewModel
        }
        updateGroupBehaviour()
    }
}

struct CheckboxItemViewModel: Identifiable {
    var id: Int
    var title: String
    var subtitle: String
    var isEnabled: Bool
    var appearance: CheckboxAppearance

    func toCheckboxData(with appearance: CheckboxAppearance, state: Binding<SelectionControlState>) -> CheckboxData {
        return CheckboxData(
            state: state,
            title: title,
            subtitle: subtitle,
            isEnabled: isEnabled,
            appearance: appearance,
            accessibility: .init()
        )
    }
}
