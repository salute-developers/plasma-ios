import Foundation

enum CodeGenerationComponent: String, CaseIterable, Decodable {
    case basicButton = "BasicButton"
    case linkButton = "LinkButton"
    case iconButton = "IconButton"
    case textField = "TextField"
    case textFieldClear = "TextFieldClear"
    case textArea = "TextArea"
    case textAreaClear = "TextAreaClear"
    case chip = "Chip"
    case chipGroupDense = "ChipGroupDense"
    case chipGroupWide = "ChipGroupWide"
    case embeddedChipGroupDense = "EmbeddedChipGroupDense"
    case embeddedChipGroupWide = "EmbeddedChipGroupWide"
    case embeddedChip = "EmbeddedChip"
    case badge = "Badge"
    case badgeClear = "BadgeClear"
    case badgeTransparent = "BadgeTransparent"
    case iconBadge = "IconBadge"
    case iconBadgeClear = "IconBadgeClear"
    case iconBadgeTransparent = "IconBadgeTransparent"
    case indicator = "Indicator"
    case avatarIndicator = "AvatarIndicator"
    case cell = "Cell"
    case counter = "Counter"
    case segmentItemCounter = "SegmentItemCounter"
    case card = "Card"
    case cardSolid = "CardSolid"
    case cardClear = "CardClear"
    case segmentItem = "SegmentItem"
    case segment = "Segment"
    case bottomSheet = "BottomSheet"
    case `switch` = "Switch"
    case radiobox = "Radiobox"
    case radioboxGroup = "RadioboxGroup"
    case checkbox = "Checkbox"
    case checkboxGroup = "CheckboxGroup"
    case avatar = "Avatar"
    case avatarGroup = "AvatarGroup"
    case circularProgressBar = "CircularProgressBar"
    case progressBar = "ProgressBar"
    case divider = "Divider"
    case overlay = "Overlay"
    case popover = "Popover"
    case tooltip = "Tooltip"
    case toast = "Toast"
    case modal = "Modal"
    case notificationLoose = "NotificationLoose"
    case notificationCompact = "NotificationCompact"
    case rectSkeleton = "RectSkeleton"
    case textSkeleton = "TextSkeleton"
    case textSkeletonBody = "TextSkeletonBody"
    case textSkeletonDisplay = "TextSkeletonDisplay"
    case textSkeletonHeader = "TextSkeletonHeader"
    case textSkeletonText = "TextSkeletonText"
    case listItem = "ListItem"
    case listItemNormal = "ListItemNormal"
    case listItemTight = "ListItemTight"
    case dropdownMenuItemNormal = "DropdownMenuItemNormal"
    case dropdownMenuItemTight = "DropdownMenuItemTight"
    case dropdownMenuListNormal = "DropdownMenuListNormal"
    case dropdownMenuListTight = "DropdownMenuListTight"
    case dropdownMenuNormal = "DropdownMenuNormal"
    case dropdownMenuTight = "DropdownMenuTight"
    case list = "List"
    case listNormal = "ListNormal"
    case listTight = "ListTight"
    case listNumbered = "ListNumbered"
    case listNumberedItem = "ListNumberedItem"
    case scrollbar = "ScrollBar"
    case accordionItemSolidActionStart = "AccordionItemSolidActionStart"
    case accordionItemSolidActionEnd = "AccordionItemSolidActionEnd"
    case accordionItemClearActionStart = "AccordionItemClearActionStart"
    case accordionItemClearActionEnd = "AccordionItemClearActionEnd"
    case accordionSolidActionStart = "AccordionSolidActionStart"
    case accordionSolidActionEnd = "AccordionSolidActionEnd"
    case accordionClearActionStart = "AccordionClearActionStart"
    case accordionClearActionEnd = "AccordionClearActionEnd"
    case spinner = "Spinner"
    case loader = "Loader"
    case codeField = "CodeField"
    case editable = "Editable"
    case tabBarItemSolid = "TabBarItemSolid"
    case tabBarItem = "TabBarItem"
    case tabBarItemClear = "TabBarItemClear"
    case tabBarIslandSolid = "TabBarIsland"
    case tabBarIslandClear = "TabBarIslandClear"
    case tabBarIslandHasLabelSolid = "TabBarIslandHasLabel"
    case tabBarIslandHasLabelClear = "TabBarIslandHasLabelClear"
    case tabBarSolid = "TabBarSolid"
    case tabBar = "TabBar"
    case tabBarClear = "TabBarClear"
    case tabBarHasLabelSolid = "TabBarHasLabel"
    case tabBarHasLabelClear = "TabBarHasLabelClear"
    case codeInput = "CodeInput"
    case notificationContent = "NotificationContent"
    case basicButtonGroup = "BasicButtonGroup"
    case iconButtonGroup = "IconButtonGroup"
    case wheel = "Wheel"
    case navigationBarMainPage = "NavigationBarMainPage"
    case navigationBarInternalPage = "NavigationBarInternalPage"
    case note = "Note"
    case noteCompact = "NoteCompact"
    case tabsDefault = "TabsDefault"
    case tabsHeader = "TabsHeader"
    case iconTabs = "IconTabs"
    case tabItemDefault = "TabItemDefault"
    case tabItemHeader = "TabItemHeader"
    case iconTabItem = "IconTabItem"
    case drawerCloseInner = "DrawerCloseInner"
    case drawerCloseNone = "DrawerCloseNone"
    case drawerCloseOuter = "DrawerCloseOuter"
    case selectItemMultipleNormal = "SelectItemMultipleNormal"
    case selectItemMultipleTight = "SelectItemMultipleTight"
    case selectItemSingleNormal = "SelectItemSingleNormal"
    case selectItemSingleTight = "SelectItemSingleTight"
    case selectMultipleNormal = "SelectMultipleNormal"
    case selectMultipleTight = "SelectMultipleTight"
    case selectSingleNormal = "SelectSingleNormal"
    case selectSingleTight = "SelectSingleTight"
    case autocompleteNormal = "AutocompleteNormal"
    case autocompleteTight = "AutocompleteTight"
    case collapsingNavigationBarInternalPage = "CollapsingNavigationBarInternalPage"
    case collapsingNavigationBarMainPage = "CollapsingNavigationBarMainPage"
    case toolbarHorizontal = "ToolbarHorizontal"
    case toolbarVertical = "ToolbarVertical"
    case paginationDotsHorizontal = "PaginationDotsHorizontal"
    case paginationDotsVertical = "PaginationDotsVertical"
    case carousel = "Carousel"
    case image = "Image"
    case formItem = "FormItem"

