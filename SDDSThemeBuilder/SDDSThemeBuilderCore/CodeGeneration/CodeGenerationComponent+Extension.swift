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
    case cell = "Cell"
    case counter = "Counter"
    case card = "Card"
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
    case listItemNormal = "ListItemNormal"
    case listItemTight = "ListItemTight"
    case dropdownMenuItemNormal = "DropdownMenuItemNormal"
    case dropdownMenuItemTight = "DropdownMenuItemTight"
    case dropdownMenuListNormal = "DropdownMenuListNormal"
    case dropdownMenuListTight = "DropdownMenuListTight"
    case dropdownMenuNormal = "DropdownMenuNormal"
    case dropdownMenuTight = "DropdownMenuTight"
    case listNormal = "ListNormal"
    case listTight = "ListTight"
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
    
    static var supportedComponents: [CodeGenerationComponent] {
        [
            .basicButton,
            .linkButton,
            .iconButton,
        // .textField,
        // .textFieldClear,
        // .textArea,
        // .textAreaClear,
            .overlay,
            .badge,
            .badgeClear,
            .badgeTransparent,
            .iconBadge,
            .iconBadgeClear,
            .iconBadgeTransparent,
            .indicator,
            .cell,     
            .counter,
            .card,
            .cardClear,
            .segmentItem,
            .segment,
            .bottomSheet,
            .switch,
            .embeddedChip,
            .chip,
            .embeddedChipGroupDense,
            .embeddedChipGroupWide,
            .chipGroupDense,
            .chipGroupWide,
            .radiobox,
            .radioboxGroup,
            .checkbox,
            .checkboxGroup,
            .avatar,
            .avatarGroup,
            .circularProgressBar,
            .progressBar,
            .divider,
            .popover,
            .tooltip,
            .toast,
            .modal,
            .notificationLoose,
            .notificationCompact,
            .rectSkeleton,
            .textSkeleton,
            .listItemNormal,
            .listItemTight,
            .dropdownMenuItemNormal,
            .dropdownMenuItemTight,
            .dropdownMenuListNormal,
            .dropdownMenuListTight,
            .dropdownMenuNormal,
            .dropdownMenuTight,
            .listNormal,
            .listTight,
            .scrollbar,
            .accordionItemSolidActionStart,
            .accordionItemSolidActionEnd,
            .accordionItemClearActionStart,
            .accordionItemClearActionEnd,
            .accordionSolidActionStart,
            .accordionSolidActionEnd,
            .accordionClearActionStart,
            .accordionClearActionEnd,
            .spinner,
            .loader,
            .codeField,
            .tabBarItemSolid,
            .tabBarItem,
            .tabBarItemClear,
            .tabBarIslandSolid,
            .tabBarIslandClear,
            .tabBarIslandHasLabelSolid,
            .tabBarIslandHasLabelClear,
            .tabBarSolid,
            .tabBar,
            .tabBarClear,
            .tabBarHasLabelSolid,
            .tabBarHasLabelClear,
            .codeInput
        ]
    }
    
}

