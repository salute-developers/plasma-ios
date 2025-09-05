//
//  TabBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 03.09.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 PLASMA-T2182
 */
struct TabBarClearLDefaultExtraTypeNone: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2183
 */
struct TabBarHasLabelClearMSecondaryCounter: View {
    var appearance: TabBarAppearance
    @State var selecetedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selecetedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2184
 */
struct TabBarHasLabelSolidLAccentIndicator: View {
    var appearance: TabBarAppearance
    @State var selecetedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(indicatorForTest)
                    )
                },
                selectedIndex: $selecetedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2185
 */
struct TabBarIslandClearLShadowDefault: View {
    var appearance: TabBarIslandAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBarIsland(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}


/**
 PLASMA-T2186
 */
struct TabBarIslandHasLabelClearLShadowSecondaryCounter: View {
    var appearance: TabBarIslandAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3).ignoresSafeArea()
            SDDSTabBarIsland(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2187
 */
struct TabBarHasLabelSolidLShadowAccentCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2188
 */
struct TabBarIslandSolidLDefaultCounter: View {
    var appearance: TabBarIslandAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        SDDSTabBarIsland(
            items: (0..<6).map { index in
                TabBarItemData(
                    content: AnyView(iconForTest),
                    selectedContent: AnyView(selectedIcon),
                    text: "Label",
                    appearance: appearance.tabBarItemAppearance,
                    extra: AnyView(counterForTest)
                )
            },
            selectedIndex: $selectedIndex,
            appearance: appearance
        )
    }
}

/**
 PLASMA-T2189
 */
struct TabBarSolidLRoundedDefaultIndicator: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(indicatorForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2190
 */
struct TabBarClearMRoundedSecondaryCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2191
 */
struct TabBarHasLabelClearLRoundedAccentCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2192
 */
struct TabBarHasLabelSolidLDividerDefaultCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2193
 */
struct TabBarSolidLDividerSecondarytCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2194
 */
struct TabBarClearLDividerAccenttCounter: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: AnyView(counterForTest)
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2195
 */
struct TabBarClearLDividerRoundedDefault: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2196
 */
struct TabBarClearLDividerRoundedSecondary: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2197
 */
struct TabBarSolidLDividerRoundedAccent: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 1
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2198
 */
struct TabBarSolidLShadowRoundedAccent: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2199
 */
struct TabBarSolidLShadowRoundedSecondary: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

/**
 PLASMA-T2200
 */
struct TabBarSolidLShadowRoundedDefault: View {
    var appearance: TabBarAppearance
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            SDDSTabBar(
                items: (0..<5).map { index in
                    TabBarItemData(
                        content: AnyView(iconForTest),
                        selectedContent: AnyView(selectedIcon),
                        text: "Label",
                        appearance: appearance.tabBarItemAppearance,
                        extra: nil
                    )
                },
                selectedIndex: $selectedIndex,
                appearance: appearance
            )
        }
        .padding([.top, .bottom], 12)
        .frame(height: 150)
    }
}

@ViewBuilder
private var iconForTest: some View {
    Asset.starOutline36.image
        .resizable()
        .renderingMode(.template)
}

@ViewBuilder
private var selectedIcon: some View {
    Asset.starFill36.image
        .resizable()
        .renderingMode(.template)
}

private var counterForTest: SDDSCounter {
    .init(
        text: "12",
        isAnimating: false,
        isHighlighted: false,
        isHovered: false,
        isSelected: false
    )
}

private var indicatorForTest: SDDSIndicator {
    .init()
}
