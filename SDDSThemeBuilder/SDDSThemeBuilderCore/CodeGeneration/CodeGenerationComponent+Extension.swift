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
    case progressbar = "Progressbar"
    case progressBar = "ProgressBar"
    
    static var supportedComponents: [CodeGenerationComponent] {
        [
            .basicButton,
            .linkButton,
            .iconButton,
        //    .textField,
        //    .textFieldClear,
        //    .textArea,
        //    .textAreaClear,
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
            .radiobox,
            .radioboxGroup,
            .checkbox,
            .checkboxGroup,
            .avatar,
            .avatarGroup,
            .progressbar
            .progressBar
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
        case .progressbar:
            GenerateComponentCommand<CardProps, CardAppearance, CardSize>(component: self, outputDirectoryURL: outputURL, themeConfig: themeConfig)
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
        case .progressbar:
            "ProgressbarAppearance"
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
        case .progressbar:
            "ProgressbarSizeConfigurations"
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
        case .progressbar
            "progress_bar_config.json"
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
