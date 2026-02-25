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
    
    var body: some View {
        SDDSCollapsingNavigationBar(
            appearance: appearance,
            expandedTitle: {
                HStack {
                    Text("Title")
                }.padding(.top, 120)
            },
            expandedDescription: {
                Text("Description")
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
                actionStartView
            },
            actionEnd: {
                actionEndView
            },
            state: CollapsingNavigationBarState(),
            scrollBehavior: .enterAlways,
            content: {
                Text("Content")
            }
        )
    }
}

/**
 PLASMA-T2491
 */
struct CollapsingNavBarLongExpandedTitleDesc: View {
    let appearance: CollapsingNavigationBarAppearance
    
    var body: some View {
        ZStack(alignment: .top) {
            SDDSCollapsingNavigationBar(
                appearance: appearance,
                expandedTitle: {
                    HStack {
                        Text(longTitle)
                    }
                    .padding(.top, 120)
                },
                expandedDescription: {
                    Text(longText)
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
                    HStack {
                        actionStartView
                            .frame(width: 160, alignment: .leading)
                    }
                    .padding(.bottom, 180)
                },
                actionEnd: {
                    HStack {
                        actionEndView
                            .frame(width: 160, alignment: .trailing)
                    }
                    .padding(.bottom, 180)
                },
                state: CollapsingNavigationBarState(),
                scrollBehavior: .enterAlways,
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2492
 */
struct CollapsingNavBarLongContent: View {
    let appearance: CollapsingNavigationBarAppearance
    
    var body: some View {
        
        SDDSCollapsingNavigationBar(
            appearance: appearance,
            expandedTitle: {
                HStack {
                    Text("Title")
                }.padding(.top, 120)
            },
            expandedDescription: {
                
                Text("Description")
            },
            collapsedTitle: {
                Text("Title").opacity(0)
            },
            collapsedDescription: {
                Text("Description").opacity(0)
            },
            expandedTextAlign: NavigationBarTextAlign.center,
            collapsedTextAlign: NavigationBarTextAlign.right,
            centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.relative,
            actionStart: {
                actionStartView
            },
            actionEnd: {
                EmptyView()
            },
            state: CollapsingNavigationBarState(),
            scrollBehavior: .enterAlways,
            content: {
                HStack {
                    Text(longText)
                }
            }
        )
        
    }
}

/**
 PLASMA-T2493
 */
struct CollapsingNavBarNoActionStartRelative: View {
    let appearance: CollapsingNavigationBarAppearance
    
    var body: some View {
        SDDSCollapsingNavigationBar(
            appearance: appearance,
            expandedTitle: {
                Text("Title")
                    .padding(.top, 120)
            },
            expandedDescription: {
                Text("Description")
            },
            collapsedTitle: {
                EmptyView()
            },
            collapsedDescription: {
                EmptyView()
            },
            expandedTextAlign: NavigationBarTextAlign.left,
            collapsedTextAlign: NavigationBarTextAlign.center,
            centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.relative,
            actionStart: {
                actionStartView
            },
            actionEnd: {
                actionEndView
            },
            state: CollapsingNavigationBarState(),
            scrollBehavior: .exitUntilCollapsed,
            onBackPressed: {},
            content: {
                Text("Content")
            }
        )
    }
}

/**
 PLASMA-T2496
 */
struct CollapsingNavigationBarLongDescriptionCollapsed: View {
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
                    Text("Title").opacity(0)
                },
                expandedDescription: {
                    Text("Description").opacity(0)
                },
                collapsedTitle: {
                    HStack {
                        Text("")
                            .opacity(1)
                            .fixedSize()
                    }
                },
                collapsedDescription: {
                    VStack {
                        Text("""
There is no one who loves 
pain itself, who seeks 
after it, and wants to have it, 
simply because it is pain...
""")
                        .opacity(1)
                        .fixedSize()
                    }
                },
                expandedTextAlign: NavigationBarTextAlign.left,
                collapsedTextAlign: NavigationBarTextAlign.center,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    actionStartView
                        .frame(width: 160, alignment: .leading)
                },
                actionEnd: {
                    actionEndView
                        .frame(width: 160, alignment: .trailing)
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2515
 */
struct CollapsingNavigationBarNoActionStartAbsolute: View {
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
                    EmptyView()
                },
                actionEnd: {
                    actionEndView
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2516
 */
struct CollapsingNavigationBarCollapsedTextEndAbsolute: View {
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
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2517
 */
struct CollapsingNavigationBarEndAbsolute: View {
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
                expandedTextAlign: NavigationBarTextAlign.right,
                collapsedTextAlign: NavigationBarTextAlign.right,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    EmptyView()
                },
                actionEnd: {
                    actionEndView
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2518
 */
struct CollapsingNavigationBarStartAbsolute: View {
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
                    actionStartView
                },
                actionEnd: {
                    actionEndView
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2519
 */
struct CollapsingNavigationBarCollapsedCenterAbsolute: View {
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
        ZStack {
            SDDSCollapsingNavigationBar(
                appearance: appearance,
                expandedTitle: {
                    Text("Title").opacity(0)
                },
                expandedDescription: {
                    Text("Description").opacity(0)
                },
                collapsedTitle: {
                    HStack {
                        Text("Title")
                            .opacity(1)
                            .fixedSize()
                    }
                },
                collapsedDescription: {
                    HStack {
                        Text("Description")
                            .opacity(1)
                            .fixedSize()
                    }
                },
                expandedTextAlign: NavigationBarTextAlign.center,
                collapsedTextAlign: NavigationBarTextAlign.center,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    actionStartView
                        .frame(minWidth: 160, alignment: .leading)
                },
                actionEnd: {
                    actionEndView
                        .frame(minWidth: 160, alignment: .trailing)
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
        }
    }
}

/**
 PLASMA-T2520
 */
struct CollapsingNavigationBarCollapsedEndAbsolute: View {
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
                collapsedTextAlign: NavigationBarTextAlign.right,
                centerAlignmentStrategy: CollapsingNavigationBarCenterAlignmentStrategy.absolute,
                actionStart: {
                    actionStartView
                },
                actionEnd: {
                    actionEndView
                },
                state: state,
                scrollBehavior: .enterAlways,
                onBackPressed: {},
                content: {
                    Text("Content")
                }
            )
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
    .padding(.leading)
}

private var actionEndView: some View {
    Button(action: {}) {
        Asset.dotsVerticalOutline24.image
            .renderingMode(.template)
    }
    .buttonStyle(.plain)
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
