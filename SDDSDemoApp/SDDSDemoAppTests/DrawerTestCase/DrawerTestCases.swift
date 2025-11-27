//
//  DrawerTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.11.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Drawer]
 */

/**
 PLASMA-T2236
 */
struct DrawerCloseLeftHasHeader: View {
    let appearance: DrawerAppearance
    var listAppearance: ListAppearance
    
    var body: some View {
        ZStack {
            SDDSDrawer(
                appearance: appearance,
                backgroundColor: Color(.systemGray4),
                onClose: {},
                closePlacement: .left,
                hasHeader: true,
                hasFooter: false,
                header: {
                    Text("Header")
                },
                content: {
                    ListForDrawer(listAppearance: listAppearance)
                },
                footer: {}
            )
        }
    }
}

/**
 PLASMA-T2237
 */
struct DrawerCloseRightHasFooter: View {
    let appearance: DrawerAppearance
    var listAppearance: ListAppearance
    let hasOverlay: Bool
    let overlayColor: Color
    
    var body: some View {
        ZStack {
            if hasOverlay {
                overlayColor
                    .ignoresSafeArea()
                    .transition(.opacity)
            }
            SDDSDrawer(
                appearance: appearance,
                backgroundColor: Color(.systemGray4),
                onClose: {},
                closePlacement: .right,
                hasHeader: false,
                hasFooter: true,
                header: {},
                content: {
                    ListForDrawer(listAppearance: listAppearance)
                },
                footer: {
                    Text("Footer")
                }
            )
        }
    }
}

/**
 PLASMA-T2238
 */
struct DrawerCloseNoneHasHeaderFooter: View {
    let appearance: DrawerAppearance
    var listAppearance: ListAppearance
    
    var body: some View {
        ZStack {
            SDDSDrawer(
                appearance: appearance,
                backgroundColor: Color(.systemGray4),
                onClose: nil,
                closePlacement: .left,
                hasHeader: true,
                hasFooter: true,
                header: {
                    Text("Header")
                },
                content: {
                    ListForDrawer(listAppearance: listAppearance)
                },
                footer: {
                    Text("Footer")
                }
            )
        }
    }
}

/**
 PLASMA-T2239
 */
struct DrawerCloseIconRightNoHeaderFooter: View {
    let appearance: DrawerAppearance
    var listAppearance: ListAppearance
    
    var body: some View {
        ZStack {
            SDDSDrawer(
                appearance: appearance,
                backgroundColor: Color(.systemGray4),
                onClose: {},
                closePlacement: .right,
                hasHeader: false,
                hasFooter: false,
                header: {},
                content: {
                    ListForDrawer(listAppearance: listAppearance)
                },
                footer: {}
            )
        }
    }
}

/**
 PLASMA-T2239
 */
struct DrawerHasPeakOffSet: View {
    let appearance: DrawerAppearance
    var listAppearance: ListAppearance
    let peakOffSet: CGFloat
    
    var body: some View {
        ZStack {
            SDDSDrawer(
                appearance: appearance,
                backgroundColor: Color(.systemGray4),
                onClose: {},
                closePlacement: .left,
                hasHeader: false,
                hasFooter: false,
                header: {},
                content: {
                    ListForDrawer(listAppearance: listAppearance)
                },
                footer: {}
            )
            .offset(x: peakOffSet)
        }
    }
}

internal struct ListForDrawer: View {
    var listAppearance: ListAppearance
    
    var body: some View {
        SDDSList(
            items: (1...6).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: { Image(systemName: "chevron.right") },
                    rightContentEnabled: true
                )
            },
            appearance: listAppearance
        )
    }
}
