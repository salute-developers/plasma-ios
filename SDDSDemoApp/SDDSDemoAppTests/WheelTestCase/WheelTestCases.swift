//
//  WheelTestCases.swift
//  SDDSDemoApp
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Wheel]
 */

private let wheelData: [WheelData] = [
    WheelData(items: ["01", "02", "03", "04", "05"], description: "День"),
    WheelData(items: ["Январь", "Февраль", "Март", "Апрель", "Май"], description: "Месяц"),
    WheelData(items: ["2024", "2025", "2026", "2027", "2028"], description: "Год")
]

struct WheelH4: View {
    var appearance: WheelAppearance
    @State private var selection: [Int] = [2, 2, 2]

    var body: some View {
        SDDSWheel(
            wheels: wheelData,
            selection: $selection,
            wheelCount: 3,
            visibleItemsCount: 5
        )
        .wheelAppearance(appearance)
    }
}

struct WheelH4CenterAlign: View {
    var appearance: WheelAppearance
    @State private var selection: [Int] = [2, 2, 2]

    var body: some View {
        SDDSWheel(
            wheels: wheelData,
            selection: $selection,
            wheelCount: 3,
            visibleItemsCount: 5
        )
        .wheelAppearance(appearance)
    }
}

struct WheelH1: View {
    var appearance: WheelAppearance
    @State private var selection: [Int] = [2]

    var body: some View {
        SDDSWheel(
            wheels: [WheelData(items: ["01", "02", "03", "04", "05"], description: "День")],
            selection: $selection,
            wheelCount: 1,
            visibleItemsCount: 5
        )
        .wheelAppearance(appearance)
    }
}
