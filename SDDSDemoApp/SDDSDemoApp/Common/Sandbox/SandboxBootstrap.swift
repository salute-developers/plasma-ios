import Foundation
#if SANDBOX_DS_PLASMA_B2C
import PlasmaB2CTheme
#elseif SANDBOX_DS_PLASMA_HOME_DS
import PlasmaHomeDSTheme
#elseif SANDBOX_DS_SERV
import SDDSServTheme
#else
import PlasmaB2CTheme
import PlasmaHomeDSTheme
import StylesSaluteTheme
import SDDSServTheme
#endif
import SandboxCore
import SandboxSwiftUI
import SwiftUI

enum SandboxBootstrap {
    static func registerTheme(profile: SandboxDesignSystemProfile) {
        let manager = ThemeManager.shared
        manager.reset()

        switch profile {
        case .all:
            registerServTheme(manager)
            registerPlasmaB2CTheme(manager)
            registerPlasmaHomeDSTheme(manager)
            registerStylesSaluteTheme(manager)
        case .sddsServ:
            registerServTheme(manager)
        case .plasmaB2C:
            registerPlasmaB2CTheme(manager)
        case .plasmaHomeDS:
            registerPlasmaHomeDSTheme(manager)
        case .stylesSalute:
            registerStylesSaluteTheme(manager)
        }
    }

    static func registerCoreStories() {
        CoreSandboxStoriesRegistration.registerAll()
    }

    /// Hook for design-system-specific generated story registration (see `IntegrationCore/SandboxCodegenContract/README.md`).
    static func registerStories(profile: SandboxDesignSystemProfile) {
        GeneratedStoriesRegistration.registerDesignSystemStoriesIfPresent(profile: profile)
    }

    static func makeStoryItems(profile: SandboxDesignSystemProfile) -> [SandboxStoryItem] {
        let supportedThemes = profile.supportedThemes
        return StoryRegistry.shared.allStories()
            .filter { descriptor in
                isStoryAvailableForAtLeastOneSupportedTheme(descriptor.id, supportedThemes: supportedThemes)
            }
            .map { descriptor in
            SandboxStoryItem(descriptor: descriptor) { anyTheme in
                guard let theme = Theme(rawValue: anyTheme.id) else {
                    return AnyView(Text("Unsupported theme"))
                }
                guard supportedThemes.contains(theme) else {
                    return AnyView(Text("Theme is not available in current DS profile"))
                }

                if let render = SandboxStoryRenderRegistry.shared.renderer(for: descriptor.id) {
                    return render(theme)
                }

                return AnyView(Text("Missing story renderer"))
            }
        }
    }

    private static func isStoryAvailableForAtLeastOneSupportedTheme(
        _ storyId: String,
        supportedThemes: Set<Theme>
    ) -> Bool {
        supportedThemes.contains { isStoryAvailable(storyId, for: $0) }
    }

