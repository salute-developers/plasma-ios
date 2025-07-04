//
//  ListTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 04.07.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [List]
 */

/**
 PLASMA-T2061
 */
struct ListNormalSizeXlHasDisclosure: View {
    var body: some View {
        SDDSList(
            items: (1...3).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: { Image(systemName: "chevron.right") }
                )
            },
            appearance: ListNormal.xl.appearance
        )
    }
}

/**
 PLASMA-T2062
 */
struct ListNormalSizeL: View {
    var body: some View {
        SDDSList(
            items: (1...3).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: {},
                    rightContentEnabled: false
                )
            },
            appearance: ListNormal.l.appearance
        )
    }
}

/**
 PLASMA-T2063
 */
struct ListNormalSizeM: View {
    var body: some View {
        SDDSList(
            items: (1...3).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: {},
                    rightContentEnabled: false
                )
            },
            appearance: ListNormal.m.appearance
        )
    }
}

/**
 PLASMA-T2064
 */
struct ListNormalSizeS: View {
    var body: some View {
        SDDSList(
            items: (1...3).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: {},
                    rightContentEnabled: false
                )
            },
            appearance: ListNormal.s.appearance
        )
    }
}

/**
 PLASMA-T2065
 */
struct ListNormalSizeXsAmountTwenty: View {
    var body: some View {
        SDDSList(
            items: (1...20).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: {},
                    rightContentEnabled: false
                )
            },
            appearance: ListNormal.xs.appearance
        )
    }
}

/**
 PLASMA-T2067
 */
struct ListTightSizeXsHasDisclosure: View {
    var body: some View {
        SDDSList(
            items: (1...3).map { index in
                SDDSListItem(
                    title: "Title \(index)",
                    rightContent: { Image(systemName: "chevron.right") }
                )
            },
            appearance: ListTight.xs.appearance
        )
    }
}
