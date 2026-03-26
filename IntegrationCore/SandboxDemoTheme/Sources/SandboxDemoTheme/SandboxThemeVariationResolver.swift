import Foundation
import SandboxCore
import SDDSComponents

public enum SandboxThemeVariationResolver {
    public static func variantNames(theme: SandboxDemoAppTheme, component: ComponentKey) -> [String] {
        variationEntries(theme: theme, component: component).map(\.name)
    }

    public static func appearanceNames(theme: SandboxDemoAppTheme, component: ComponentKey, variant: String) -> [String] {
        variationEntries(theme: theme, component: component)
            .first(where: { $0.name == variant })?
            .styleNames ?? []
    }

    private static func variationEntries(theme: SandboxDemoAppTheme, component: ComponentKey) -> [VariationEntry] {
        switch component.rawValue {
        case "accordion.story":
            return entries(theme.accordionClearActionStartVariations)
                + entries(theme.accordionClearActionEndVariations)
                + entries(theme.accordionSolidActionStartVariations)
                + entries(theme.accordionSolidActionEndVariations)
        case "accordionItem.story":
            return entries(theme.accordionItemClearActionStartVariations)
                + entries(theme.accordionItemClearActionEndVariations)
                + entries(theme.accordionItemSolidActionStartVariations)
                + entries(theme.accordionItemSolidActionEndVariations)
        case "autocomplete.story":
            return entries(theme.autocompleteNormalVariations)
                + entries(theme.autocompleteTightVariations)
        case "avatar.story":
            return entries(theme.avatarVariations)
        case "avatarGroup.story":
            return entries(theme.avatarGroupVariations)
        case "button.story":
            let all = theme.basicButtonVariations + theme.linkButtonVariations + theme.iconButtonVariations
            return entries(all)
        case "buttonGroup.story":
            return entries(theme.basicButtonGroupVariations)
                + entries(theme.iconButtonGroupVariations)
        case "chip.story":
            return entries(theme.chipVariations)
        case "chipGroup.story":
            return entries(theme.chipGroupWideVariations)
                + entries(theme.chipGroupDenseVariations)
                + entries(theme.embeddedChipGroupWideVariations)
                + entries(theme.embeddedChipGroupDenseVariations)
        case "collapsingNavigationBar.story":
            return entries(theme.collapsingNavigationBarMainPageVariations)
                + entries(theme.collapsingNavigationBarInternalPageVariations)
        case "checkbox.story":
            return entries(theme.checkboxVariations)
        case "checkboxGroup.story":
            return entries(theme.checkboxGroupVariations)
        case "progressBar.story":
            return entries(theme.progressBarVariations)
        case "radiobox.story":
            return entries(theme.radioboxVariations)
        case "radioboxGroup.story":
            return entries(theme.radioboxGroupVariations)
        case "scrollbar.story":
            return entries(theme.scrollbarVariations)
        case "select.story":
            return entries(theme.selectSingleNormalVariations)
                + entries(theme.selectSingleTightVariations)
                + entries(theme.selectMultipleNormalVariations)
                + entries(theme.selectMultipleTightVariations)
        case "spinner.story":
            return entries(theme.spinnerVariations)
        case "switch.story":
            return entries(theme.switchVariations)
        case "textArea.story":
            return entries(theme.textAreaVariations)
                + entries(theme.textAreaClearVariations)
        case "textField.story", "textFieldMasks.story", "mask.story":
            return entries(theme.textFieldVariations)
                + entries(theme.textFieldClearVariations)
        case "counter.story":
            return entries(theme.counterVariations)
        case "segmentElement.story":
            return entries(theme.segmentItemVariations)
        case "segment.story":
            return entries(theme.segmentVariations)
        case "badge.story":
            return entries(theme.badgeVariations)
                + entries(theme.badgeClearVariations)
                + entries(theme.badgeTransparentVariations)
                + entries(theme.iconBadgeVariations)
                + entries(theme.iconBadgeClearVariations)
                + entries(theme.iconBadgeTransparentVariations)
        case "indicator.story":
            return entries(theme.indicatorVariations)
        case "cell.story":
            return entries(theme.cellVariations)
        case "card.story":
            return entries(theme.cardSolidVariations)
                + entries(theme.cardVariations)
                + entries(theme.cardClearVariations)
        case "bottomSheet.story":
            return entries(theme.bottomSheetVariations)
        case "circularProgressBar.story":
            return entries(theme.circularProgressBarVariations)
        case "divider.story":
            return entries(theme.dividerVariations)
        case "drawer.story":
            return entries(theme.drawerCloseInnerVariations)
                + entries(theme.drawerCloseNoneVariations)
                + entries(theme.drawerCloseOuterVariations)
        case "editable.story":
            return entries(theme.editableVariations)
        case "list.story":
            return entries(theme.listNormalVariations)
                + entries(theme.listTightVariations)
                + entries(theme.listVariations)
                + entries(theme.listNumberedVariations)
        case "listItem.story":
            return entries(theme.listItemNormalVariations)
                + entries(theme.listItemTightVariations)
                + entries(theme.listItemVariations)
                + entries(theme.listNumberedItemVariations)
        case "overlay.story":
            return entries(theme.overlayVariations)
        case "tabBar.story":
            return entries(theme.tabBarSolidVariations)
                + entries(theme.tabBarClearVariations)
                + entries(theme.tabBarHasLabelClearVariations)
                + entries(theme.tabBarHasLabelSolidVariations)
        case "tabBarIsland.story":
            return entries(theme.tabBarVariations)
                + entries(theme.tabBarIslandSolidVariations)
                + entries(theme.tabBarIslandClearVariations)
                + entries(theme.tabBarIslandHasLabelClearVariations)
                + entries(theme.tabBarIslandHasLabelSolidVariations)
        case "paginationDots.story":
            let all = theme.paginationDotsHorizontalVariations + theme.paginationDotsVerticalVariations
            return entries(all)
        case "popover.story":
            return entries(theme.popoverVariations)
        case "tooltip.story":
            return entries(theme.tooltipVariations)
        case "toast.story":
            return entries(theme.toastVariations)
        case "modal.story":
            return entries(theme.modalVariations)
        case "notification.story":
            return entries(theme.notificationCompactVariations)
                + entries(theme.notificationLooseVariations)
        case "rectSkeleton.story":
            return entries(theme.rectSkeletonVariations)
        case "textSkeleton.story":
            return entries(theme.textSkeletonVariations)
                + entries(theme.textSkeletonBodyVariations)
                + entries(theme.textSkeletonDisplayVariations)
                + entries(theme.textSkeletonHeaderVariations)
                + entries(theme.textSkeletonTextVariations)
        case "dropDownMenu.story":
            return entries(theme.dropdownMenuNormalVariations)
                + entries(theme.dropdownMenuTightVariations)
                + entries(theme.dropdownItemNormalVariations)
                + entries(theme.dropdownItemTightVariations)
        case "codeField.story":
            return entries(theme.codeFieldVariations)
        case "codeInput.story":
            return entries(theme.codeInputVariations)
        case "loader.story":
            return entries(theme.loaderVariations)
        case "wheel.story":
            return entries(theme.wheelVariations)
        case "navigationBar.story":
            return entries(theme.navigationBarMainPageVariations)
                + entries(theme.navigationBarInternalPageVariations)
        case "note.story":
            return entries(theme.noteVariations)
        case "noteCompact.story":
            return entries(theme.noteCompactVariations)
        case "tabs.story":
            return entries(theme.tabsDefaultVariations)
                + entries(theme.tabsHeaderVariations)
                + entries(theme.iconTabsVariations)
        case "tabItem.story":
            return entries(theme.tabItemDefaultVariations)
                + entries(theme.tabItemHeaderVariations)
                + entries(theme.iconTabItemVariations)
        case "toolbar.story":
            return entries(theme.toolbarHorizontalVariations)
                + entries(theme.toolbarVerticalVariations)
        default:
            return []
        }
    }

    private static func entries<Appearance>(_ variations: [Variation<Appearance>]) -> [VariationEntry] {
        variations.map {
            VariationEntry(name: $0.name, styleNames: $0.styles.map(\.name))
        }
    }
}

private struct VariationEntry {
    let name: String
    let styleNames: [String]
}