    static var supportedComponents: [CodeGenerationComponent] {
        allCases
    }
}

extension CodeGenerationComponent {
    static var universalComponents: Set<CodeGenerationComponent> {
        Set(CodeGenerationComponent.allCases.filter {
            ApiMetaStore.shared.component($0.metaName) != nil
        })
    }

    var usesUniversalGenerator: Bool {
        UniversalRuntime.isEnabled
            && Self.universalComponents.contains(self)
            && ApiMetaStore.shared.component(metaName) != nil
    }

    func command(outputURL: URL, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> Command {
        usesUniversalGenerator
            ? universalCommand(outputURL: outputURL, themeConfig: themeConfig)
            : typedCommand(outputURL: outputURL, themeConfig: themeConfig)
    }

    func universalCommand(outputURL: URL, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> Command {
        UniversalRuntime.currentComponent = self
        return GenerateComponentCommand<UniversalProps, UniversalAppearance, UniversalSize>(
            component: self,
            outputDirectoryURL: outputURL,
            themeConfig: themeConfig
        )
    }

    /// Устаревший путь: per-component `Props`/`Appearance`/`Size` из `Model/Components`,
    /// вручную дублирующие то, что теперь читается из `ios-api-meta.json`. Держится только
    /// как эталон для сверки паритета с универсальным генератором
    /// (`UniversalGeneratorFileParityTests`) и как ручной откат через
    /// `SDDS_TYPED_GENERATOR=1`. Удалить вместе с `Model/Components/**` после того, как
    /// универсальный путь покроет все компоненты и надобность в сверке отпадёт.
    @available(*, deprecated, message: "Только для сверки паритета с универсальным генератором, см. UniversalGeneratorFileParityTests")
    func typedCommand(outputURL: URL, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> Command {
        return switch self {
        case .basicButton, .iconButton, .linkButton:
            GenerateComponentCommand<ButtonProps, ButtonAppearance, ButtonSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .textField, .textFieldClear:
            GenerateComponentCommand<TextFieldProps, TextFieldAppearance, TextFieldSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .textArea, .textAreaClear:
            GenerateComponentCommand<TextFieldProps, TextAreaAppearance, TextAreaSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .chip, .embeddedChip:
            GenerateComponentCommand<ChipProps, ChipAppearance, ChipSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .chipGroupDense, .chipGroupWide, .embeddedChipGroupDense, .embeddedChipGroupWide:
            GenerateComponentCommand<ChipGroupProps, ChipGroupAppearance, ChipGroupSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .badge, .badgeClear, .badgeTransparent, .iconBadge, .iconBadgeClear, .iconBadgeTransparent:
            GenerateComponentCommand<BadgeProps, BadgeAppearance, BadgeSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .indicator, .avatarIndicator:
            GenerateComponentCommand<IndicatorProps, IndicatorAppearance, IndicatorSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .cell:
            GenerateComponentCommand<CellProps, CellAppearance, CellSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .counter, .segmentItemCounter:
            GenerateComponentCommand<CounterProps, CounterAppearance, CounterSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .cardSolid, .cardClear, .card:
            GenerateComponentCommand<CardProps, CardAppearance, CardSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .segmentItem:
            GenerateComponentCommand<SegmentItemProps, SegmentItemAppearance, SegmentItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .segment:
            GenerateComponentCommand<SegmentProps, SegmentAppearance, SegmentSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .bottomSheet:
            GenerateComponentCommand<BottomSheetProps, BottomSheetAppearance, BottomSheetSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .switch:
            GenerateComponentCommand<SwitchProps, SwitchAppearance, SwitchSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .radiobox:
            GenerateComponentCommand<RadioboxProps, RadioboxAppearance, RadioboxSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .radioboxGroup:
            GenerateComponentCommand<RadioboxGroupProps, RadioboxGroupAppearance, RadioboxGroupSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .checkbox:
            GenerateComponentCommand<CheckboxProps, CheckboxAppearance, CheckboxSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .checkboxGroup:
            GenerateComponentCommand<CheckboxGroupProps, CheckboxGroupAppearance, CheckboxGroupSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .avatar:
            GenerateComponentCommand<AvatarProps, AvatarAppearance, AvatarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .avatarGroup:
            GenerateComponentCommand<AvatarGroupProps, AvatarGroupAppearance, AvatarGroupSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .circularProgressBar:
            GenerateComponentCommand<CircularProgressBarProps, CircularProgressBarAppearance, CircularProgressBarSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .progressBar:
            GenerateComponentCommand<ProgressBarProps, ProgressBarAppearance, ProgressBarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .divider:
            GenerateComponentCommand<DividerProps, DividerAppearance, DividerSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .overlay:
            GenerateComponentCommand<OverlayProps, OverlayAppearance, OverlaySize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .popover:
            GenerateComponentCommand<PopoverProps, PopoverAppearance, PopoverSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tooltip:
            GenerateComponentCommand<TooltipProps, TooltipAppearance, TooltipSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .toast:
            GenerateComponentCommand<ToastProps, ToastAppearance, ToastSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .modal:
            GenerateComponentCommand<ModalProps, ModalAppearance, ModalSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .notificationLoose, .notificationCompact:
            GenerateComponentCommand<NotificationProps, NotificationAppearance, NotificationSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .rectSkeleton, .textSkeleton, .textSkeletonBody, .textSkeletonDisplay, .textSkeletonHeader, .textSkeletonText:
            GenerateComponentCommand<SkeletonProps, SkeletonAppearance, SkeletonSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .listItemNormal, .listItemTight, .dropdownMenuItemNormal, .dropdownMenuItemTight, .listItem, .listNumberedItem:
            GenerateComponentCommand<ListItemProps, ListItemAppearance, ListItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .dropdownMenuNormal, .dropdownMenuTight:
            GenerateComponentCommand<DropdownMenuProps, DropdownMenuAppearance, DropdownMenuSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .listNormal, .listTight, .dropdownMenuListNormal, .dropdownMenuListTight, .list, .listNumbered:
            GenerateComponentCommand<ListProps, ListAppearance, ListSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .accordionItemSolidActionStart, .accordionItemSolidActionEnd, .accordionItemClearActionStart, .accordionItemClearActionEnd:
            GenerateComponentCommand<AccordionItemProps, AccordionItemAppearance, AccordionItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .accordionSolidActionStart, .accordionSolidActionEnd, .accordionClearActionStart, .accordionClearActionEnd:
            GenerateComponentCommand<AccordionActionProps, AccordionAppearance, AccordionSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .scrollbar:
            GenerateComponentCommand<ScrollbarProps, ScrollbarAppearance, ScrollbarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .spinner:
            GenerateComponentCommand<SpinnerProps, SpinnerAppearance, SpinnerSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .loader:
            GenerateComponentCommand<LoaderProps, LoaderAppearance, LoaderSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .codeField:
            GenerateComponentCommand<CodeFieldProps, CodeFieldAppearance, CodeFieldSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .editable:
            GenerateComponentCommand<EditableProps, EditableAppearance, EditableSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarItemSolid, .tabBarItem:
            GenerateComponentCommand<TabBarItemProps, TabBarItemAppearance, TabBarItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarItemClear:
            GenerateComponentCommand<TabBarItemProps, TabBarItemAppearance, TabBarItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarIslandSolid, .tabBarIslandClear, .tabBarIslandHasLabelSolid, .tabBarIslandHasLabelClear, .tabBar:
            GenerateComponentCommand<TabBarIslandProps, TabBarIslandAppearance, TabBarIslandSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarSolid, .tabBarClear, .tabBarHasLabelSolid, .tabBarHasLabelClear:
            GenerateComponentCommand<TabBarProps, TabBarAppearance, TabBarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .codeInput:
            GenerateComponentCommand<CodeInputProps, CodeInputAppearance, CodeInputSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .notificationContent:
            GenerateComponentCommand<NotificationContentProps, NotificationContentAppearance, NotificationContentSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .basicButtonGroup:
            GenerateComponentCommand<ButtonGroupProps, ButtonGroupAppearance, ButtonGroupSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .iconButtonGroup:
            GenerateComponentCommand<ButtonGroupProps, ButtonGroupAppearance, ButtonGroupSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .wheel:
            GenerateComponentCommand<WheelProps, WheelAppearance, WheelSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .navigationBarMainPage:
            GenerateComponentCommand<NavigationBarMainPageProps, NavigationBarMainPageAppearance, NavigationBarMainPageSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .navigationBarInternalPage:
            GenerateComponentCommand<NavigationBarInternalPageProps, NavigationBarInternalPageAppearance, NavigationBarInternalPageSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .note:
            GenerateComponentCommand<NoteProps, NoteAppearance, NoteSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .noteCompact:
            GenerateComponentCommand<NoteCompactProps, NoteCompactAppearance, NoteCompactSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabsDefault, .tabsHeader, .iconTabs:
            GenerateComponentCommand<TabsDefaultProps, TabsDefaultAppearance, TabsDefaultSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .tabItemDefault, .tabItemHeader, .iconTabItem:
            GenerateComponentCommand<TabItemDefaultProps, TabItemDefaultAppearance, TabItemDefaultSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .drawerCloseInner, .drawerCloseNone, .drawerCloseOuter:
            GenerateComponentCommand<DrawerProps, DrawerAppearance, DrawerSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .selectItemMultipleNormal, .selectItemMultipleTight, .selectItemSingleNormal, .selectItemSingleTight:
            GenerateComponentCommand<SelectItemProps, SelectItemAppearance, SelectItemSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .selectMultipleNormal, .selectMultipleTight, .selectSingleNormal, .selectSingleTight:
            GenerateComponentCommand<SelectProps, SelectAppearance, SelectSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .autocompleteNormal, .autocompleteTight:
            GenerateComponentCommand<AutocompleteProps, AutocompleteAppearance, AutocompleteSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .collapsingNavigationBarInternalPage:
            GenerateComponentCommand<CollapsingNavigationBarInternalPageProps, CollapsingNavigationBarInternalPageAppearance, CollapsingNavigationBarInternalPageSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .collapsingNavigationBarMainPage:
            GenerateComponentCommand<CollapsingNavigationBarMainPageProps, CollapsingNavigationBarMainPageAppearance, CollapsingNavigationBarMainPageSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .toolbarHorizontal, .toolbarVertical:
            GenerateComponentCommand<ToolbarProps, ToolbarAppearance, ToolbarSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .paginationDotsHorizontal, .paginationDotsVertical:
            GenerateComponentCommand<PaginationDotsProps, PaginationDotsAppearance, PaginationDotsSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .carousel:
            GenerateComponentCommand<CarouselProps, CarouselAppearance, CarouselSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .formItem:
            GenerateComponentCommand<FormItemProps, FormItemAppearance, FormItemSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        case .image:
            GenerateComponentCommand<ImageProps, ImageAppearance, ImageSize>(
                component: self,
                outputDirectoryURL: outputURL,
                themeConfig: themeConfig
            )
        }
    }
    /// Компонент → запись меты. Связка объявлена в самой библиотеке
    /// (`@ApiInfo(components:)` на `*Appearance`) и приезжает в `ios-api-meta.json`,
    /// потому что вывести её из данных нельзя: группировка DS другая — `badge` и
    /// `icon-badge` там разные компоненты, а на iOS это один `BadgeAppearance`.
    var metaName: String {
        ApiMetaStore.shared.componentName(for: rawValue) ?? rawValue
    }

    private var meta: ApiMetaComponent {
        guard let meta = ApiMetaStore.shared.component(metaName) else {
            Logger.terminate("Component \(rawValue) is missing from ios-api-meta.json (looked up as \(metaName))")
        }
        return meta
    }

    var appearance: String {
        meta.appearanceType
    }

    /// Имя `*Appearance` без `Logger.terminate` — для проходов по всем компонентам
    /// (мета config-info), где отсутствие записи в api-мете значит «пропустить»,
    /// а не «уронить генерацию».
    var appearanceIfKnown: String? {
        ApiMetaStore.shared.component(metaName)?.appearanceType
    }

    var sizeConfiguration: String {
        guard let size = meta.sizeType else {
            Logger.terminate("Component \(metaName) has no size property in ios-api-meta.json")
        }
        return size
    }

    /// Kebab-ключ компонента для мета-файла: `FormItem` → `form-item`.
    var kebabKey: String {
        var result = ""
        for (index, character) in rawValue.enumerated() {
            if character.isUppercase && index != 0 { result += "-" }
            result += character.lowercased()
        }
        return result
    }

    /// Компоненты, для которых генерируется binding API (их конфиг содержит
    /// `bindings`). Конфиг берётся per-theme из theme-converter.
    var supportsBinding: Bool {
        switch self {
        case .formItem:
            true
        default:
            false
        }
    }

    func configurationFilename(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> String {
        ComponentIndex.entry(for: self, themeConfig: themeConfig)?.config ?? configurationFilename
    }

    private static let configurationFilenames: [CodeGenerationComponent: String] = [
        .badge: "badge_solid",
        .iconBadge: "icon_badge_solid",
        .tabBarHasLabelSolid: "tab_bar_has_label_solid",
        .tabBarIslandHasLabelSolid: "tab_bar_island_has_label_solid",
        .tabBarIslandSolid: "tab_bar_island_solid",
        .toolbarHorizontal: "tool_bar_horizontal",
        .toolbarVertical: "tool_bar_vertical"
    ]

    var configurationFilename: String {
        "\(Self.configurationFilenames[self] ?? kebabKey.replacingOccurrences(of: "-", with: "_"))_config.json"
    }
}

extension CodeGenerationComponent {
    func chain(with key: String) -> String {
        "\(self.rawValue).\(key.chain)"
    }
}
