import Foundation

/// Компонент дизайн-системы, которому принадлежит вариация генерации.
///
/// `ios-api-meta.json` описывает компоненты, а не вариации — так же, как
/// `uikit-compose-api-meta.json` на Android. Одному компоненту соответствует
/// несколько вариаций (`Accordion` → `AccordionClearActionEnd`, …), и обратная
/// связь объявлена здесь, потому что вывести её из имён нельзя: `ListNumberedItem`
/// принадлежит `ListItem`, а не `List`, а вариация `TabBar` — островному
/// `TabBarIsland`, хотя одноимённый компонент тоже существует.
///
/// Перечислены только пары, где имя компонента отличается от имени вариации;
/// для остальных вариация и компонент называются одинаково.
extension CodeGenerationComponent {
    /// Имя записи в `ios-api-meta.json`, из которой генерится эта вариация.
    var metaComponentName: String {
        Self.componentByVariation[self] ?? rawValue
    }

    private static let componentByVariation: [CodeGenerationComponent: String] = [
        .navigationBarInternalPage: "NavigationBar",
        .navigationBarMainPage: "NavigationBar",
        .tabBarIslandHasLabelSolid: "TabBar",
        .tabBarIslandSolid: "TabBar",
        .radiobox: "RadioBox",
        .radioboxGroup: "RadioBoxGroup",
        .checkbox: "CheckBox",
        .checkboxGroup: "CheckBoxGroup",
        .textFieldClear: "TextField",
        .textAreaClear: "TextArea",
        .chipGroupDense: "ChipGroup",
        .chipGroupWide: "ChipGroup",
        .embeddedChipGroupDense: "ChipGroup",
        .embeddedChipGroupWide: "ChipGroup",
        .embeddedChip: "Chip",
        .badgeClear: "Badge",
        .badgeTransparent: "Badge",
        .iconBadgeClear: "IconBadge",
        .iconBadgeTransparent: "IconBadge",
        .avatarIndicator: "Indicator",
        .segmentItemCounter: "Counter",
        .cardSolid: "Card",
        .cardClear: "Card",
        .notificationLoose: "Notification",
        .notificationCompact: "Notification",
        .textSkeletonBody: "TextSkeleton",
        .textSkeletonDisplay: "TextSkeleton",
        .textSkeletonHeader: "TextSkeleton",
        .textSkeletonText: "TextSkeleton",
        .listItemNormal: "ListItem",
        .listItemTight: "ListItem",
        .dropdownMenuItemNormal: "ListItem",
        .dropdownMenuItemTight: "ListItem",
        .dropdownMenuListNormal: "List",
        .dropdownMenuListTight: "List",
        .dropdownMenuNormal: "DropdownMenu",
        .dropdownMenuTight: "DropdownMenu",
        .listNormal: "List",
        .listTight: "List",
        .listNumbered: "List",
        .listNumberedItem: "ListItem",
        .scrollbar: "ScrollBar",
        .accordionItemSolidActionStart: "AccordionItem",
        .accordionItemSolidActionEnd: "AccordionItem",
        .accordionItemClearActionStart: "AccordionItem",
        .accordionItemClearActionEnd: "AccordionItem",
        .accordionSolidActionStart: "Accordion",
        .accordionSolidActionEnd: "Accordion",
        .accordionClearActionStart: "Accordion",
        .accordionClearActionEnd: "Accordion",
        .tabBarItemSolid: "TabBarItem",
        .tabBarItemClear: "TabBarItem",
        .tabBarIslandClear: "TabBar",
        .tabBarIslandHasLabelClear: "TabBar",
        .tabBarSolid: "TabBar",
        .tabBar: "TabBar",
        .tabBarClear: "TabBar",
        .tabBarHasLabelSolid: "TabBar",
        .tabBarHasLabelClear: "TabBar",
        .basicButtonGroup: "ButtonGroup",
        .iconButtonGroup: "ButtonGroup",
        .tabsDefault: "Tabs",
        .tabsHeader: "Tabs",
        .iconTabs: "Tabs",
        .tabItemDefault: "TabItem",
        .tabItemHeader: "TabItem",
        .drawerCloseInner: "Drawer",
        .drawerCloseNone: "Drawer",
        .drawerCloseOuter: "Drawer",
        .selectItemMultipleNormal: "SelectItem",
        .selectItemMultipleTight: "SelectItem",
        .selectItemSingleNormal: "SelectItem",
        .selectItemSingleTight: "SelectItem",
        .selectMultipleNormal: "Select",
        .selectMultipleTight: "Select",
        .selectSingleNormal: "Select",
        .selectSingleTight: "Select",
        .autocompleteNormal: "Autocomplete",
        .autocompleteTight: "Autocomplete",
        .collapsingNavigationBarInternalPage: "CollapsingNavigationBar",
        .collapsingNavigationBarMainPage: "CollapsingNavigationBar",
        .toolbarHorizontal: "ToolBar",
        .toolbarVertical: "ToolBar",
        .paginationDotsHorizontal: "PaginationDots",
        .paginationDotsVertical: "PaginationDots",
    ]

    /// Реализация стиля, по которой генерится вариация. Нужна там, где один компонент
    /// дизайн-системы описан несколькими `*Appearance`: островной `TabBar` и внутренняя
    /// страница `NavigationBar` — те же компоненты, но со своими типами и свойствами.
    var metaStyleName: String {
        Self.styleByVariation[self] ?? metaComponentName
    }

    private static let styleByVariation: [CodeGenerationComponent: String] = [
        .tabBar: "TabBarIsland",
        .tabBarIslandSolid: "TabBarIsland",
        .tabBarIslandClear: "TabBarIsland",
        .tabBarIslandHasLabelSolid: "TabBarIsland",
        .tabBarIslandHasLabelClear: "TabBarIsland",
        .tabBarClear: "TabBar",
        .tabBarSolid: "TabBar",
        .tabBarHasLabelSolid: "TabBar",
        .tabBarHasLabelClear: "TabBar",
        .navigationBarMainPage: "NavigationBarMainPage",
        .navigationBarInternalPage: "NavigationBarInternalPage",
    ]
}
