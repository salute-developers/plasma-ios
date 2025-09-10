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
            SDDSServTheme.BasicButton.all
        case .stylesSalute:
            StylesSaluteTheme.BasicButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BasicButton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BasicButton.all
        }
    }
    
    var iconButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconButton.all
        case .stylesSalute:
            StylesSaluteTheme.IconButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconButton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconButton.all
        }
    }
    
    var linkButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.LinkButton.all
        case .stylesSalute:
            StylesSaluteTheme.LinkButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.LinkButton.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var textFieldVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextField.all
        case .stylesSalute:
            StylesSaluteTheme.TextField.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextField.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextFieldClear.all
        case .stylesSalute:
            StylesSaluteTheme.TextFieldClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextFieldClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var textAreaVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextArea.all
        case .stylesSalute:
            StylesSaluteTheme.TextArea.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextArea.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextAreaClear.all
        case .stylesSalute:
            StylesSaluteTheme.TextAreaClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextAreaClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var avatarVariations: [Variation<AvatarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Avatar.all
        case .stylesSalute:
            StylesSaluteTheme.Avatar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Avatar.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Avatar.all
        }
    }
    
    var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AvatarGroup.all
        case .stylesSalute:
            StylesSaluteTheme.AvatarGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AvatarGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.AvatarGroup.all
        }
    }
    
    var counterVariations: [Variation<CounterAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Counter.all
        case .stylesSalute:
            StylesSaluteTheme.Counter.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Counter.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Counter.all
        }
    }
    
    var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroup.all
        case .stylesSalute:
            StylesSaluteTheme.ChipGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroup.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroupDense.all
        case .stylesSalute:
            StylesSaluteTheme.ChipGroupDense.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroupDense.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ChipGroupDense.all
        }
    }
    
    var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroupWide.all
        case .stylesSalute:
            StylesSaluteTheme.ChipGroupWide.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroupWide.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ChipGroupWide.all
        }
    }
    
    var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChipGroupDense.all
        case .stylesSalute:
            StylesSaluteTheme.EmbeddedChipGroupDense.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChipGroupDense.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChipGroupWide.all
        case .stylesSalute:
            StylesSaluteTheme.EmbeddedChipGroupWide.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChipGroupWide.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var checkboxVariations: [Variation<CheckboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Checkbox.all
        case .stylesSalute:
            StylesSaluteTheme.Checkbox.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Checkbox.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Checkbox.all
        }
    }
    
    var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CheckboxGroup.all
        case .stylesSalute:
            StylesSaluteTheme.CheckboxGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CheckboxGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.CheckboxGroup.all
        }
    }
    
    var radioboxVariations: [Variation<RadioboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Radiobox.all
        case .stylesSalute:
            StylesSaluteTheme.Radiobox.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Radiobox.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Radiobox.all
        }
    }
    
    var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.RadioboxGroup.all
        case .stylesSalute:
            StylesSaluteTheme.RadioboxGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.RadioboxGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.RadioboxGroup.all
        }
    }
    
    var chipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Chip.all
        case .stylesSalute:
            StylesSaluteTheme.Chip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Chip.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Chip.all
        }
    }
    
    var embeddedChipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChip.all
        case .stylesSalute:
            StylesSaluteTheme.EmbeddedChip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChip.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var progressBarVariations: [Variation<ProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ProgressBar.all
        case .stylesSalute:
            StylesSaluteTheme.ProgressBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ProgressBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SegmentItem.all
        case .stylesSalute:
            StylesSaluteTheme.SegmentItem.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.SegmentItem.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var segmentVariations: [Variation<SegmentAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Segment.all
        case .stylesSalute:
            StylesSaluteTheme.Segment.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Segment.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var switchVariations: [Variation<SwitchAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Switch.all
        case .stylesSalute:
            StylesSaluteTheme.Switch.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Switch.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Switch.all
        }
    }
    
    var badgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Badge.all
        case .stylesSalute:
            StylesSaluteTheme.Badge.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Badge.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Badge.all
        }
    }
    
    var badgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BadgeClear.all
        case .stylesSalute:
            StylesSaluteTheme.BadgeClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BadgeClear.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BadgeClear.all
        }
    }
    
    var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BadgeTransparent.all
        case .stylesSalute:
            StylesSaluteTheme.BadgeTransparent.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BadgeTransparent.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BadgeTransparent.all
        }
    }
    
    var iconBadgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadge.all
        case .stylesSalute:
            StylesSaluteTheme.IconBadge.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadge.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadge.all
        }
    }
    
    var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadgeClear.all
        case .stylesSalute:
            StylesSaluteTheme.IconBadgeClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadgeClear.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadgeClear.all
        }
    }
    
    var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadgeTransparent.all
        case .stylesSalute:
            StylesSaluteTheme.IconBadgeTransparent.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadgeTransparent.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadgeTransparent.all
        }
    }
    
    var indicatorVariations: [Variation<IndicatorAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Indicator.all
        case .stylesSalute:
            StylesSaluteTheme.Indicator.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Indicator.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Indicator.all
        }
    }
    
    var cellVariations: [Variation<CellAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Cell.all
        case .stylesSalute:
            StylesSaluteTheme.Cell.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Cell.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Cell.all
        }
    }
    
    var cardVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Card.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Card.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var cardClearVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CardClear.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CardClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BottomSheet.all
        case .stylesSalute:
            StylesSaluteTheme.BottomSheet.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BottomSheet.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CircularProgressBar.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CircularProgressBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var dividerVariations: [Variation<DividerAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Divider.all
        case .stylesSalute:
            StylesSaluteTheme.Divider.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Divider.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Divider.all
        }
    }
    
    var overlayVariations: [Variation<OverlayAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Overlay.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Overlay.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var popoverVariations: [Variation<PopoverAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Popover.all
        case .stylesSalute:
            StylesSaluteTheme.Popover.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Popover.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tooltipVariations: [Variation<TooltipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Tooltip.all
        case .stylesSalute:
            StylesSaluteTheme.Tooltip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Tooltip.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var toastVariations: [Variation<ToastAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Toast.all
        case .stylesSalute:
            StylesSaluteTheme.Toast.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Toast.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var modalVariations: [Variation<ModalAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Modal.all
        case .stylesSalute:
            StylesSaluteTheme.Modal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Modal.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var notificationCompactVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.NotificationCompact.all
        case .stylesSalute:
            StylesSaluteTheme.NotificationCompact.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.NotificationCompact.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var notificationLooseVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.NotificationLoose.all
        case .stylesSalute:
            StylesSaluteTheme.NotificationLoose.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.NotificationLoose.all
        case .plasmaHomeDSTheme:
            []
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
            []
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
            []
        }
    }
    
    var listItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListItemNormal.all
        case .stylesSalute:
            StylesSaluteTheme.ListItemNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListItemNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var listItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListItemTight.all
        case .stylesSalute:
            StylesSaluteTheme.ListItemTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListItemTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var listNormalVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListNormal.all
        case .stylesSalute:
            StylesSaluteTheme.ListNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var listTightVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListTight.all
        case .stylesSalute:
            StylesSaluteTheme.ListTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListTight.all
        case .plasmaHomeDSTheme:
            []
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
            []
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
        case .plasmaHomeDSTheme:
            []
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
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuItemNormal.all
        case .stylesSalute:
            StylesSaluteTheme.DropdownMenuItemNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuItemNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuItemTight.all
        case .stylesSalute:
            StylesSaluteTheme.DropdownMenuItemTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuItemTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemClearActionStart.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionItemClearActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemClearActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemClearActionEnd.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionItemClearActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemClearActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemSolidActionStart.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionItemSolidActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemSolidActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemSolidActionEnd.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionItemSolidActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemSolidActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionClearActionStart.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionClearActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionClearActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionClearActionEnd.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionClearActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionClearActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionSolidActionStart.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionSolidActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionSolidActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionSolidActionEnd.all
        case .stylesSalute:
            StylesSaluteTheme.AccordionSolidActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionSolidActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var spinnerVariations: [Variation<SpinnerAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Spinner.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Spinner.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var loaderVariations: [Variation<LoaderAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Loader.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Loader.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var codeFieldVariations: [Variation<CodeFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CodeField.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CodeField.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var tabBarIslandSolidVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIsland.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIsland.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarIslandClearVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandClear.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarIslandHasLabelClearVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandHasLabelClear.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandHasLabelClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarIslandHasLabelSolidVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandHasLabel.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandHasLabel.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarSolidVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBar.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TabBar.all
        }
    }
    
    var tabBarClearVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarClear.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarHasLabelClearVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarHasLabelClear.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarHasLabelClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    var tabBarHasLabelSolidVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarHasLabel.all
        case .stylesSalute:
            []
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarHasLabel.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    var codeInputVariations: [Variation<CodeInputAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CodeInput.all
        case .stylesSalute:
            return []
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CodeInput.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var basicButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BasicButtonGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.BasicButtonGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BasicButtonGroup.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
    
    var iconButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconButtonGroup.all
        case .stylesSalute:
            return StylesSaluteTheme.IconButtonGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconButtonGroup.all
        case .plasmaHomeDSTheme:
            return []
        }
    }
}
