//
//  CollapsingNavigationBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 20.02.2026.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [CollapsingNavigationBar]
 */

/**
 PLASMA-T2490
 */
struct CollapsingNavBarTitleDescStartAbsoulte: View {
    let appearance: CollapsingNavigationBarAppearance
    
    @ObservedObject var state: CollapsingNavigationBarState
    
    init(appearance: CollapsingNavigationBarAppearance) {
        self.appearance = appearance
        
        let collapsedState = CollapsingNavigationBarState(heightOffsetLimit: -120)
        collapsedState.heightOffset = collapsedState.heightOffsetLimit
        collapsedState.contentOffset = -collapsedState.heightOffsetLimit
        self.state = collapsedState
    }
    
    var body: some View {
        HStack {
            SDDSCollapsingNavigationBar(
                appearance: appearance,
                expandedTitle: {
                    Text("Title")
                        .opacity(1)
                        .padding(.top, 56)
                },
                expandedDescription: {
                    Text("Description").opacity(1)
                },
                collapsedTitle: {
                    Text("Title").opacity(0)
                },
                collapsedDescription: {
                    Text("Description").opacity(0)
                },
                expandedTextAlign: NavigationBarTextAlign.left,
                collapsedTextAlign: NavigationBarTextAlign.left,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            Asset.search24.image
                                .renderingMode(.template)
                        }
                        .buttonStyle(.plain)
                        Button(action: {}) {
                            Asset.plus24.image
                                .renderingMode(.template)
                        }
                        .buttonStyle(.plain)
                    }
                },
                actionEnd: {
                    Asset.dotsVerticalOutline24.image
                        .renderingMode(.template)
                },
                state: state,
                scrollBehavior: .enterAlways,
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2491
 */
struct CollapsingNavBarLongExpandedTitleDesc: View {
    let appearance: CollapsingNavigationBarAppearance
    
    @ObservedObject var state: CollapsingNavigationBarState
    
    init(appearance: CollapsingNavigationBarAppearance) {
        self.appearance = appearance
        
        let collapsedState = CollapsingNavigationBarState(heightOffsetLimit: -120)
        collapsedState.heightOffset = collapsedState.heightOffsetLimit
        collapsedState.contentOffset = -collapsedState.heightOffsetLimit
        self.state = collapsedState
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            SDDSCollapsingNavigationBar(
                appearance: appearance,
                expandedTitle: {
                    Text(longTitle)
                        .opacity(1)
                        .padding(.top, 56)
                    
                },
                expandedDescription: {
                    Text(longText).opacity(1)
                },
                collapsedTitle: {
                    Text("Title").opacity(0)
                },
                collapsedDescription: {
                    Text("Description").opacity(0)
                },
                expandedTextAlign: NavigationBarTextAlign.center,
                collapsedTextAlign: NavigationBarTextAlign.center,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    EmptyView()
                },
                actionEnd: {
                    EmptyView()
                },
                state: state,
                scrollBehavior: .enterAlways,
                content: {
                    Text("Content")
                }
            )
            HStack {
                actionStartView
                Spacer()
                actionEndView
            }
        }
    }
}

/**
 PLASMA-T2492
 */
struct CollapsingNavBarLongContent: View {
    let appearance: CollapsingNavigationBarAppearance
    
    @ObservedObject var state: CollapsingNavigationBarState
    
    init(appearance: CollapsingNavigationBarAppearance) {
        self.appearance = appearance
        
        let collapsedState = CollapsingNavigationBarState(heightOffsetLimit: -120)
        collapsedState.heightOffset = collapsedState.heightOffsetLimit
        collapsedState.contentOffset = -collapsedState.heightOffsetLimit
        self.state = collapsedState
    }
    
    var body: some View {
        HStack {
            SDDSCollapsingNavigationBar(
                appearance: appearance,
                expandedTitle: {
                    Text("Title")
                        .opacity(1)
                        .padding(.top, 56)
                },
                expandedDescription: {
                    Text("Description").opacity(1)
                },
                collapsedTitle: {
                    Text("Title").opacity(0)
                },
                collapsedDescription: {
                    Text("Description").opacity(0)
                },
                expandedTextAlign: NavigationBarTextAlign.center,
                collapsedTextAlign: NavigationBarTextAlign.right,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    EmptyView()
                },
                actionEnd: {
                    EmptyView()
                },
                state: state,
                scrollBehavior: .enterAlways,
                content: {
                    Text(longText)
                }
            )
            HStack {
                actionStartView
                Spacer()
            }
        }
    }
}

private var actionStartView: some View {
    HStack(spacing: 12) {
        Button(action: {}) {
            Asset.search24.image
                .renderingMode(.template)
        }
        .buttonStyle(.plain)
        Button(action: {}) {
            Asset.plus24.image
                .renderingMode(.template)
        }
        .buttonStyle(.plain)
    }
    .frame(height: 56, alignment: .top)
    .padding(.leading)
}

private var actionEndView: some View {
    Button(action: {}) {
        Asset.dotsVerticalOutline24.image
            .renderingMode(.template)
    }
    .buttonStyle(.plain)
    .frame(height: 56, alignment: .top)
    .padding(.trailing)
}

private let longText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a
galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in
the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with
desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""

private let longTitle = "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."

struct CollapsingNavBarCollapsed: View {
    let appearance: CollapsingNavigationBarAppearance
    
    @ObservedObject var state: CollapsingNavigationBarState
    
    init(appearance: CollapsingNavigationBarAppearance) {
        self.appearance = appearance
        
        let collapsedState = CollapsingNavigationBarState(heightOffsetLimit: -120)
        collapsedState.heightOffset = collapsedState.heightOffsetLimit
        collapsedState.contentOffset = -collapsedState.heightOffsetLimit
        self.state = collapsedState
    }
    
    var body: some View {
        SDDSCollapsingNavigationBar(
            appearance: appearance,
            expandedTitle: {
                Text("Title").opacity(0)
            },
            expandedDescription: {
                Text("Description").opacity(0)
            },
            collapsedTitle: {
                Text("Title").opacity(1)
            },
            collapsedDescription: {
                Text("Description").opacity(1)
            },
            expandedTextAlign: NavigationBarTextAlign.left,
            collapsedTextAlign: NavigationBarTextAlign.left,
            centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
            actionStart: {
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Asset.search24.image
                            .renderingMode(.template)
                    }
                    .buttonStyle(.plain)
                    Button(action: {}) {
                        Asset.plus24.image
                            .renderingMode(.template)
                    }
                    .buttonStyle(.plain)
                }
            },
            actionEnd: {
                Asset.dotsVerticalOutline24.image
                    .renderingMode(.template)
            },
            state: state,
            scrollBehavior: .enterAlways,
            content: {
                Text("Content")
            }
        )
    }
}

