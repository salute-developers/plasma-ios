import SwiftUI
import Combine
import SDDSComponents
import SDDSIcons

final class TabsViewModel: ComponentViewModel<TabsVariationProvider> {
    typealias Appearance = TabsAppearance
    
    enum TabItemType {
        case `default`
        case header
        case icon
    }
    
    @Published var tabsType: SDDSTabsType = .tabsDefault {
        didSet {
            self.variationProvider.tabsType = tabsType
            self.selectVariation(variations.first)
            
            if tabsType == .iconTabs {
                tabItemType = .icon
            } else {
                if tabsType == .tabsHeader {
                    hasStartContentIcon = false
                    hasEndContentIcon = false
                }
                if tabItemType == .icon {
                    tabItemType = .default
                }
            }
            
            selectedId = "tab1"
        }
    }
    
    @Published var tabItemType: TabItemType = .default
    @Published var selectedId: String = "tab1"
    @Published var numberOfTabs: Int = 3
    @Published var showAllText: String = "Show All"
    @Published var dropdownMaxHeight: CGFloat = 186
    @Published var clipModeType: ClipModeType = .none
    @Published var stretch: Bool = true
    @Published var hasDivider: Bool = true
    
    @Published var label: String = "Label"
    @Published var value: String? = nil
    @Published var hasValue: Bool = false {
        didSet {
            value = hasValue ? "Value" : nil
        }
    }
    @Published var counterValue: Int? = nil
    @Published var hasCounter: Bool = false {
        didSet {
            counterValue = hasCounter ? 5 : nil
        }
    }
    @Published var hasStartContentIcon: Bool = false
    @Published var hasEndContentIcon: Bool = false
    @Published var hasAction: Bool = false
    @Published var isDisabled: Bool = false
    
    var counterName: String {
        tabsType != .iconTabs ? "Counter" : "Extra"
    }
    
    var viewIdentifier: String {
        [
            tabsType.rawValue,
            variation?.name ?? "",
            "\(tabItemType)",
            clipModeType.rawValue,
            "\(stretch)",
            "\(hasDivider)",
            "\(numberOfTabs)",
            label,
            "\(hasValue)",
            "\(hasCounter)",
            "\(hasStartContentIcon)",
            "\(hasEndContentIcon)",
            "\(hasAction)",
            "\(isDisabled)"
        ].joined(separator: "-")
    }
    
    enum ClipModeType: String, CaseIterable {
        case none = "None"
        case showMore = "Show More"
        case scroll = "Scroll"
    }
    
    var clipMode: TabsClipMode {
        switch clipModeType {
        case .none:
            return .none
        case .showMore:
            if tabsType == .iconTabs {
                let showMoreTabItem = SDDSTabItem(
                    label: "",
                    counterValue: nil,
                    isSelected: true,
                    isDisabled: false,
                    hasStartContent: appearance.disclosureIcon != nil,
                    hasContentRight: false,
                    hasActionContent: false,
                    orientation: appearance.size.orientation,
                    appearance: appearance.tabItemAppearance,
                    startContent: {
                        if let disclosureIcon = appearance.disclosureIcon {
                            AnyView(
                                disclosureIcon
                                    .resizable()
                                    .renderingMode(.template)
                            )
                        } else {
                            AnyView(EmptyView())
                        }
                    },
                    contentRight: { EmptyView() },
                    actionContent: { EmptyView() }
                )
                return .showMore(
                    showMoreItem: TabItem(id: "showMore", tabItem: showMoreTabItem, label: nil, isDisabled: false),
                    dropdownItems: dropdownItems,
                    maxHeight: dropdownMaxHeight
                )
            } else {
                let showMoreTabItem = SDDSTabItem(
                    label: showAllText,
                    counterValue: nil,
                    isSelected: true,
                    isDisabled: false,
                    hasStartContent: false,
                    hasContentRight: false,
                    hasActionContent: false,
                    orientation: appearance.size.orientation,
                    appearance: appearance.tabItemAppearance,
                    startContent: { EmptyView() },
                    contentRight: { EmptyView() },
                    actionContent: { EmptyView() }
                )
                return .showMore(
                    showMoreItem: TabItem(id: "showMore", tabItem: showMoreTabItem, label: showAllText, isDisabled: false),
                    dropdownItems: dropdownItems,
                    maxHeight: dropdownMaxHeight
                )
            }
        case .scroll:
            return .scroll
        }
    }
    
    var tabsItemsIdentifier: String {
        [
            "\(numberOfTabs)",
            selectedId,
            label,
            value ?? "",
            "\(counterValue ?? 0)",
            "\(hasStartContentIcon)",
            "\(hasEndContentIcon)",
            "\(hasCounter)",
            "\(hasAction)",
            "\(isDisabled)",
            tabsType.rawValue,
            "\(tabItemType)",
            variation?.name ?? ""
        ].joined(separator: "-")
    }
    
    var tabsItems: [TabItem] {
        (1...numberOfTabs).map { index in
            let isSelected = selectedId == "tab\(index)"
            
            if tabsType == .iconTabs {
                let tabItem = SDDSTabItem(
                    label: "",
                    counterValue: counterValue,
                    isSelected: isSelected,
                    isDisabled: isDisabled,
                    hasStartContent: true,
                    hasContentRight: hasCounter,
                    hasActionContent: hasAction,
                    orientation: appearance.size.orientation,
                    appearance: appearance.tabItemAppearance,
                    startContent: {
                        AnyView(
                            Asset.plasma24.image
                                .resizable()
                                .renderingMode(.template)
                        )
                    }
                )
                return TabItem(id: "tab\(index)", tabItem: tabItem, label: nil, isDisabled: isDisabled)
            } else {
                let tabItem = SDDSTabItem(
                    label: label,
                    value: value,
                    counterValue: counterValue,
                    isSelected: isSelected,
                    isDisabled: isDisabled,
                    hasStartContent: hasStartContentIcon,
                    hasContentRight: hasEndContentIcon || hasCounter,
                    hasActionContent: hasAction,
                    orientation: appearance.size.orientation,
                    appearance: appearance.tabItemAppearance,
                    startContent: {
                        AnyView(
                            Asset.plasma24.image
                                .resizable()
                                .renderingMode(.template)
                        )
                    },
                    contentRight: {
                        contentRight
                    }
                )
                return TabItem(id: "tab\(index)", tabItem: tabItem, label: label, isDisabled: isDisabled)
            }
        }
    }
    
    @ViewBuilder
    var contentRight: some View {
        if hasCounter {
            EmptyView()
        } else {
            Asset.plasma24.image
                .resizable()
                .renderingMode(.template)
        }
    }
    
    var dropdownItems: [TabItem] {
        (numberOfTabs+1...numberOfTabs+3).map { index in
            let label = "Item \(index)"
            let tabItem = SDDSTabItem(
                label: label,
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: appearance.size.orientation,
                appearance: appearance.tabItemAppearance,
                startContent: { EmptyView() },
                contentRight: { EmptyView() },
                actionContent: { EmptyView() }
            )
            return TabItem(id: "dropdown\(index)", tabItem: tabItem, label: label, isDisabled: false)
        }
    }
    
    init() {
        super.init(variationProvider: TabsVariationProvider(tabsType: .tabsDefault))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
