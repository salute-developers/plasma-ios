#if SANDBOX_DS_SERV
import SDDSServTheme

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
        
            return SDDSServTheme.Theme.subtheme(subtheme)
        
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
         return SDDSServTheme.Colors.backgroundDefaultPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundDarkPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return SDDSServTheme.Colors.backgroundDarkPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundLightPrimaryColor(for colorScheme: ColorScheme) -> Color {
         return SDDSServTheme.Colors.backgroundLightPrimary.token.color(for: colorScheme)
        
    }

    private func backgroundInversePrimaryColor(for colorScheme: ColorScheme) -> Color {
         return SDDSServTheme.Colors.backgroundInversePrimary.token.color(for: colorScheme)
        
    }

    public var overlayDefaultSoftColorToken: ColorToken {
        SDDSServTheme.Colors.overlayDefaultSoft.token
    }

    public var basicButtonVariations: [Variation<ButtonAppearance>] {
        
            SDDSServTheme.BasicButton.all
        
    }
    
    public var iconButtonVariations: [Variation<ButtonAppearance>] {
        
            SDDSServTheme.IconButton.all
        
    }
    
    public var linkButtonVariations: [Variation<ButtonAppearance>] {
        
            SDDSServTheme.LinkButton.all
        
    }
    
    public var textFieldVariations: [Variation<TextFieldAppearance>] {
        
            SDDSServTheme.TextField.all
        
    }
    
    public var textFieldClearVariations: [Variation<TextFieldAppearance>] {
        
            SDDSServTheme.TextFieldClear.all
        
    }
    
    public var textAreaVariations: [Variation<TextAreaAppearance>] {
        
            SDDSServTheme.TextArea.all
        
    }
    
    public var textAreaClearVariations: [Variation<TextAreaAppearance>] {
        
            SDDSServTheme.TextAreaClear.all
        
    }
    
    public var editableVariations: [Variation<EditableAppearance>] {
        
            SDDSServTheme.Editable.all
        
    }
    
    public var avatarVariations: [Variation<AvatarAppearance>] {
        
            SDDSServTheme.Avatar.all
        
    }
    
    public var avatarGroupVariations: [Variation<AvatarGroupAppearance>] {
        
            SDDSServTheme.AvatarGroup.all
        
    }
    
    public var counterVariations: [Variation<CounterAppearance>] {
        
            SDDSServTheme.Counter.all
        
    }
    
    public var chipGroupVariations: [Variation<ChipGroupAppearance>] {
        
            SDDSServTheme.ChipGroup.all
        
    }
    
    public var chipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            SDDSServTheme.ChipGroupDense.all
        
    }
    
    public var chipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            SDDSServTheme.ChipGroupWide.all
        
    }
    
    public var embeddedChipGroupDenseVariations: [Variation<ChipGroupAppearance>] {
        
            SDDSServTheme.EmbeddedChipGroupDense.all
        
    }
    
    public var embeddedChipGroupWideVariations: [Variation<ChipGroupAppearance>] {
        
            SDDSServTheme.EmbeddedChipGroupWide.all
        
    }
    
    public var checkboxVariations: [Variation<CheckboxAppearance>] {
        
            SDDSServTheme.Checkbox.all
        
    }
    
    public var checkboxGroupVariations: [Variation<CheckboxGroupAppearance>] {
        
            SDDSServTheme.CheckboxGroup.all
        
    }
    
    public var radioboxVariations: [Variation<RadioboxAppearance>] {
        
            SDDSServTheme.Radiobox.all
        
    }
    
    public var radioboxGroupVariations: [Variation<RadioboxGroupAppearance>] {
        
            SDDSServTheme.RadioboxGroup.all
        
    }
    
    public var chipVariations: [Variation<ChipAppearance>] {
        
            SDDSServTheme.Chip.all
        
    }
    
    public var embeddedChipVariations: [Variation<ChipAppearance>] {
        
            SDDSServTheme.EmbeddedChip.all
        
    }
    
    public var progressBarVariations: [Variation<ProgressBarAppearance>] {
        
            SDDSServTheme.ProgressBar.all
        
    }
    
    public var segmentItemVariations: [Variation<SegmentItemAppearance>] {
        
            SDDSServTheme.SegmentItem.all
        
    }
    
    public var segmentVariations: [Variation<SegmentAppearance>] {
        
            SDDSServTheme.Segment.all
        
    }
    
    public var switchVariations: [Variation<SwitchAppearance>] {
        
            SDDSServTheme.Switch.all
        
    }
    
    public var badgeVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.Badge.all
        
    }
    
    public var badgeClearVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.BadgeClear.all
        
    }
    
    public var badgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.BadgeTransparent.all
        
    }
    
    public var iconBadgeVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.IconBadge.all
        
    }
    
    public var iconBadgeClearVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.IconBadgeClear.all
        
    }
    
    public var iconBadgeTransparentVariations: [Variation<BadgeAppearance>] {
        
            SDDSServTheme.IconBadgeTransparent.all
        
    }
    
    public var indicatorVariations: [Variation<IndicatorAppearance>] {
        
            SDDSServTheme.Indicator.all
        
    }
    
    public var paginationDotsHorizontalVariations: [Variation<PaginationDotsAppearance>] {
        
            SDDSServTheme.PaginationDotsHorizontal.all
        
    }
    
    public var paginationDotsVerticalVariations: [Variation<PaginationDotsAppearance>] {
        
            SDDSServTheme.PaginationDotsVertical.all
        
    }

    public var carouselVariations: [Variation<CarouselAppearance>] {
        SDDSServTheme.Carousel.all
    }

    public var formItemVariations: [Variation<FormItemAppearance>] {
        SDDSServTheme.FormItem.all
    }

    public var imageVariations: [Variation<ImageAppearance>] {
        SDDSServTheme.Image.all
    }
    
    public var cellVariations: [Variation<CellAppearance>] {
        
            SDDSServTheme.Cell.all
        
    }
    
    public var cardSolidVariations: [Variation<CardAppearance>] {
        
            SDDSServTheme.CardSolid.all
        
    }
    
    public var cardVariations: [Variation<CardAppearance>] {
        
            []
        
    }
    
    public var cardClearVariations: [Variation<CardAppearance>] {
        
            SDDSServTheme.CardClear.all
        
    }
    
    public var bottomSheetVariations: [Variation<BottomSheetAppearance>] {
        
            SDDSServTheme.BottomSheet.all
        
    }
    
    public var circularProgressBarVariations: [Variation<CircularProgressBarAppearance>] {
        
            SDDSServTheme.CircularProgressBar.all
        
    }
    
    public var dividerVariations: [Variation<DividerAppearance>] {
        
            SDDSServTheme.Divider.all
        
    }
    
    public var overlayVariations: [Variation<OverlayAppearance>] {
        
            SDDSServTheme.Overlay.all
        
    }
    
    public var popoverVariations: [Variation<PopoverAppearance>] {
        
            SDDSServTheme.Popover.all
        
    }
    
    public var tooltipVariations: [Variation<TooltipAppearance>] {
        
            SDDSServTheme.Tooltip.all
        
    }
    
    public var toastVariations: [Variation<ToastAppearance>] {
        
            SDDSServTheme.Toast.all
        
    }
    
    public var modalVariations: [Variation<ModalAppearance>] {
        
            SDDSServTheme.Modal.all
        
    }
    
    public var notificationCompactVariations: [Variation<NotificationAppearance>] {
        
            SDDSServTheme.NotificationCompact.all
        
    }
    
    public var notificationLooseVariations: [Variation<NotificationAppearance>] {
        
            SDDSServTheme.NotificationLoose.all
        
    }
    
    public var rectSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            SDDSServTheme.RectSkeleton.all
        
    }
    
    public var textSkeletonVariations: [Variation<SkeletonAppearance>] {
        
            SDDSServTheme.TextSkeleton.all
        
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
        
            SDDSServTheme.ListItemNormal.all
        
    }
    
    public var listItemTightVariations: [Variation<ListItemAppearance>] {
        
            SDDSServTheme.ListItemTight.all
        
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
        
            SDDSServTheme.ListNormal.all
        
    }
    
    public var listTightVariations: [Variation<ListAppearance>] {
        
            SDDSServTheme.ListTight.all
        
    }
    
    public var scrollbarVariations: [Variation<ScrollbarAppearance>] {
        
            SDDSServTheme.ScrollBar.all
        
    }
    
    public var dropdownMenuNormalVariations: [Variation<DropdownMenuAppearance>] {
        
            SDDSServTheme.DropdownMenuNormal.all
        
    }
    
    public var dropdownMenuTightVariations: [Variation<DropdownMenuAppearance>] {
        
            SDDSServTheme.DropdownMenuTight.all
        
    }
    
    public var dropdownItemNormalVariations: [Variation<ListItemAppearance>] {
        
            SDDSServTheme.DropdownMenuItemNormal.all
        
    }
    
    public var dropdownItemTightVariations: [Variation<ListItemAppearance>] {
        
            SDDSServTheme.DropdownMenuItemTight.all
        
    }
    
    public var accordionItemClearActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            SDDSServTheme.AccordionItemClearActionStart.all
        
    }
    
    public var accordionItemClearActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            SDDSServTheme.AccordionItemClearActionEnd.all
        
    }
    
    public var accordionItemSolidActionStartVariations: [Variation<AccordionItemAppearance>] {
        
            SDDSServTheme.AccordionItemSolidActionStart.all
        
    }
    
    public var accordionItemSolidActionEndVariations: [Variation<AccordionItemAppearance>] {
        
            SDDSServTheme.AccordionItemSolidActionEnd.all
        
    }
    
    public var accordionClearActionStartVariations: [Variation<AccordionAppearance>] {
        
            SDDSServTheme.AccordionClearActionStart.all
        
    }
    
    public var accordionClearActionEndVariations: [Variation<AccordionAppearance>] {
        
            SDDSServTheme.AccordionClearActionEnd.all
        
    }
    
    public var accordionSolidActionStartVariations: [Variation<AccordionAppearance>] {
        
            SDDSServTheme.AccordionSolidActionStart.all
        
    }
    
    public var accordionSolidActionEndVariations: [Variation<AccordionAppearance>] {
        
            SDDSServTheme.AccordionSolidActionEnd.all
        
    }
    
    public var spinnerVariations: [Variation<SpinnerAppearance>] {
        
            SDDSServTheme.Spinner.all
        
    }
    
    public var loaderVariations: [Variation<LoaderAppearance>] {
        
            SDDSServTheme.Loader.all
        
    }
    
    public var codeFieldVariations: [Variation<CodeFieldAppearance>] {
        
            return SDDSServTheme.CodeField.all
        
    }
    
    public var tabBarIslandSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            SDDSServTheme.TabBarIsland.all
        
    }
    
    public var tabBarIslandClearVariations: [Variation<TabBarIslandAppearance>] {
        
            SDDSServTheme.TabBarIslandClear.all
        
    }
    
    public var tabBarIslandHasLabelClearVariations: [Variation<TabBarIslandAppearance>] {
        
            SDDSServTheme.TabBarIslandHasLabelClear.all
        
    }
    
    public var tabBarIslandHasLabelSolidVariations: [Variation<TabBarIslandAppearance>] {
        
            SDDSServTheme.TabBarIslandHasLabel.all
        
    }
    
    public var tabBarSolidVariations: [Variation<TabBarAppearance>] {
        
            SDDSServTheme.TabBar.all
        
    }
    
    public var tabBarVariations: [Variation<TabBarIslandAppearance>] {
        
            []
        
    }
    
    public var tabBarClearVariations: [Variation<TabBarAppearance>] {
        
            SDDSServTheme.TabBarClear.all
        
    }
    
    public var tabBarHasLabelClearVariations: [Variation<TabBarAppearance>] {
        
            SDDSServTheme.TabBarHasLabelClear.all
        
    }
    
    public var tabBarHasLabelSolidVariations: [Variation<TabBarAppearance>] {
        
            SDDSServTheme.TabBarHasLabel.all
        
    }

    public var codeInputVariations: [Variation<CodeInputAppearance>] {
        
            return SDDSServTheme.CodeInput.all
        
    }
    
    public var basicButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return SDDSServTheme.BasicButtonGroup.all
        
    }
    
    public var iconButtonGroupVariations: [Variation<ButtonGroupAppearance>] {
        
            return SDDSServTheme.IconButtonGroup.all
        
    }
    
    public var wheelVariations: [Variation<WheelAppearance>] {
        
            return []
        
    }
    
    public var navigationBarMainPageVariations: [Variation<NavigationBarMainPageAppearance>] {
        
            return SDDSServTheme.NavigationBarMainPage.all
        
    }

    public var noteVariations: [Variation<NoteAppearance>] {
        
            return SDDSServTheme.Note.all
        
    }
    
    public var navigationBarInternalPageVariations: [Variation<NavigationBarInternalPageAppearance>] {
        
            return SDDSServTheme.NavigationBarInternalPage.all
        
    }

    public var collapsingNavigationBarMainPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return []
        
    }

    public var collapsingNavigationBarInternalPageVariations: [Variation<CollapsingNavigationBarAppearance>] {
        
            return []
        
    }

    public var noteCompactVariations: [Variation<NoteCompactAppearance>] {
        
            return SDDSServTheme.NoteCompact.all
        
    }
    
    public var tabsDefaultVariations: [Variation<TabsAppearance>] {
        
            return SDDSServTheme.TabsDefault.all
        
    }
    
    public var drawerCloseInnerVariations: [Variation<DrawerAppearance>] {
        
            return SDDSServTheme.DrawerCloseInner.all
        
    }
    
    public var tabsHeaderVariations: [Variation<TabsAppearance>] {
        
            return SDDSServTheme.TabsHeader.all
        
    }
    
    public var drawerCloseNoneVariations: [Variation<DrawerAppearance>] {
        
            return SDDSServTheme.DrawerCloseNone.all
        
    }
    
    public var iconTabsVariations: [Variation<TabsAppearance>] {
        
            return SDDSServTheme.IconTabs.all
        
    }
    
    public var tabItemDefaultVariations: [Variation<TabItemAppearance>] {
        
            return SDDSServTheme.TabItemDefault.all
        
    }
    
    public var tabItemHeaderVariations: [Variation<TabItemAppearance>] {
        
            return SDDSServTheme.TabItemHeader.all
        
    }
    
    public var iconTabItemVariations: [Variation<TabItemAppearance>] {
        
            return SDDSServTheme.IconTabItem.all
        
    }
    
    public var drawerCloseOuterVariations: [Variation<DrawerAppearance>] {
        
            return SDDSServTheme.DrawerCloseOuter.all
        
    }
    
    public var autocompleteNormalVariations: [Variation<AutocompleteAppearance>] {
        
            SDDSServTheme.AutocompleteNormal.all
        
    }
    
    public var autocompleteTightVariations: [Variation<AutocompleteAppearance>] {
        
            SDDSServTheme.AutocompleteTight.all
        
    }
    
    public var selectSingleNormalVariations: [Variation<SelectAppearance>] {
        
            SDDSServTheme.SelectSingleNormal.all
        
    }
    
    public var selectSingleTightVariations: [Variation<SelectAppearance>] {
        
            SDDSServTheme.SelectSingleTight.all
        
    }
    
    public var selectMultipleNormalVariations: [Variation<SelectAppearance>] {
        
            SDDSServTheme.SelectMultipleNormal.all
        
    }
    
    public var selectMultipleTightVariations: [Variation<SelectAppearance>] {
        
            SDDSServTheme.SelectMultipleTight.all
        
    }
    
    public var selectItemSingleNormalVariations: [Variation<SelectItemAppearance>] {
        
            SDDSServTheme.SelectItemSingleNormal.all
        
    }
    
    public var selectItemSingleTightVariations: [Variation<SelectItemAppearance>] {
        
            SDDSServTheme.SelectItemSingleTight.all
        
    }
    
    public var selectItemMultipleNormalVariations: [Variation<SelectItemAppearance>] {
        
            SDDSServTheme.SelectItemMultipleNormal.all
        
    }
    
    public var selectItemMultipleTightVariations: [Variation<SelectItemAppearance>] {
        
            SDDSServTheme.SelectItemMultipleTight.all
        
    }
    
    public var toolbarHorizontalVariations: [Variation<ToolbarAppearance>] {
        
            SDDSServTheme.ToolbarHorizontal.all
        
    }
    
    public var toolbarVerticalVariations: [Variation<ToolbarAppearance>] {

            SDDSServTheme.ToolbarVertical.all

    }

    public var availableTenants: [Tenant] {
        switch self {
        case .sdddsServTheme:
            return SDDSServTheme.Theme.availableTenants
        case .plasmaB2CTheme, .plasmaHomeDSTheme, .stylesSalute:
            return []
        }
    }

    public func initialize(tenant: Tenant, onComplete: @escaping () -> Void = {}) {
        switch self {
        case .sdddsServTheme:
            SDDSServTheme.Theme.initialize(tenant: tenant, onComplete: onComplete)
        case .plasmaB2CTheme, .plasmaHomeDSTheme, .stylesSalute:
            onComplete()
        }
    }
}
#endif
