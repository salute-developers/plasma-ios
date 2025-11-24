//
//  TabsTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.11.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Tabs]
 */

/**
 PLASMA-T2271
 */
struct TabsFiveDividerScroll: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .default,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2272
 */
struct TabsTwentyIconStartValueHasActionCounter: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .default,
            stretch: false,
            hasDivider: false,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<20).map { index in
            let item = SDDSTabItem(
                label: "\(index)",
                value: "Value",
                counterValue: 123,
                isSelected: false,
                isDisabled: false,
                hasStartContent: true,
                hasContentRight: true,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {},
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2273
 */
struct TabsFiveIconEndStretchHasDivider: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .none,
            tabItemType: .default,
            stretch: true,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: true,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {},
                contentRight: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2274
 */
struct TabsTenShowAllCounter: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "3"
    
    var body: some View {
        let showMoreTab = TabItem(
            id: "showMore",
            tabItem: SDDSTabItem(
                label: "showMore",
                value: "",
                isSelected: true,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: { EmptyView() },
                contentRight: { EmptyView() },
                actionContent: { EmptyView() }
            ),
            label: "Show More",
            isDisabled: false
        )
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .showMore(
                showMoreItem: showMoreTab,
                dropdownItems: items,
                maxHeight: 40
            ),
            tabItemType: .default,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
        TabDropDownView(items: items, selectedId: $selectedId, maxHeight: 200)
            .padding(.top, 8)
    }
    
    private var items: [TabItem] {
        (0..<3).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: 123,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: true,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {},
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
    struct TabDropDownView: View {
        let items: [TabItem]
        @Binding var selectedId: String?
        let maxHeight: CGFloat
        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(items) { item in
                        item.view
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }
                }
            }
            .frame(maxHeight: maxHeight)
            .background(Color(.systemGray5))
            .cornerRadius(8)
        }
    }
}

struct TabsHasDividerStretch: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "2"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .none,
            tabItemType: .default,
            stretch: true,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2276
 */
struct TabsDisabled: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = ""
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .header,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: true,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2277
 */
struct TabsValueFiveScrollHasDivider: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = ""
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .header,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "Value",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2278
 */
struct TabsTwoValueStretch: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .none,
            tabItemType: .header,
            stretch: true,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<2).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "Value",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2279
 */
struct TabsOneValueShowAllHasAction: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "0"
    
    var body: some View {
        let showMoreTab = TabItem(
            id: "showMore",
            tabItem: SDDSTabItem(
                label: "showMore",
                value: "",
                isSelected: true,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: { EmptyView() },
                contentRight: { EmptyView() },
                actionContent: { EmptyView() }
            ),
            label: "Show More",
            isDisabled: false
        )
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .showMore(
                showMoreItem: showMoreTab,
                dropdownItems: items,
                maxHeight: 40),
            tabItemType: .header,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<1).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "Value",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2280
 */
struct TabsFiveIconEndValueHasActionScrollCounter: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .header,
            stretch: false,
            hasDivider: false,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "Value",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: true,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {},
                contentRight: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2281
 */
struct TabsValueShowAll: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "3"
    
    var body: some View {
        let showMoreTab = TabItem(
            id: "showMore",
            tabItem: SDDSTabItem(
                label: "showMore",
                value: "",
                isSelected: true,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: { EmptyView() },
                contentRight: { EmptyView() },
                actionContent: { EmptyView() }
            ),
            label: "Show More",
            isDisabled: false
        )
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .showMore(
                showMoreItem: showMoreTab,
                dropdownItems: items,
                maxHeight: 40
            ),
            tabItemType: .header,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
        TabDropDownView(items: items, selectedId: $selectedId, maxHeight: 200)
            .padding(.top, 8)
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "Tab\(index)",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {},
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "Tab\(index)", isDisabled: false)
        }
    }
    struct TabDropDownView: View {
        let items: [TabItem]
        @Binding var selectedId: String?
        let maxHeight: CGFloat
        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(items) { item in
                        item.view
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                    }
                }
            }
            .frame(maxHeight: maxHeight)
            .background(Color(.systemGray5))
            .cornerRadius(8)
        }
    }
}

/**
 PLASMA-T2283
 */
struct IconTabsFiveHasActionScroll: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .icon,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: true,
                hasContentRight: false,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {},
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2284
 */
struct IconTabsFiveStretchCounter: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .none,
            tabItemType: .icon,
            stretch: true,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "",
                counterValue: 123,
                isSelected: false,
                isDisabled: false,
                hasStartContent: true,
                hasContentRight: true,
                hasActionContent: false,
                orientation: .vertical,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "\(index)", isDisabled: false)
        }
    }
}

/**
 PLASMA-T2285
 */
struct IconTabsShowAllHasAction: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "..."
    
    var body: some View {
        let showMoreTab = TabItem(
            id: "...",
            tabItem: SDDSTabItem(
                label: "...",
                value: "",
                isSelected: true,
                isDisabled: false,
                hasStartContent: false,
                hasContentRight: false,
                hasActionContent: false,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: { EmptyView() },
                contentRight: { EmptyView() },
                actionContent: { EmptyView() }
            ),
            label: "...",
            isDisabled: false
        )
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .showMore(
                showMoreItem: showMoreTab,
                dropdownItems: items,
                maxHeight: 40
            ),
            tabItemType: .icon,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
        TabDropDownView(items: items, selectedId: $selectedId, maxHeight: 200)
            .padding(.top, 8)
    }
    
    private var items: [TabItem] {
        (0..<3).map { index in
            let item = SDDSTabItem(
                label: "",
                value: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: false,
                hasStartContent: true,
                hasContentRight: false,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "", isDisabled: false)
        }
    }
    struct TabDropDownView: View {
        let items: [TabItem]
        @Binding var selectedId: String?
        let maxHeight: CGFloat
        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(items) { item in
                        item.view
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                    }
                }
            }
            .frame(maxHeight: maxHeight)
            .background(Color(.systemGray5))
            .cornerRadius(8)
        }
    }
}

/**
 PLASMA-T2286
 */
struct IconTabsVerticalHasActionScrollCounter: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = "1"
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .icon,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "",
                counterValue: 123,
                isSelected: false,
                isDisabled: false,
                hasStartContent: true,
                hasContentRight: true,
                hasActionContent: true,
                orientation: .vertical,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "\(index)", isDisabled: false)
        }
    }
}

struct IconTabsHorizontalHasActionScrollDisabled: View {
    
    var appearance: TabsAppearance
    var tabItemAppearance: TabItemAppearance
    @State private var selectedId: String? = ""
    
    var body: some View {
        SDDSTabs(
            items: items,
            selectedId: selectedId,
            clipMode: .scroll,
            tabItemType: .icon,
            stretch: false,
            hasDivider: true,
            appearance: appearance,
            onSelect: {
                id in selectedId = id
            }
        )
    }
    
    private var items: [TabItem] {
        (0..<5).map { index in
            let item = SDDSTabItem(
                label: "",
                counterValue: nil,
                isSelected: false,
                isDisabled: true,
                hasStartContent: true,
                hasContentRight: false,
                hasActionContent: true,
                orientation: .horizontal,
                appearance: tabItemAppearance,
                startContent: {
                    Asset.plasma24.image
                        .resizable()
                        .renderingMode(.template)
                },
                contentRight: {
                    EmptyView()
                },
                actionContent: {
                    EmptyView()
                }
            )
            return TabItem(id: "\(index)", tabItem: item, label: "\(index)", isDisabled: false)
        }
    }
}
