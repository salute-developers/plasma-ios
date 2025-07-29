import Foundation
import SDDSComponents
import SDDSServTheme
import PlasmaB2CTheme
import StylesSaluteTheme
import PlasmaHomeDSTheme

enum Theme: String, CaseIterable {
    case sdddsServTheme
    case plasmaB2CTheme
    case plasmaHomeDSTheme
    case stylesSalute
    
    var name: String {
        rawValue.capitalized
    }
    
    var basicButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BasicButton.all
        case .stylesSalute:
            return StylesSaluteTheme.BasicButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BasicButton.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.BasicButton.all
        }
    }
    
    var iconButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconButton.all
        case .stylesSalute:
            return StylesSaluteTheme.IconButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconButton.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.IconButton.all
        }
    }
    
    var linkButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.LinkButton.all
        case .stylesSalute:
            return StylesSaluteTheme.LinkButton.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.LinkButton.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var textFieldVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextField.all
        case .stylesSalute:
            return StylesSaluteTheme.TextField.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextField.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextFieldClear.all
        case .stylesSalute:
            return StylesSaluteTheme.TextFieldClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextFieldClear.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var textAreaVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextArea.all
        case .stylesSalute:
            return StylesSaluteTheme.TextArea.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextArea.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TextAreaClear.all
        case .stylesSalute:
            return StylesSaluteTheme.TextAreaClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.TextAreaClear.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var avatarVariations: [Variation<AvatarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Avatar.all
        case .stylesSalute:
            return StylesSaluteTheme.Avatar.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Avatar.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Avatar.all
        }
    }
    
    var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AvatarGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.AvatarGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AvatarGroup.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.AvatarGroup.all
        }
    }
    
    var counterVariations: [Variation<CounterAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Counter.all
        case .stylesSalute:
            return StylesSaluteTheme.Counter.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Counter.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Counter.all
        }
    }
    
    var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ChipGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.ChipGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ChipGroup.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ChipGroupDense.all
        case .stylesSalute:
            return StylesSaluteTheme.ChipGroupDense.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ChipGroupDense.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.ChipGroupDense.all
        }
    }
    
    var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ChipGroupWide.all
        case .stylesSalute:
            return StylesSaluteTheme.ChipGroupWide.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ChipGroupWide.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.ChipGroupWide.all
        }
    }
    
    var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.EmbeddedChipGroupDense.all
        case .stylesSalute:
            return StylesSaluteTheme.EmbeddedChipGroupDense.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.EmbeddedChipGroupDense.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.EmbeddedChipGroupWide.all
        case .stylesSalute:
            return StylesSaluteTheme.EmbeddedChipGroupWide.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.EmbeddedChipGroupWide.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var checkboxVariations: [Variation<CheckboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Checkbox.all
        case .stylesSalute:
            return StylesSaluteTheme.Checkbox.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Checkbox.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Checkbox.all
        }
    }
    
    var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CheckboxGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.CheckboxGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CheckboxGroup.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.CheckboxGroup.all
        }
    }
    
    var radioboxVariations: [Variation<RadioboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Radiobox.all
        case .stylesSalute:
            return StylesSaluteTheme.Radiobox.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Radiobox.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Radiobox.all
        }
    }
    
    var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.RadioboxGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.RadioboxGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.RadioboxGroup.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.RadioboxGroup.all
        }
    }
    
    var chipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Chip.all
        case .stylesSalute:
            return StylesSaluteTheme.Chip.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Chip.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Chip.all
        }
    }
    
    var embeddedChipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.EmbeddedChip.all
        case .stylesSalute:
            return StylesSaluteTheme.EmbeddedChip.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.EmbeddedChip.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var progressBarVariations: [Variation<ProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ProgressBar.all
        case .stylesSalute:
            return StylesSaluteTheme.ProgressBar.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ProgressBar.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.SegmentItem.all
        case .stylesSalute:
            return StylesSaluteTheme.SegmentItem.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.SegmentItem.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var segmentVariations: [Variation<SegmentAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Segment.all
        case .stylesSalute:
            return StylesSaluteTheme.Segment.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Segment.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var switchVariations: [Variation<SwitchAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Switch.all
        case .stylesSalute:
            return StylesSaluteTheme.Switch.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Switch.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Switch.all
        }
    }
    
    var badgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Badge.all
        case .stylesSalute:
            return StylesSaluteTheme.Badge.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Badge.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Badge.all
        }
    }
    
    var badgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BadgeClear.all
        case .stylesSalute:
            return StylesSaluteTheme.BadgeClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BadgeClear.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.BadgeClear.all
        }
    }
    
    var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BadgeTransparent.all
        case .stylesSalute:
            return StylesSaluteTheme.BadgeTransparent.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BadgeTransparent.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.BadgeTransparent.all
        }
    }
    
    var iconBadgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadge.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadge.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadge.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadgeClear.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadgeClear.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadgeClear.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconBadgeTransparent.all
        case .stylesSalute:
            return StylesSaluteTheme.IconBadgeTransparent.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconBadgeTransparent.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var indicatorVariations: [Variation<IndicatorAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Indicator.all
        case .stylesSalute:
            return StylesSaluteTheme.Indicator.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Indicator.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Indicator.all
        }
    }
    
    var cellVariations: [Variation<CellAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Cell.all
        case .stylesSalute:
            return StylesSaluteTheme.Cell.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Cell.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Cell.all
        }
    }
    
    var cardVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Card.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Card.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var cardClearVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CardClear.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CardClear.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BottomSheet.all
        case .stylesSalute:
            return StylesSaluteTheme.BottomSheet.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BottomSheet.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CircularProgressBar.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CircularProgressBar.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var dividerVariations: [Variation<DividerAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Divider.all
        case .stylesSalute:
            return StylesSaluteTheme.Divider.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Divider.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Divider.all
        }
    }

    var overlayVariations: [Variation<OverlayAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Overlay.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Overlay.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var popoverVariations: [Variation<PopoverAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Popover.all
        case .stylesSalute:
            return StylesSaluteTheme.Popover.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Popover.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var tooltipVariations: [Variation<TooltipAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Tooltip.all
        case .stylesSalute:
            return StylesSaluteTheme.Tooltip.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Tooltip.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var toastVariations: [Variation<ToastAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Toast.all
        case .stylesSalute:
            return StylesSaluteTheme.Toast.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Toast.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var modalVariations: [Variation<ModalAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Modal.all
        case .stylesSalute:
            return StylesSaluteTheme.Modal.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Modal.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var notificationCompactVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.NotificationCompact.all
        case .stylesSalute:
            return StylesSaluteTheme.NotificationCompact.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.NotificationCompact.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var notificationLooseVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.NotificationLoose.all
        case .stylesSalute:
            return StylesSaluteTheme.NotificationLoose.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.NotificationLoose.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var rectSkeletonVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.RectSkeleton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.RectSkeleton.all
        case .stylesSalute:
            StylesSaluteTheme.RectSkeleton.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var textSkeletonVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextSkeleton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextSkeleton.all
        case .stylesSalute:
            StylesSaluteTheme.TextSkeleton.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var listItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ListItemNormal.all
        case .stylesSalute:
            return StylesSaluteTheme.ListItemNormal.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ListItemNormal.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var listItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ListItemTight.all
        case .stylesSalute:
            return StylesSaluteTheme.ListItemTight.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ListItemTight.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var listNormalVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ListNormal.all
        case .stylesSalute:
            return StylesSaluteTheme.ListNormal.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ListNormal.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var listTightVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.ListTight.all
        case .stylesSalute:
            return StylesSaluteTheme.ListTight.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.ListTight.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var scrollbarVariations: [Variation<ScrollbarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ScrollBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ScrollBar.all
        case .stylesSalute:
            StylesSaluteTheme.ScrollBar.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var dropdownMenuNormalVariations: [Variation<DropdownMenuAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuNormal.all
        case .stylesSalute:
            StylesSaluteTheme.DropdownMenuNormal.all
        }
    }
    
    var dropdownMenuTightVariations: [Variation<DropdownMenuAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuTight.all
        case .stylesSalute:
            StylesSaluteTheme.DropdownMenuTight.all
        }
    }
    
    var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.DropdownMenuItemNormal.all
        case .stylesSalute:
            return StylesSaluteTheme.DropdownMenuItemNormal.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.DropdownMenuItemNormal.all
        }
    }
    
    var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.DropdownMenuItemTight.all
        case .stylesSalute:
            return StylesSaluteTheme.DropdownMenuItemTight.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.DropdownMenuItemTight.all
        }
    }
    
    var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionItemClearActionStart.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionItemClearActionStart.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionItemClearActionStart.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionItemClearActionEnd.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionItemClearActionEnd.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionItemClearActionEnd.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionItemSolidActionStart.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionItemSolidActionStart.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionItemSolidActionStart.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionItemSolidActionEnd.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionItemSolidActionEnd.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionItemSolidActionEnd.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionClearActionStart.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionClearActionStart.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionClearActionStart.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionClearActionEnd.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionClearActionEnd.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionClearActionEnd.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionSolidActionStart.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionSolidActionStart.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionSolidActionStart.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.AccordionSolidActionEnd.all
        case .stylesSalute:
            return StylesSaluteTheme.AccordionSolidActionEnd.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.AccordionSolidActionEnd.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var spinnerVariations: [Variation<SpinnerAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Spinner.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Spinner.all
        case .plasmaHomeDSTheme:
            return []
        }
    }    
}
