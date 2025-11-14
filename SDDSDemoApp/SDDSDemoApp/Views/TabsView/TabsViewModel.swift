import SwiftUI
import Combine
import SDDSComponents
import SDDSIcons

final class TabsViewModel: ComponentViewModel<TabsVariationProvider> {
    typealias Appearance = TabsAppearance
    
    @Published var tabsType: SDDSTabsType = .tabsDefault {
        didSet {
            self.variationProvider.tabsType = tabsType
            self.selectVariation(variations.first)
            
            if tabsType == .iconTabs {
                tabItemType = .icon
                if clipModeType == .showMore {
                    clipModeType = .none
                }
            }
        }
    }
    
    @Published var tabItemType: SDDSTabs.TabItemType = .default
    @Published var selectedId: String = "tab1"
    @Published var numberOfTabs: Int = 3
    @Published var showAllText: String = "Show All"
    @Published var dropdownMaxHeight: CGFloat = 186
    @Published var clipModeType: ClipModeType = .none
    @Published var stretch: Bool = true
    @Published var hasDivider: Bool = true
    
    var viewIdentifier: String {
        [
            tabsType.rawValue,
            variation?.name ?? "",
            "\(tabItemType)",
            clipModeType.rawValue,
            "\(stretch)",
            "\(hasDivider)",
            "\(numberOfTabs)"
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
            return .showMore(
                showMoreItem: TabsItemData(
                    id: "showMore",
                    label: showAllText,
                    isDisabled: false
                ),
                dropdownItems: dropdownItems,
                maxHeight: dropdownMaxHeight
            )
        case .scroll:
            return .scroll
        }
    }
    
    var tabsItems: [TabsItemData] {
        (1...numberOfTabs).map { index in
            TabsItemData(
                id: "tab\(index)",
                label: "Label",
                icon: tabsType == .iconTabs ? Asset.plasma24.image : nil,
                isDisabled: false
            )
        }
    }
    
    var dropdownItems: [TabsItemData] {
        (numberOfTabs+1...numberOfTabs+3).map { index in
            TabsItemData(
                id: "dropdown\(index)",
                label: "Item \(index)",
                isDisabled: false
            )
        }
    }
    
    init() {
        super.init(variationProvider: TabsVariationProvider(tabsType: .tabsDefault))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
}
