#if SANDBOX_DS_PLASMA_B2C
import PlasmaB2CTheme

import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public enum SandboxDemoAppTheme: String, CaseIterable {
    case sdddsServTheme
    case plasmaB2CTheme
    case plasmaHomeDSTheme
    case stylesSalute
    
    public var name: String {
        rawValue.capitalized
    }
    
    public func subtheme(_ subtheme: Subtheme) -> SubthemeData {
        
            return PlasmaB2CTheme.Theme.subtheme(subtheme)
        
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
         return PlasmaB2CTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundDarkPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaB2CTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundLightPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaB2CTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundInversePrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaB2CTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        
    }

    public var overlayDefaultSoftColorToken: ColorToken {
        PlasmaB2CTheme.Colors.overlayDefaultSoft.token
    }

    public var basicButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaB2CTheme.BasicButton.all
        
    }
    
    public var iconButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaB2CTheme.IconButton.all
        
    }
    
    public var linkButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaB2CTheme.LinkButton.all
        
    }
    
    public var textFieldVariations: [Variation<TextFieldAppearance>] {
        
            PlasmaB2CTheme.TextField.all
        
    }
    
    public var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        
            PlasmaB2CTheme.TextFieldClear.all
        
    }
    
    public var textAreaVariations: [Variation<TextAreaAppearance>] {
        
            PlasmaB2CTheme.TextArea.all
        
    }
    
    public var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        
            PlasmaB2CTheme.TextAreaClear.all
        
    }
    
    public var editableVariations: [Variation<EditableAppearance>] {
        
            []
        
    }
    
    public var avatarVariations: [Variation<AvatarAppearance>] {
        
            PlasmaB2CTheme.Avatar.all
        
    }
    
    public var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        
            PlasmaB2CTheme.AvatarGroup.all
        
    }
    
    public var counterVariations: [Variation<CounterAppearance>] {
        
            PlasmaB2CTheme.Counter.all
        
    }
    
    public var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaB2CTheme.ChipGroup.all
        
    }
    
    public var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaB2CTheme.ChipGroupDense.all
        
    }
    
    public var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaB2CTheme.ChipGroupWide.all
        
    }
    
    public var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaB2CTheme.EmbeddedChipGroupDense.all
        
    }
    
    public var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaB2CTheme.EmbeddedChipGroupWide.all
        
    }
    
    public var checkboxVariations: [Variation<CheckboxAppearance>] {
        
            PlasmaB2CTheme.Checkbox.all
        
    }
    
    public var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        
            PlasmaB2CTheme.CheckboxGroup.all
        
    }
    
    public var radioboxVariations: [Variation<RadioboxAppearance>] {
        
            PlasmaB2CTheme.Radiobox.all
        
    }
    
    public var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        
            PlasmaB2CTheme.RadioboxGroup.all
        
    }
    
    public var chipVariations: [Variation<ChipAppearance>] {
        
            PlasmaB2CTheme.Chip.all
        
    }
    
    public var embeddedChipVariations: [Variation<ChipAppearance>] {
        
            PlasmaB2CTheme.EmbeddedChip.all
        
    }
    
    public var progressBarVariations: [Variation<ProgressBarAppearance>] {
        
            PlasmaB2CTheme.ProgressBar.all
        
    }
    
    public var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        
            PlasmaB2CTheme.SegmentItem.all
        
    }
    
    public var segmentVariations: [Variation<SegmentAppearance>] {
        
            PlasmaB2CTheme.Segment.all
        
    }
    
    public var switchVariations: [Variation<SwitchAppearance>] {
        
            PlasmaB2CTheme.Switch.all
        
    }
    
    public var badgeVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.Badge.all
        
    }
    
    public var badgeClearVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.BadgeClear.all
        
    }
    
    public var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.BadgeTransparent.all
        
    }
    
    public var iconBadgeVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.IconBadge.all
        
    }
    
    public var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.IconBadgeClear.all
        
    }
    
    public var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            PlasmaB2CTheme.IconBadgeTransparent.all
        
    }
    
    public var indicatorVariations: [Variation<IndicatorAppearance>] {
        
            PlasmaB2CTheme.Indicator.all
        
    }
    
    public var paginationDotsHorizontalVariations: [Variation<PaginationDotsAppearance>] {
        
            PlasmaB2CTheme.PaginationDotsHorizontal.all
        
    }
    
    public var paginationDotsVerticalVariations: [Variation<PaginationDotsAppearance>] {
        
            PlasmaB2CTheme.PaginationDotsVertical.all
        
    }

    public var imageVariations: [Variation<ImageAppearance>] {
        PlasmaB2CTheme.Image.all
    }
    
    public var cellVariations: [Variation<CellAppearance>] {
        
            PlasmaB2CTheme.Cell.all
        
    }
    
    public var cardSolidVariations: [Variation<CardAppearance>] {
        
            PlasmaB2CTheme.CardSolid.all
        
    }
    
    public var cardVariations: [Variation<CardAppearance>] {
        
            []
        
    }
    
    public var cardClearVariations: [Variation<CardAppearance>] {
        
            PlasmaB2CTheme.CardClear.all
        
    }
    
    public var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        
            PlasmaB2CTheme.BottomSheet.all
        
    }
    
    public var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        
            PlasmaB2CTheme.CircularProgressBar.all
        
    }
    
    public var dividerVariations: [Variation<DividerAppearance>] {
        
            PlasmaB2CTheme.Divider.all
        
    }
    
    public var overlayVariations: [Variation<OverlayAppearance>] {
        
            PlasmaB2CTheme.Overlay.all
        
    }
    
    public var popoverVariations: [Variation<PopoverAppearance>] {
        
            PlasmaB2CTheme.Popover.all
        
    }
    
    public var tooltipVariations: [Variation<TooltipAppearance>] {
        
            PlasmaB2CTheme.Tooltip.all
        
    }
    
    public var toastVariations: [Variation<ToastAppearance>] {
        
            PlasmaB2CTheme.Toast.all
        
    }
    
    public var modalVariations: [Variation<ModalAppearance>] {
        
            PlasmaB2CTheme.Modal.all
        
    }
    
    public var notificationCompactVariations: [Variation<NotificationAppearance>] {
        
            PlasmaB2CTheme.NotificationCompact.all
        
    }
    
    public var notificationLooseVariations: [Variation<NotificationAppearance>] {
        
            PlasmaB2CTheme.NotificationLoose.all
        
    }
    
    public var rectSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaB2CTheme.RectSkeleton.all
        
    }
    
    public var textSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaB2CTheme.TextSkeleton.all
        
    }
    
    public var textSkeletonBodyVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            []
        case .sdddsServTheme, .plasmaB2CTheme, .stylesSalute:
            []
        }
    }
    
    public var textSkeletonDisplayVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            []
        case .sdddsServTheme, .plasmaB2CTheme, .stylesSalute:
            []
        }
    }
    
    public var textSkeletonHeaderVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            []
        case .sdddsServTheme, .plasmaB2CTheme, .stylesSalute:
            []
        }
    }
    
    public var textSkeletonTextVariations: [Variation<SkeletonAppearance>] {
        switch self {
        case .plasmaHomeDSTheme:
            []
        case .sdddsServTheme, .plasmaB2CTheme, .stylesSalute:
            []
        }
    }
    
    public var listItemVariations: [Variation<ListItemAppearance>] {
        
            []
        
    }
    
    public var listNumberedItemVariations: [Variation<ListItemAppearance>] {
        switch self {
        case .sdddsServTheme, .stylesSalute, .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    public var listItemNormalVariations: [Variation<ListItemAppearance>] {
        
            PlasmaB2CTheme.ListItemNormal.all
        
    }
    
    public var listItemTightVariations: [Variation<ListItemAppearance>] {
        
            PlasmaB2CTheme.ListItemTight.all
        
    }
    
    public var listVariations: [Variation<ListAppearance>] {
        
            []
        
    }
    
    public var listNumberedVariations: [Variation<ListAppearance>] {
        switch self {
        case .sdddsServTheme, .stylesSalute, .plasmaB2CTheme:
            []
        case .plasmaHomeDSTheme:
            []
        }
    }
    
    public var listNormalVariations: [Variation<ListAppearance>] {
        
            PlasmaB2CTheme.ListNormal.all
        
    }
    
    public var listTightVariations: [Variation<ListAppearance>] {
        
            PlasmaB2CTheme.ListTight.all
        
    }
    
    public var scrollbarVariations: [Variation<ScrollbarAppearance>] {
        
            PlasmaB2CTheme.ScrollBar.all
        
    }
    
    public var dropdownMenuNormalVariations: [Variation<DropdownMenuAppearance>] {
        
            PlasmaB2CTheme.DropdownMenuNormal.all
        
    }
    
    public var dropdownMenuTightVariations: [Variation<DropdownMenuAppearance>] {
        
            PlasmaB2CTheme.DropdownMenuTight.all
        
    }
    
    public var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        
            PlasmaB2CTheme.DropdownMenuItemNormal.all
        
    }
    
    public var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        
            PlasmaB2CTheme.DropdownMenuItemTight.all
        
    }
    
    public var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            PlasmaB2CTheme.AccordionItemClearActionStart.all
        
    }
    
    public var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            PlasmaB2CTheme.AccordionItemClearActionEnd.all
        
    }
    
    public var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            PlasmaB2CTheme.AccordionItemSolidActionStart.all
        
    }
    
    public var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            PlasmaB2CTheme.AccordionItemSolidActionEnd.all
        
    }
    
    public var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        
            PlasmaB2CTheme.AccordionClearActionStart.all
        
    }
    
    public var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        
            PlasmaB2CTheme.AccordionClearActionEnd.all
        
    }
    
    public var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        
            PlasmaB2CTheme.AccordionSolidActionStart.all
        
    }
    
    public var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        
            PlasmaB2CTheme.AccordionSolidActionEnd.all
        
    }
    
    public var spinnerVariations: [Variation<SpinnerAppearance>] {
        
            PlasmaB2CTheme.Spinner.all
        
    }
    
    public var loaderVariations: [Variation<LoaderAppearance>] {
        
            PlasmaB2CTheme.Loader.all
        
    }
    
    public var codeFieldVariations: [Variation<CodeFieldAppearance>] {
        
            return PlasmaB2CTheme.CodeField.all
        
    }
    
    public var tabBarIslandSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            PlasmaB2CTheme.TabBarIsland.all
        
    }
    
    public var tabBarIslandClearVariations: [Variation<TabBarIslandAppearance>] {
        
            PlasmaB2CTheme.TabBarIslandClear.all
        
    }
    
    public var tabBarIslandHasLabelClearVariations: [Variation<TabBarIslandAppearance>] {
        
            PlasmaB2CTheme.TabBarIslandHasLabelClear.all
        
    }
    
    public var tabBarIslandHasLabelSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            PlasmaB2CTheme.TabBarIslandHasLabel.all
        
    }
    
    public var tabBarSolidVariations: [Variation<TabBarAppearance>] {
        
            PlasmaB2CTheme.TabBar.all
        
    }
    
    public var tabBarVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarClearVariations: [Variation<TabBarAppearance>] {
        
            PlasmaB2CTheme.TabBarClear.all
        
    }
    
    public var tabBarHasLabelClearVariations: [Variation<TabBarAppearance>] {
        
            PlasmaB2CTheme.TabBarHasLabelClear.all
        
    }
    
    public var tabBarHasLabelSolidVariations: [Variation<TabBarAppearance>] {
        
            PlasmaB2CTheme.TabBarHasLabel.all
        
    }

    public var codeInputVariations: [Variation<CodeInputAppearance>] {
        
            return PlasmaB2CTheme.CodeInput.all
        
    }
    
    public var basicButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return PlasmaB2CTheme.BasicButtonGroup.all
        
    }
    
    public var iconButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return PlasmaB2CTheme.IconButtonGroup.all
        
    }
    
    public var wheelVariations: [Variation<WheelAppearance>] {
        
            return []
        
    }
    
    public var navigationBarMainPageVariations: [Variation<NavigationBarMainPageAppearance>] {
        
            return []
        
    }

    public var noteVariations: [Variation<NoteAppearance>] {
        
            return []
        
    }
    
    public var navigationBarInternalPageVariations: [Variation<NavigationBarInternalPageAppearance>] {
        
            return []
        
    }

    public var collapsingNavigationBarMainPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return []
        
    }

    public var collapsingNavigationBarInternalPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return []
        
    }

    public var noteCompactVariations: [Variation<NoteCompactAppearance>] {
        
            return []
        
    }
    
    public var tabsDefaultVariations: [Variation<TabsAppearance>] {
        
            return []
        
    }
    
    public var drawerCloseInnerVariations: [Variation<DrawerAppearance>] {
        
            return PlasmaB2CTheme.DrawerCloseInner.all
        
    }
    
    public var tabsHeaderVariations: [Variation<TabsAppearance>] {
        
            return []
        
    }
    
    public var drawerCloseNoneVariations: [Variation<DrawerAppearance>] {
        
            return PlasmaB2CTheme.DrawerCloseNone.all
        
    }
    
    public var iconTabsVariations: [Variation<TabsAppearance>] {
        
            return []
        
    }
    
    public var tabItemDefaultVariations: [Variation<TabItemAppearance>] {
        
            return []
        
    }
    
    public var tabItemHeaderVariations: [Variation<TabItemAppearance>] {
        
            return []
        
    }
    
    public var iconTabItemVariations: [Variation<TabItemAppearance>] {
        
            return []
        
    }
    
    public var drawerCloseOuterVariations: [Variation<DrawerAppearance>] {
        
            return PlasmaB2CTheme.DrawerCloseOuter.all
        
    }
    
    public var autocompleteNormalVariations: [Variation<AutocompleteAppearance>] {
        
            PlasmaB2CTheme.AutocompleteNormal.all
        
    }
    
    public var autocompleteTightVariations: [Variation<AutocompleteAppearance>] {
        
            PlasmaB2CTheme.AutocompleteTight.all
        
    }
    
    public var selectSingleNormalVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectSingleTightVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectMultipleNormalVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectMultipleTightVariations: [Variation<SelectAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectItemSingleNormalVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectItemSingleTightVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectItemMultipleNormalVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var selectItemMultipleTightVariations: [Variation<SelectItemAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme, .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var toolbarHorizontalVariations: [Variation<ToolbarAppearance>] {
        
            []
        
    }
    
    public var toolbarVerticalVariations: [Variation<ToolbarAppearance>] {
        
            []
        
    }
}
#endif
