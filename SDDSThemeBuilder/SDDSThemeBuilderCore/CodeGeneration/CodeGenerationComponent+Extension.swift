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
            .textSkeleton
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
            GenerateComponentCommand<CircularProgressBarProps, CircularProgressBarAppearance, CircularProgressBarSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
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