    /// Hides stories that have no variations for the current theme.
    private static func isStoryAvailable(_ storyId: String, for theme: Theme) -> Bool {
        switch storyId {
        case "wheel.story":
            return !theme.wheelVariations.isEmpty
        case "tabs.story":
            return
                !theme.tabsDefaultVariations.isEmpty ||
                !theme.tabsHeaderVariations.isEmpty ||
                !theme.iconTabsVariations.isEmpty
        case "tabItem.story":
            return
                !theme.tabItemDefaultVariations.isEmpty ||
                !theme.tabItemHeaderVariations.isEmpty ||
                !theme.iconTabItemVariations.isEmpty
        case "navigationBar.story":
            return
                !theme.navigationBarMainPageVariations.isEmpty ||
                !theme.navigationBarInternalPageVariations.isEmpty
        case "collapsingNavigationBar.story":
            return
                !theme.collapsingNavigationBarMainPageVariations.isEmpty ||
                !theme.collapsingNavigationBarInternalPageVariations.isEmpty
        case "note.story":
            return !theme.noteVariations.isEmpty
        case "noteCompact.story":
            return !theme.noteCompactVariations.isEmpty
        case "autocomplete.story":
            return
                !theme.autocompleteNormalVariations.isEmpty ||
                !theme.autocompleteTightVariations.isEmpty
        case "codeField.story":
            return !theme.codeFieldVariations.isEmpty
        case "codeInput.story":
            return !theme.codeInputVariations.isEmpty
        case "textArea.story":
            return !theme.textAreaVariations.isEmpty
        case "select.story":
            return
                !theme.selectSingleNormalVariations.isEmpty ||
                !theme.selectSingleTightVariations.isEmpty ||
                !theme.selectMultipleNormalVariations.isEmpty ||
                !theme.selectMultipleTightVariations.isEmpty
        case "dropDownMenu.story":
            return
                !theme.dropdownMenuNormalVariations.isEmpty ||
                !theme.dropdownMenuTightVariations.isEmpty
        case "accordion.story":
            return
                !theme.accordionClearActionStartVariations.isEmpty ||
                !theme.accordionClearActionEndVariations.isEmpty ||
                !theme.accordionSolidActionStartVariations.isEmpty ||
                !theme.accordionSolidActionEndVariations.isEmpty
        case "accordionItem.story":
            return
                !theme.accordionItemClearActionStartVariations.isEmpty ||
                !theme.accordionItemClearActionEndVariations.isEmpty ||
                !theme.accordionItemSolidActionStartVariations.isEmpty ||
                !theme.accordionItemSolidActionEndVariations.isEmpty
        case "drawer.story":
            return
                !theme.drawerCloseInnerVariations.isEmpty ||
                !theme.drawerCloseNoneVariations.isEmpty ||
                !theme.drawerCloseOuterVariations.isEmpty
        case "paginationDots.story":
            return
                !theme.paginationDotsHorizontalVariations.isEmpty ||
                !theme.paginationDotsVerticalVariations.isEmpty
        case "text.story":
            return true
        case "icon.story":
            return true
        case "image.story":
            return !theme.imageVariations.isEmpty
        case "scrollbar.story":
            return !theme.scrollbarVariations.isEmpty
        case "segment.story":
            return !theme.segmentVariations.isEmpty
        case "segmentElement.story":
            return !theme.segmentItemVariations.isEmpty
        case "toolbar.story":
            return
                !theme.toolbarHorizontalVariations.isEmpty ||
                !theme.toolbarVerticalVariations.isEmpty
        case "popover.story":
            return !theme.popoverVariations.isEmpty
        case "mask.story":
            return false
        case "textFieldMasks.story":
            return theme != .plasmaHomeDSTheme
        case "tabBarIsland.story":
            return
                !theme.tabBarIslandSolidVariations.isEmpty ||
                !theme.tabBarIslandClearVariations.isEmpty ||
                !theme.tabBarIslandHasLabelClearVariations.isEmpty ||
                !theme.tabBarIslandHasLabelSolidVariations.isEmpty
        case "tabBar.story":
            return
                !theme.tabBarSolidVariations.isEmpty ||
                !theme.tabBarClearVariations.isEmpty ||
                !theme.tabBarHasLabelClearVariations.isEmpty ||
                !theme.tabBarHasLabelSolidVariations.isEmpty ||
                !theme.tabBarVariations.isEmpty
        default:
            return true
        }
    }
}

private extension SandboxBootstrap {
    static func registerServTheme(_ manager: ThemeManager) {
        #if SANDBOX_DS_SERV || (!SANDBOX_DS_PLASMA_B2C && !SANDBOX_DS_PLASMA_HOME_DS)
        manager.register(SDDSServSandboxThemeProvider())
        #endif
    }

    static func registerPlasmaB2CTheme(_ manager: ThemeManager) {
        #if SANDBOX_DS_PLASMA_B2C || (!SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_HOME_DS)
        manager.register(PlasmaB2CSandboxThemeProvider())
        #endif
    }

    static func registerPlasmaHomeDSTheme(_ manager: ThemeManager) {
        #if SANDBOX_DS_PLASMA_HOME_DS || (!SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C)
        manager.register(PlasmaHomeDSSandboxThemeProvider())
        #endif
    }

    static func registerStylesSaluteTheme(_ manager: ThemeManager) {
        #if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C && !SANDBOX_DS_PLASMA_HOME_DS
        manager.register(StylesSaluteSandboxThemeProvider())
        #endif
    }
}
