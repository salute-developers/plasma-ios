//
//  NavigationBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.11.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [NavigationBar]
 */

/**
 PLASMA-T2339
 */
struct NavigationBarMainPageNoBackgroundInlineCenterInline: View {
    var appearance = NavigationBarMainPageAppearance()
    
    var body: some View {
        SDDSNavigationBar(
            type: .mainPage(appearance: appearance),
            title: "Title",
            textPlacement: .inline,
            textAlign: .center,
            contentPlacement: .inline,
            actionStart: {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                }
            },
            actionEnd: {
                Button(action: {}) {
                    Image(systemName: "person.circle")
                }
            }
        ) {
            Text("Content")
        }
    }
}

/**
 PLASMA-T2340
 */
struct NavigationBarInternalPageNoBackgroundRounded: View {
    var appearance = NavigationBarInternalPageAppearance()
    var body: some View {
        SDDSNavigationBar(
            type: .internalPage(appearance: appearance),
            title: "",
            textPlacement: .bottom,
            textAlign: .left,
            contentPlacement: .bottom,
            backAction: {},
            actionStart: {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                }
            },
            actionEnd: {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        ) {
            Text("Content")
        }
    }
}

/**
 PLASMA-T2341
 */
struct NavigationBarInternalPageHasBackgroundLongTextContent: View {
    var appearance = NavigationBarInternalPageAppearance()
    var body: some View {
        SDDSNavigationBar(
            type: .internalPage(appearance: appearance),
            title: longText,
            textPlacement: .inline,
            textAlign: .center,
            contentPlacement: .bottom,
            backAction: {},
            actionStart: {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                }
            },
            actionEnd: {}
        ) {
            Text(longContent)
        }
    }
}

/**
 PLASMA-T2342
 */
struct NavigationBarInternalPageHasBackgroundRoundedNoContent: View {
    var appearance = NavigationBarInternalPageAppearance()
    var body: some View {
        SDDSNavigationBar(
            type: .internalPage(appearance: appearance),
            title: "Text",
            textPlacement: .inline,
            textAlign: .right,
            contentPlacement: .bottom,
            backAction: {},
            actionStart: {},
            actionEnd: {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        ) {}
    }
}

/**
 PLASMA-T2343
 */
struct NavigationBarInternalPageHasBackgroundShadow: View {
    var appearance = NavigationBarInternalPageAppearance()
    var body: some View {
        SDDSNavigationBar(
            type: .internalPage(appearance: appearance),
            title: longContent,
            textPlacement: .bottom,
            textAlign: .left,
            contentPlacement: .inline,
            backAction: {},
            actionStart: {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                }
            },
            actionEnd: {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        )
        {
            Text("Content")
        }
    }
}

/**
 PLASMA-T2344
 */
struct NavigationBarInternalPageHasBackgroundShadowRounded: View {
    var appearance = NavigationBarInternalPageAppearance()
    var body: some View {
        SDDSNavigationBar(
            type: .internalPage(appearance: appearance),
            title: "Text",
            textPlacement: .bottom,
            textAlign: .center,
            contentPlacement: .bottom,
            backAction: {},
            actionStart: {
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3")
                }
            },
            actionEnd: {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        ) {
            Text("Content")
        }
    }
}

private let longText = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."

private let longContent = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type 
specimen book. It has survived not only five centuries, but also the leap into 
electronic typesetting, remaining essentially unchanged. It was popularised in 
the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, 
and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
"""
