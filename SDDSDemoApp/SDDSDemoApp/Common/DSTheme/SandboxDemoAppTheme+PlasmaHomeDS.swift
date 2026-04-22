#if SANDBOX_DS_PLASMA_HOME_DS
import PlasmaHomeDSTheme

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
        
            return PlasmaHomeDSTheme.Theme.subtheme(subtheme)
        
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
         return PlasmaHomeDSTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundDarkPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaHomeDSTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundLightPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaHomeDSTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundInversePrimaryColor(for colorScheme: ColorScheme) -> Color {
         return PlasmaHomeDSTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        
    }

    public var overlayDefaultSoftColorToken: ColorToken {
        PlasmaHomeDSTheme.Colors.overlayDefaultSoft.token
    }

    public var basicButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaHomeDSTheme.BasicButton.all
        
    }
    
    public var iconButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaHomeDSTheme.IconButton.all
        
    }
    
    public var linkButtonVariations: [Variation<ButtonAppearance>] {
        
            PlasmaHomeDSTheme.LinkButton.all
        
    }
    
    public var textFieldVariations: [Variation<TextFieldAppearance>] {
        
            PlasmaHomeDSTheme.TextField.all
        
    }
    
    public var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        
            []
        
    }
    
    public var textAreaVariations: [Variation<TextAreaAppearance>] {
        
            []
        
    }
    
    public var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        
            []
        
    }
    
    public var editableVariations: [Variation<EditableAppearance>] {
        
            PlasmaHomeDSTheme.Editable.all
        
    }
    
    public var avatarVariations: [Variation<AvatarAppearance>] {
        
            PlasmaHomeDSTheme.Avatar.all
        
    }
    
    public var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        
            PlasmaHomeDSTheme.AvatarGroup.all
        
    }
    
    public var counterVariations: [Variation<CounterAppearance>] {
        
            PlasmaHomeDSTheme.Counter.all
        
    }
    
    public var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        
            []
        
    }
    
    public var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaHomeDSTheme.ChipGroupDense.all
        
    }
    
    public var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            PlasmaHomeDSTheme.ChipGroupWide.all
        
    }
    
    public var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            []
        
    }
    
    public var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            []
        
    }
    
    public var checkboxVariations: [Variation<CheckboxAppearance>] {
        
            PlasmaHomeDSTheme.Checkbox.all
        
    }
    
    public var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        
            PlasmaHomeDSTheme.CheckboxGroup.all
        
    }
    
    public var radioboxVariations: [Variation<RadioboxAppearance>] {
        
            PlasmaHomeDSTheme.Radiobox.all
        
    }
    
    public var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        
            PlasmaHomeDSTheme.RadioboxGroup.all
        
    }
    
    public var chipVariations: [Variation<ChipAppearance>] {
        
            PlasmaHomeDSTheme.Chip.all
        
    }
    
    public var embeddedChipVariations: [Variation<ChipAppearance>] {
        
            []
        
    }
    
    public var progressBarVariations: [Variation<ProgressBarAppearance>] {
        
            []
        
    }
    
    public var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        
            []
        
    }
    
    public var segmentVariations: [Variation<SegmentAppearance>] {
        
            []
        
    }
    
    public var switchVariations: [Variation<SwitchAppearance>] {
        
            PlasmaHomeDSTheme.Switch.all
        
    }
    
    public var badgeVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.Badge.all
        
    }
    
    public var badgeClearVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.BadgeClear.all
        
    }
    
    public var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.BadgeTransparent.all
        
    }
    
    public var iconBadgeVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.IconBadge.all
        
    }
    
    public var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.IconBadgeClear.all
        
    }
    
    public var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            PlasmaHomeDSTheme.IconBadgeTransparent.all
        
    }
    
    public var indicatorVariations: [Variation<IndicatorAppearance>] {
        
            PlasmaHomeDSTheme.Indicator.all
        
    }
    
    public var paginationDotsHorizontalVariations: [Variation<PaginationDotsAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }
    
    public var paginationDotsVerticalVariations: [Variation<PaginationDotsAppearance>] {
        switch self {
        case .sdddsServTheme:
            []
        case .plasmaB2CTheme:
            []
        case .stylesSalute, .plasmaHomeDSTheme:
            []
        }
    }

    public var carouselVariations: [Variation<CarouselAppearance>] {
        []
    }

    public var imageVariations: [Variation<ImageAppearance>] {
        PlasmaHomeDSTheme.Image.all
    }
    
    public var cellVariations: [Variation<CellAppearance>] {
        
            PlasmaHomeDSTheme.Cell.all
        
    }
    
    public var cardSolidVariations: [Variation<CardAppearance>] {
        
            []
        
    }
    
    public var cardVariations: [Variation<CardAppearance>] {
        
            PlasmaHomeDSTheme.Card.all
        
    }
    
    public var cardClearVariations: [Variation<CardAppearance>] {
        
            []
        
    }
    
    public var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        
            PlasmaHomeDSTheme.BottomSheet.all
        
    }
    
    public var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        
            PlasmaHomeDSTheme.CircularProgressBar.all
        
    }
    
    public var dividerVariations: [Variation<DividerAppearance>] {
        
            PlasmaHomeDSTheme.Divider.all
        
    }
    
    public var overlayVariations: [Variation<OverlayAppearance>] {
        
            PlasmaHomeDSTheme.Overlay.all
        
    }
    
    public var popoverVariations: [Variation<PopoverAppearance>] {
        
            []
        
    }
    
    public var tooltipVariations: [Variation<TooltipAppearance>] {
        
            PlasmaHomeDSTheme.Tooltip.all
        
    }
    
    public var toastVariations: [Variation<ToastAppearance>] {
        
            PlasmaHomeDSTheme.Toast.all
        
    }
    
    public var modalVariations: [Variation<ModalAppearance>] {
        
            []
        
    }
    
    public var notificationCompactVariations: [Variation<NotificationAppearance>] {
        
            []
        
    }
    
    public var notificationLooseVariations: [Variation<NotificationAppearance>] {
        
            []
        
    }
    
    public var rectSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.RectSkeleton.all
        
    }
    
    public var textSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.TextSkeleton.all
        
    }
    
    public var textSkeletonBodyVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.TextSkeletonBody.all
        
    }
    
    public var textSkeletonDisplayVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.TextSkeletonDisplay.all
        
    }
    
    public var textSkeletonHeaderVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.TextSkeletonHeader.all
        
    }
    
    public var textSkeletonTextVariations: [Variation<SkeletonAppearance>] {
        
            PlasmaHomeDSTheme.TextSkeletonText.all
        
    }
    
    public var listItemVariations: [Variation<ListItemAppearance>] {
        
            PlasmaHomeDSTheme.ListItem.all
        
    }
    
    public var listNumberedItemVariations: [Variation<ListItemAppearance>] {
        
            PlasmaHomeDSTheme.ListNumberedItem.all
        
    }
    
    public var listItemNormalVariations: [Variation<ListItemAppearance>] {
        
            []
        
    }
    
    public var listItemTightVariations: [Variation<ListItemAppearance>] {
        
            []
        
    }
    
    public var listVariations: [Variation<ListAppearance>] {
        
            PlasmaHomeDSTheme.List.all
        
    }
    
    public var listNumberedVariations: [Variation<ListAppearance>] {
        
            PlasmaHomeDSTheme.ListNumbered.all
        
    }
    
    public var listNormalVariations: [Variation<ListAppearance>] {
        
            []
        
    }
    
    public var listTightVariations: [Variation<ListAppearance>] {
        
            []
        
    }
    
    public var scrollbarVariations: [Variation<ScrollbarAppearance>] {
        
            []
        
    }
    
    public var dropdownMenuNormalVariations: [Variation<DropdownMenuAppearance>] {
        
            []
        
    }
    
    public var dropdownMenuTightVariations: [Variation<DropdownMenuAppearance>] {
        
            []
        
    }
    
    public var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        
            []
        
    }
    
    public var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        
            []
        
    }
    
    public var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            []
        
    }
    
    public var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            []
        
    }
    
    public var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            []
        
    }
    
    public var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            []
        
    }
    
    public var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        
            []
        
    }
    
    public var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        
            []
        
    }
    
    public var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        
            []
        
    }
    
    public var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        
            []
        
    }
    
    public var spinnerVariations: [Variation<SpinnerAppearance>] {
        
            PlasmaHomeDSTheme.Spinner.all
        
    }
    
    public var loaderVariations: [Variation<LoaderAppearance>] {
        
            PlasmaHomeDSTheme.Loader.all
        
    }
    
    public var codeFieldVariations: [Variation<CodeFieldAppearance>] {
        
            return []
        
    }
    
    public var tabBarIslandSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarIslandClearVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarIslandHasLabelClearVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarIslandHasLabelSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarSolidVariations: [Variation<TabBarAppearance>] {
        
            []
        
    }
    
    public var tabBarVariations: [Variation<TabBarIslandAppearance>] {
        
            PlasmaHomeDSTheme.TabBar.all
        
    }
    
    public var tabBarClearVariations: [Variation<TabBarAppearance>] {
        
            []
        
    }
    
    public var tabBarHasLabelClearVariations: [Variation<TabBarAppearance>] {
        
            []
        
    }
    
    public var tabBarHasLabelSolidVariations: [Variation<TabBarAppearance>] {
        
            []
        
    }

    public var codeInputVariations: [Variation<CodeInputAppearance>] {
        
            return []
        
    }
    
    public var basicButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return PlasmaHomeDSTheme.BasicButtonGroup.all
        
    }
    
    public var iconButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return PlasmaHomeDSTheme.IconButtonGroup.all
        
    }
    
    public var wheelVariations: [Variation<WheelAppearance>] {
        
            return PlasmaHomeDSTheme.Wheel.all
        
    }
    
    public var navigationBarMainPageVariations: [Variation<NavigationBarMainPageAppearance>] {
        
            return PlasmaHomeDSTheme.NavigationBarMainPage.all
        
    }

    public var noteVariations: [Variation<NoteAppearance>] {
        
            return PlasmaHomeDSTheme.Note.all
        
    }
    
    public var navigationBarInternalPageVariations: [Variation<NavigationBarInternalPageAppearance>] {
        
            return PlasmaHomeDSTheme.NavigationBarInternalPage.all
        
    }

    public var collapsingNavigationBarMainPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return PlasmaHomeDSTheme.CollapsingNavigationBarMainPage.all
        
    }

    public var collapsingNavigationBarInternalPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return PlasmaHomeDSTheme.CollapsingNavigationBarInternalPage.all
        
    }

    public var noteCompactVariations: [Variation<NoteCompactAppearance>] {
        
            return PlasmaHomeDSTheme.NoteCompact.all
        
    }
    
    public var tabsDefaultVariations: [Variation<TabsAppearance>] {
        
            return []
        
    }
    
    public var drawerCloseInnerVariations: [Variation<DrawerAppearance>] {
        
            return []
        
    }
    
    public var tabsHeaderVariations: [Variation<TabsAppearance>] {
        
            return []
        
    }
    
    public var drawerCloseNoneVariations: [Variation<DrawerAppearance>] {
        
            return []
        
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
        
            return []
        
    }
    
    public var autocompleteNormalVariations: [Variation<AutocompleteAppearance>] {
        
            []
        
    }
    
    public var autocompleteTightVariations: [Variation<AutocompleteAppearance>] {
        
            []
        
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
