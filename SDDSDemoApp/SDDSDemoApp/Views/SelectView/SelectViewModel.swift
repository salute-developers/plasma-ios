import Foundation
import SDDSComponents

enum SelectTriggerPosition: String, CaseIterable {
    case topStart = "TopStart"
    case topCenter = "TopCenter"
    case topEnd = "TopEnd"
    case centerStart = "CenterStart"
    case center = "Center"
    case centerEnd = "CenterEnd"
    case bottomStart = "BottomStart"
    case bottomCenter = "BottomCenter"
    case bottomEnd = "BottomEnd"
}

enum SelectTriggerKind: String, CaseIterable {
    case textField
    case button
}

final class SelectViewModel: ComponentViewModel<SelectVariationProvider> {
    @Published var triggerKind: SelectTriggerKind = .textField
    @Published var triggerPosition: SelectTriggerPosition = .center
    @Published var placement: PopoverPlacement = .bottom
    @Published var alignment: PopoverAlignment = .start
    @Published var placementMode: PopoverPlacementMode = .strict
    @Published var layout: SelectDemoLayout = .normal {
        didSet {
            variationProvider.layout = layout
            selectVariation(variations.first)
        }
    }
    @Published var mode: SelectDemoMode = .single {
        didSet {
            variationProvider.mode = mode
            dataStateManager.updateMode(mode == .single ? .single : .multiple)
            selectVariation(variations.first)
            selectedIDs = dataStateManager.selectedOptionIDs
            updateOptions()
        }
    }
    
    @Published var disabled: Bool = false
    @Published var readOnly: Bool = false
    @Published var isDropdownPresented: Bool = false
    @Published var isLoading: Bool = false
    @Published var showEmptyState: Bool = false
    @Published var showHeader: Bool = true
    @Published var showFooter: Bool = false
    
    @Published private(set) var options: [SelectOption] = []
    @Published private var selectedIDs: Set<UUID> = []
    
    private let dataStateManager = SelectDataStateManager(mode: .single)
    
    private let baseItems: [SelectOption] = [
        SelectOption(id: UUID(), title: "Москва"),
        SelectOption(id: UUID(), title: "Санкт-Петербург"),
        SelectOption(id: UUID(), title: "Казань"),
        SelectOption(id: UUID(), title: "Сочи"),
        SelectOption(id: UUID(), title: "Екатеринбург"),
        SelectOption(id: UUID(), title: "Калининград")
    ]
    
    var displayedOptions: [SelectOption] {
        showEmptyState ? [] : options
    }
    
    var displayText: String {
        let selectedItems = options.filter { selectedIDs.contains($0.id) }
        switch mode {
        case .single:
            return selectedItems.first?.title ?? "Город"
        case .multiple:
            let value = selectedItems.map(\.title).joined(separator: ", ")
            return value.isEmpty ? "Город" : value
        }
    }
    
    var displayChips: [ChipData] {
        guard mode == .multiple else { return [] }
        let chipAppearance = appearance.textFieldAppearance.chipAppearance
        return options
            .filter { selectedIDs.contains($0.id) }
            .map { option in
                ChipData(
                    title: option.title,
                    isEnabled: true,
                    iconImage: nil,
                    buttonImage: nil,
                    appearance: chipAppearance,
                    accessibility: ChipAccessibility(),
                    removeAction: {}
                )
            }
    }
    
    init() {
        super.init(variationProvider: SelectVariationProvider())
        dataStateManager.updateMode(.single)
        updateOptions()
    }
    
    func handleTap(at index: Int) {
        guard index < options.count else { return }
        let result = dataStateManager.handleTap(
            options: options,
            at: index,
            isReadOnly: readOnly || disabled
        )
        selectedIDs = result.selectedIDs
        updateOptions()
    }
    
    private func updateOptions() {
        options = baseItems.map { item in
            SelectOption(
                id: item.id,
                label: item.label,
                title: item.title,
                subtitle: item.subtitle,
                isSelected: selectedIDs.contains(item.id),
                isEnabled: item.isEnabled
            )
        }
    }
}