extension CodeGenerationComponent {
    func command(outputURL: URL, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> Command {
        switch self {
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
        case .indicator:
            GenerateComponentCommand<IndicatorProps, IndicatorAppearance, IndicatorSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .cell:
            GenerateComponentCommand<CellProps, CellAppearance, CellSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .counter:
            GenerateComponentCommand<CounterProps, CounterAppearance, CounterSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .card, .cardClear:
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
        case .rectSkeleton, .textSkeleton:
            GenerateComponentCommand<SkeletonProps, SkeletonAppearance, SkeletonSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .listItemNormal, .listItemTight, .dropdownMenuItemNormal, .dropdownMenuItemTight:
            GenerateComponentCommand<ListItemProps, ListItemAppearance, ListItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .dropdownMenuNormal, .dropdownMenuTight:
            GenerateComponentCommand<DropdownMenuProps, DropdownMenuAppearance, DropdownMenuSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .listNormal, .listTight, .dropdownMenuListNormal, .dropdownMenuListTight:
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
        case .tabBarItemSolid, .tabBarItem:
            GenerateComponentCommand<TabBarItemProps, TabBarItemAppearance, TabBarItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarItemClear:
            GenerateComponentCommand<TabBarItemProps, TabBarItemAppearance, TabBarItemSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarIslandSolid, .tabBarIslandClear, .tabBarIslandHasLabelSolid, .tabBarIslandHasLabelClear:
            GenerateComponentCommand<TabBarIslandProps, TabBarIslandAppearance, TabBarIslandSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .tabBarSolid, .tabBarClear, .tabBarHasLabelSolid, .tabBarHasLabelClear, .tabBar:
            GenerateComponentCommand<TabBarProps, TabBarAppearance, TabBarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        case .codeInput:
            GenerateComponentCommand<CodeInputProps, CodeInputAppearance, CodeInputSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
        }
    }
    /// Название структуры Appearance в `SDDSComponents`
    var appearance: String {
        switch self {
        case .basicButton, .iconButton, .linkButton:
            "ButtonAppearance"
        case .textArea, .textAreaClear:
            "TextAreaAppearance"
        case .textField, .textFieldClear:
            "TextFieldAppearance"
        case .chip, .embeddedChip:
            "ChipAppearance"
        case .chipGroupDense, .chipGroupWide, .embeddedChipGroupDense, .embeddedChipGroupWide:
            "ChipGroupAppearance"
        case .badge, .badgeClear, .badgeTransparent, .iconBadge, .iconBadgeClear, .iconBadgeTransparent:
            "BadgeAppearance"
        case .indicator:
            "IndicatorAppearance"
        case .cell:
            "CellAppearance"
        case .counter:
            "CounterAppearance"
        case .card, .cardClear:
            "CardAppearance"
        case .segmentItem:
            "SegmentItemAppearance"
        case .segment:
            "SegmentAppearance"
        case .bottomSheet:
            "BottomSheetAppearance"
        case .switch:
            "SwitchAppearance"
        case .radiobox:
            "RadioboxAppearance"
        case .radioboxGroup:
            "RadioboxGroupAppearance"
        case .checkbox:
            "CheckboxAppearance"
        case .checkboxGroup:
            "CheckboxGroupAppearance"
        case .avatar:
            "AvatarAppearance"
        case .avatarGroup:
            "AvatarGroupAppearance"
        case .circularProgressBar:
            "CircularProgressBarAppearance"
        case .progressBar:
            "ProgressBarAppearance"
        case .divider:
            "DividerAppearance"
        case .overlay:
             "OverlayAppearance"
        case .popover:
            "PopoverAppearance"
        case .tooltip:
            "TooltipAppearance"
        case .toast:
            "ToastAppearance"
        case .modal:
            "ModalAppearance"
        case .notificationLoose, .notificationCompact:
            "NotificationAppearance"
        case .rectSkeleton, .textSkeleton:
            "SkeletonAppearance"
        case .listItemNormal, .listItemTight, .dropdownMenuItemNormal, .dropdownMenuItemTight:
            "ListItemAppearance"
        case .dropdownMenuNormal, .dropdownMenuTight:
            "DropdownMenuAppearance"
        case .listNormal, .listTight, .dropdownMenuListNormal, .dropdownMenuListTight:
            "ListAppearance"
        case .accordionItemSolidActionStart, .accordionItemSolidActionEnd, .accordionItemClearActionStart, .accordionItemClearActionEnd:
            "AccordionItemAppearance"
        case .accordionSolidActionStart, .accordionSolidActionEnd, .accordionClearActionStart, .accordionClearActionEnd:
            "AccordionAppearance"
        case .scrollbar:
            "ScrollbarAppearance"
        case .spinner:
            "SpinnerAppearance"
        case .loader:
            "LoaderAppearance"
        case .codeField:
            "CodeFieldAppearance"
        case .tabBarItemSolid, .tabBarItemClear, .tabBarItem:
            "TabBarItemAppearance"
        case .tabBarIslandSolid, .tabBarIslandClear, .tabBarIslandHasLabelSolid, .tabBarIslandHasLabelClear:
            "TabBarIslandAppearance"
        case .tabBarSolid, .tabBarClear, .tabBarHasLabelSolid, .tabBarHasLabelClear, .tabBar:
            "TabBarAppearance"
        case .codeInput:
            "CodeInputAppearance"
        }
    }
    
    /// Название протокола sizeConfiguration в `SDDSComponents`
    var sizeConfiguration: String {
        switch self {
        case .basicButton, .iconButton, .linkButton:
            "ButtonSizeConfiguration"
        case .textArea, .textAreaClear:
            "TextAreaSizeConfiguration"
        case .textField, .textFieldClear:
            "TextFieldSizeConfiguration"
        case .chip, .embeddedChip:
            "ChipSizeConfiguration"
        case .chipGroupDense, .chipGroupWide, .embeddedChipGroupDense, .embeddedChipGroupWide:
            "ChipGroupSizeConfiguration"
        case .badge, .badgeClear, .badgeTransparent, .iconBadge, .iconBadgeClear, .iconBadgeTransparent:
            "BadgeSizeConfiguration"
        case .indicator:
            "IndicatorSizeConfiguration"
        case .cell:
            "CellSizeConfiguration"
        case .counter:
            "CounterSizeConfiguration"
        case .card, .cardClear:
            "CardSizeConfiguration"
        case .segmentItem:
            "SegmentItemSizeConfiguration"
        case .segment:
            "SegmentSizeConfiguration"
        case .bottomSheet:
            "BottomSheetSizeConfiguration"
        case .switch:
            "SwitchSizeConfiguration"
        case .radiobox:
            "SelectionControlSizeConfiguration"
        case .radioboxGroup:
            "RadioboxGroupSizeConfiguration"
        case .checkbox:
            "SelectionControlSizeConfiguration"
        case .checkboxGroup:
            "CheckboxGroupSizeConfiguration"
        case .avatar:
            "AvatarSizeConfiguration"
        case .avatarGroup:
            "AvatarGroupSizeConfiguration"
        case .circularProgressBar:
            "CircularProgressBarSizeConfiguration"
        case .progressBar:
            "ProgressBarSizeConfiguration"
        case .divider:
            "DividerSizeConfiguration"
        case .overlay:
             "OverlaySizeConfiguration"
        case .popover:
            "PopoverSizeConfiguration"
        case .tooltip:
            "TooltipSizeConfiguration"
        case .toast:
            "ToastSizeConfiguration"
        case .modal:
            "ModalSizeConfiguration"
        case .notificationLoose, .notificationCompact:
            "NotificationSizeConfiguration"
        case .rectSkeleton, .textSkeleton:
            "SkeletonSizeConfiguration"
        case .listItemNormal, .listItemTight, .dropdownMenuItemNormal, .dropdownMenuItemTight:
            "ListItemSizeConfiguration"
        case .dropdownMenuNormal, .dropdownMenuTight:
            "DropdownMenuSizeConfiguration"
        case .listNormal, .listTight, .dropdownMenuListNormal, .dropdownMenuListTight:
            "ListSizeConfiguration"
        case .accordionItemSolidActionStart, .accordionItemSolidActionEnd, .accordionItemClearActionStart, .accordionItemClearActionEnd:
            "AccordionItemSizeConfiguration"
        case .accordionSolidActionStart, .accordionSolidActionEnd, .accordionClearActionStart, .accordionClearActionEnd:
            "AccordionSizeConfiguration"
        case .scrollbar:
            "ScrollbarSizeConfiguration"
        case .spinner:
            "SpinnerSizeConfiguration"
        case .loader:
            "LoaderSizeConfiguration"
        case .codeField:
            "CodeFieldSizeConfiguration"
        case .tabBarItemSolid, .tabBarItemClear, .tabBarItem:
            "TabBarItemSizeConfiguration"
        case .tabBarIslandSolid, .tabBarIslandClear, .tabBarIslandHasLabelSolid, .tabBarIslandHasLabelClear:
            "TabBarIslandSizeConfiguration"
        case .tabBarSolid, .tabBarClear, .tabBarHasLabelSolid, .tabBarHasLabelClear, .tabBar:
            "TabBarSizeConfiguration"
        case .codeInput:
            "CodeInputSizeConfiguration"
        }
    }
    
    private var configurationFilename: String {
        switch self {
        case .basicButton:
            "basic_button_config.json"
        case .iconButton:
            "icon_button_config.json"
        case .linkButton:
            "link_button_config.json"
        case .textField:
            "text_field_config.json"
        case .textFieldClear:
            "text_field_clear_config.json"
        case .textArea:
            "text_area_config.json"
        case .textAreaClear:
            "text_area_clear_config.json"
        case .chip:
            "chip_config.json"
        case .chipGroupDense:
            "chip_group_dense_config.json"
        case .chipGroupWide:
            "chip_group_wide_config.json"
        case .embeddedChipGroupDense:
            "embedded_chip_group_dense_config.json"
        case .embeddedChipGroupWide:
            "embedded_chip_group_wide_config.json"
        case .embeddedChip:
            "embedded_chip_config.json"
        case .badge:
            "badge_solid_config.json"
        case .badgeClear:
            "badge_clear_config.json"
        case .badgeTransparent:
            "badge_transparent_config.json"
        case .iconBadge:
            "icon_badge_solid_config.json"
        case .iconBadgeClear:
            "icon_badge_clear_config.json"
        case .iconBadgeTransparent:
            "icon_badge_transparent_config.json"
        case .indicator:
            "indicator_config.json"
        case .cell:
            "cell_config.json"
        case .counter:
            "counter_config.json"
        case .card:
            "card_solid_config.json"
        case .cardClear:
            "card_clear_config.json"
        case .segmentItem:
            "segment_item_config.json"
        case .segment:
            "segment_config.json"
        case .bottomSheet:
            "bottom_sheet_config.json"
        case .switch:
            "switch_config.json"
        case .radiobox:
            "radiobox_config.json"
        case .radioboxGroup:
            "radiobox_group_config.json"
        case .checkbox:
            "checkbox_config.json"
        case .checkboxGroup:
            "checkbox_group_config.json"
        case .avatar:
            "avatar_config.json"
        case .avatarGroup:
            "avatar_group_config.json"
        case .circularProgressBar:
            "circular_progress_bar_config.json"
        case .progressBar:
            "progress_bar_config.json"
        case .divider:
            "divider_config.json"
        case .overlay:
            "overlay_config.json"
        case .popover:
            "popover_config.json"
        case .tooltip:
            "tooltip_config.json"
        case .toast:
            "toast_config.json"
        case .modal:
            "modal_config.json"
        case .notificationCompact:
            "notification_compact_config.json"
        case .notificationLoose:
            "notification_loose_config.json"
        case .rectSkeleton:
            "rect_skeleton_config.json"
        case .textSkeleton:
            "text_skeleton_config.json"
        case .listItemNormal:
            "list_item_normal_config.json"
        case .listItemTight:
            "list_item_tight_config.json"
        case .dropdownMenuItemNormal:
            "dropdown_menu_item_normal_config.json"
        case .dropdownMenuItemTight:
            "dropdown_menu_item_tight_config.json"
        case .dropdownMenuListNormal:
            "dropdown_menu_list_normal_config.json"
        case .dropdownMenuListTight:
            "dropdown_menu_list_tight_config.json"
        case .dropdownMenuNormal:
            "dropdown_menu_normal_config.json"
        case .dropdownMenuTight:
            "dropdown_menu_tight_config.json"
        case .listNormal:
            "list_normal_config.json"
        case .listTight:
            "list_tight_config.json"
        case .accordionItemSolidActionStart:
            "accordion_item_solid_action_start_config.json"
        case .accordionItemSolidActionEnd:
            "accordion_item_solid_action_end_config.json"
        case .accordionItemClearActionStart:
            "accordion_item_clear_action_start_config.json"
        case .accordionItemClearActionEnd:
            "accordion_item_clear_action_end_config.json"
        case .accordionSolidActionStart:
            "accordion_solid_action_start_config.json"
        case .accordionSolidActionEnd:
            "accordion_solid_action_end_config.json"
        case .accordionClearActionStart:
            "accordion_clear_action_start_config.json"
        case .accordionClearActionEnd:
            "accordion_clear_action_end_config.json"
        case .scrollbar:
            "scroll_bar_config.json"
        case .spinner:
            "spinner_config.json"
        case .loader:
            "loader_config.json"
        case .codeField:
            "code_field_config.json"
        case .tabBarItemSolid:
            "tab_bar_item_solid_config.json"
        case .tabBarItem:
            "tab_bar_item_config.json"
        case .tabBarItemClear:
            "tab_bar_item_clear_config.json"
        case .tabBarIslandSolid:
            "tab_bar_island_solid_config.json"
        case .tabBarIslandClear:
            "tab_bar_island_clear_config.json"
        case .tabBarIslandHasLabelSolid:
            "tab_bar_island_has_label_solid_config.json"
        case .tabBarIslandHasLabelClear:
            "tab_bar_island_has_label_clear_config.json"
        case .tabBarSolid:
            "tab_bar_solid_config.json"
        case .tabBar:
            "tab_bar_config.json"
        case .tabBarClear:
            "tab_bar_clear_config.json"
        case .tabBarHasLabelSolid:
            "tab_bar_has_label_solid_config.json"
        case .tabBarHasLabelClear:
            "tab_bar_has_label_clear_config.json"
        case .codeInput:
            "code_input_config.json"
        }
    }
    
    func url(baseURL: URL) -> URL {
        let result = baseURL
            .appending(component: configurationFilename)
        
        return result
    }
}

extension CodeGenerationComponent {
    func chain(with key: String) -> String {
        "\(self.rawValue).\(key.chain)"
    }
}
