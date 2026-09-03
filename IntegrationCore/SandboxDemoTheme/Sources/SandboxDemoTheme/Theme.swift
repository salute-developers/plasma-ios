import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSServTheme
import PlasmaB2CTheme
import PlasmaHomeDSTheme

public enum SandboxDemoAppTheme: String, CaseIterable {
    case sdddsServTheme
    case plasmaB2CTheme
    case plasmaHomeDSTheme

    public var name: String {
        rawValue.capitalized
    }

    public func subtheme(_ subtheme: Subtheme) -> SubthemeData {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Theme.subtheme(subtheme)
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Theme.subtheme(subtheme)
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Theme.subtheme(subtheme)
        }
    }

    /// Background color for the current subtheme and color scheme. Use when setting `subthemeBackgroundColor` environment for components (e.g. CollapsingNavigationBar).
    public func subthemeBackgroundColor(_ subtheme: Subtheme, colorScheme: ColorScheme) -> Color {
        switch subtheme {
        case .onDark:
            return backgroundDarkPrimaryColor(for: colorScheme)
        case .onLight:
            return backgroundLightPrimaryColor(for: colorScheme)
        case .inverse:
            return backgroundInversePrimaryColor(for: colorScheme)
        case .default, .none:
            return backgroundDefaultPrimaryColor(for: colorScheme)
        }
    }

    private func backgroundDefaultPrimaryColor(for colorScheme: ColorScheme) -> Color {
        switch self {
        case .sdddsServTheme: return SDDSServTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        case .plasmaB2CTheme: return PlasmaB2CTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        case .plasmaHomeDSTheme: return PlasmaHomeDSTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        }
    }

    private func backgroundDarkPrimaryColor(for colorScheme: ColorScheme) -> Color {
        switch self {
        case .sdddsServTheme: return SDDSServTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        case .plasmaB2CTheme: return PlasmaB2CTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        case .plasmaHomeDSTheme: return PlasmaHomeDSTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        }
    }

    private func backgroundLightPrimaryColor(for colorScheme: ColorScheme) -> Color {
        switch self {
        case .sdddsServTheme: return SDDSServTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        case .plasmaB2CTheme: return PlasmaB2CTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        case .plasmaHomeDSTheme: return PlasmaHomeDSTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        }
    }

    private func backgroundInversePrimaryColor(for colorScheme: ColorScheme) -> Color {
        switch self {
        case .sdddsServTheme: return SDDSServTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        case .plasmaB2CTheme: return PlasmaB2CTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        case .plasmaHomeDSTheme: return PlasmaHomeDSTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        }
    }

    public var basicButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BasicButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BasicButton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BasicButton.all
        }
    }

    public var iconButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconButton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconButton.all
        }
    }

    public var linkButtonVariations: [Variation<ButtonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.LinkButton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.LinkButton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.LinkButton.all
        }
    }

    public var textFieldVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextField.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextField.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextField.all
        }
    }

    public var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextFieldClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextFieldClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var textAreaVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextArea.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextArea.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextAreaClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextAreaClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var editableVariations: [Variation<EditableAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Editable.all
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Editable.all
        }
    }

    public var avatarVariations: [Variation<AvatarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Avatar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Avatar.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Avatar.all
        }
    }

    public var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AvatarGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AvatarGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.AvatarGroup.all
        }
    }

    public var counterVariations: [Variation<CounterAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Counter.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Counter.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Counter.all
        }
    }

    public var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroup.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroupDense.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroupDense.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ChipGroupDense.all
        }
    }

    public var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ChipGroupWide.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ChipGroupWide.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ChipGroupWide.all
        }
    }

    public var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChipGroupDense.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChipGroupDense.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChipGroupWide.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChipGroupWide.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var checkboxVariations: [Variation<CheckboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Checkbox.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Checkbox.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Checkbox.all
        }
    }

    public var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CheckboxGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CheckboxGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.CheckboxGroup.all
        }
    }

    public var radioboxVariations: [Variation<RadioboxAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Radiobox.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Radiobox.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Radiobox.all
        }
    }

    public var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.RadioboxGroup.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.RadioboxGroup.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.RadioboxGroup.all
        }
    }

    public var chipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Chip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Chip.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Chip.all
        }
    }

    public var embeddedChipVariations: [Variation<ChipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.EmbeddedChip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.EmbeddedChip.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var progressBarVariations: [Variation<ProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ProgressBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ProgressBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SegmentItem.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.SegmentItem.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var segmentVariations: [Variation<SegmentAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Segment.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Segment.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var switchVariations: [Variation<SwitchAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Switch.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Switch.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Switch.all
        }
    }

    public var badgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Badge.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Badge.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Badge.all
        }
    }

    public var badgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BadgeClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BadgeClear.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BadgeClear.all
        }
    }

    public var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BadgeTransparent.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BadgeTransparent.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BadgeTransparent.all
        }
    }

    public var iconBadgeVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadge.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadge.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadge.all
        }
    }

    public var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadgeClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadgeClear.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadgeClear.all
        }
    }

    public var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.IconBadgeTransparent.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.IconBadgeTransparent.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.IconBadgeTransparent.all
        }
    }

    public var indicatorVariations: [Variation<IndicatorAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Indicator.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Indicator.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Indicator.all
        }
    }

    public var paginationDotsHorizontalVariations: [Variation<PaginationDotsAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.PaginationDotsHorizontal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.PaginationDotsHorizontal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var paginationDotsVerticalVariations: [Variation<PaginationDotsAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.PaginationDotsVertical.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.PaginationDotsVertical.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var carouselVariations: [Variation<CarouselAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Carousel.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Carousel.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var formItemVariations: [Variation<FormItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.FormItem.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.FormItem.all
        case .plasmaB2CTheme:
            []
        }
    }

    public var imageVariations: [Variation<ImageAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Image.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Image.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Image.all
        }
    }

    public var cellVariations: [Variation<CellAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Cell.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Cell.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Cell.all
        }
    }

    public var cardSolidVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CardSolid.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CardSolid.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var cardVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Card.all
        }
    }

    public var cardClearVariations: [Variation<CardAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CardClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CardClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.BottomSheet.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.BottomSheet.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.BottomSheet.all
        }
    }

    public var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.CircularProgressBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.CircularProgressBar.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.CircularProgressBar.all
        }
    }

    public var dividerVariations: [Variation<DividerAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Divider.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Divider.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Divider.all
        }
    }

    public var overlayVariations: [Variation<OverlayAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Overlay.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Overlay.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Overlay.all
        }
    }

    public var popoverVariations: [Variation<PopoverAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Popover.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Popover.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tooltipVariations: [Variation<TooltipAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Tooltip.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Tooltip.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Tooltip.all
        }
    }

    public var toastVariations: [Variation<ToastAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Toast.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Toast.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Toast.all
        }
    }

    public var modalVariations: [Variation<ModalAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Modal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Modal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var notificationCompactVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.NotificationCompact.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.NotificationCompact.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var notificationLooseVariations: [Variation<NotificationAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.NotificationLoose.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.NotificationLoose.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var rectSkeletonVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.RectSkeleton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.RectSkeleton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.RectSkeleton.all
        }
    }

    public var textSkeletonVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TextSkeleton.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TextSkeleton.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextSkeleton.all
        }
    }

    public var textSkeletonBodyVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextSkeletonBody.all
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        }
    }

    public var textSkeletonDisplayVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextSkeletonDisplay.all
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        }
    }

    public var textSkeletonHeaderVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextSkeletonHeader.all
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        }
    }

    public var textSkeletonTextVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TextSkeletonText.all
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        }
    }

    public var listItemVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ListItem.all
        }
    }

    public var listNumberedItemVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ListNumberedItem.all
        }
    }

    public var listItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListItemNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListItemNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var listItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListItemTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListItemTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var listVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.List.all
        }
    }

    public var listNumberedVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme, .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.ListNumbered.all
        }
    }

    public var listNormalVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var listTightVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ListTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ListTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var scrollbarVariations: [Variation<ScrollbarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ScrollBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.ScrollBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var dropdownMenuNormalVariations: [Variation<DropdownMenuAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var dropdownMenuTightVariations: [Variation<DropdownMenuAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuItemNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuItemNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.DropdownMenuItemTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.DropdownMenuItemTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemClearActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemClearActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemClearActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemClearActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemSolidActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemSolidActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionItemSolidActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionItemSolidActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionClearActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionClearActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionClearActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionClearActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionSolidActionStart.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionSolidActionStart.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AccordionSolidActionEnd.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AccordionSolidActionEnd.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var spinnerVariations: [Variation<SpinnerAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Spinner.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Spinner.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Spinner.all
        }
    }

    public var loaderVariations: [Variation<LoaderAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Loader.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Loader.all
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Loader.all
        }
    }

    public var codeFieldVariations: [Variation<CodeFieldAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CodeField.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CodeField.all
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var tabBarIslandSolidVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIsland.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIsland.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarIslandClearVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarIslandHasLabelClearVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandHasLabelClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandHasLabelClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarIslandHasLabelSolidVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarIslandHasLabel.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarIslandHasLabel.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarSolidVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBar.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBar.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarVariations: [Variation<TabBarIslandAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.TabBar.all
        }
    }

    public var tabBarClearVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarHasLabelClearVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarHasLabelClear.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarHasLabelClear.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var tabBarHasLabelSolidVariations: [Variation<TabBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.TabBarHasLabel.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.TabBarHasLabel.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var codeInputVariations: [Variation<CodeInputAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.CodeInput.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.CodeInput.all
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var basicButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.BasicButtonGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.BasicButtonGroup.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.BasicButtonGroup.all
        }
    }

    public var iconButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconButtonGroup.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.IconButtonGroup.all
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.IconButtonGroup.all
        }
    }

    public var wheelVariations: [Variation<WheelAppearance>] {
        switch self {
        case .sdddsServTheme:
            return []
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Wheel.all
        }
    }

    public var navigationBarMainPageVariations: [Variation<NavigationBarMainPageAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.NavigationBarMainPage.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.NavigationBarMainPage.all
        }
    }

    public var noteVariations: [Variation<NoteAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Note.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Note.all
        }
    }

    public var navigationBarInternalPageVariations: [Variation<NavigationBarInternalPageAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.NavigationBarInternalPage.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.NavigationBarInternalPage.all
        }
    }

    public var collapsingNavigationBarMainPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return []
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.CollapsingNavigationBarMainPage.all
        }
    }

    public var collapsingNavigationBarInternalPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        switch self {
        case .sdddsServTheme:
            return []
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.CollapsingNavigationBarInternalPage.all
        }
    }

    public var noteCompactVariations: [Variation<NoteCompactAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.NoteCompact.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.NoteCompact.all
        }
    }

    public var tabsDefaultVariations: [Variation<TabsAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TabsDefault.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var drawerCloseInnerVariations: [Variation<DrawerAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.DrawerCloseInner.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.DrawerCloseInner.all
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var tabsHeaderVariations: [Variation<TabsAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TabsHeader.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var drawerCloseNoneVariations: [Variation<DrawerAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.DrawerCloseNone.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.DrawerCloseNone.all
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var iconTabsVariations: [Variation<TabsAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconTabs.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var tabItemDefaultVariations: [Variation<TabItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TabItemDefault.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var tabItemHeaderVariations: [Variation<TabItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.TabItemHeader.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var iconTabItemVariations: [Variation<TabItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.IconTabItem.all
        case .plasmaB2CTheme:
            return []
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var drawerCloseOuterVariations: [Variation<DrawerAppearance>] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.DrawerCloseOuter.all
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.DrawerCloseOuter.all
        case .plasmaHomeDSTheme:
            return []
        }
    }

    public var autocompleteNormalVariations: [Variation<AutocompleteAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AutocompleteNormal.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AutocompleteNormal.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var autocompleteTightVariations: [Variation<AutocompleteAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.AutocompleteTight.all
        case .plasmaB2CTheme:
            PlasmaB2CTheme.AutocompleteTight.all
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var selectSingleNormalVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectSingleNormal.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectSingleTightVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectSingleTight.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectMultipleNormalVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectMultipleNormal.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectMultipleTightVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectMultipleTight.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectItemSingleNormalVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectItemSingleNormal.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectItemSingleTightVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectItemSingleTight.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectItemMultipleNormalVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectItemMultipleNormal.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var selectItemMultipleTightVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.SelectItemMultipleTight.all
        case .plasmaB2CTheme, .plasmaHomeDSTheme:
            []
        }
    }

    public var toolbarHorizontalVariations: [Variation<ToolbarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ToolbarHorizontal.all
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var toolbarVerticalVariations: [Variation<ToolbarAppearance>] {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.ToolbarVertical.all
        case .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            []
        }
    }

    public var availableTenants: [Tenant] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Theme.availableTenants
        case .plasmaB2CTheme:
            return PlasmaB2CTheme.Theme.availableTenants
        case .plasmaHomeDSTheme:
            return PlasmaHomeDSTheme.Theme.availableTenants
        }
    }

    public func initialize(tenant: Tenant) {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Theme.initialize(tenant: tenant)
        case .plasmaB2CTheme:
            PlasmaB2CTheme.Theme.initialize(tenant: tenant)
        case .plasmaHomeDSTheme:
            PlasmaHomeDSTheme.Theme.initialize(tenant: tenant)
        }
    }
}
