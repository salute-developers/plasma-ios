//
//  CounterTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Counter]
 */

struct CounterSizeLDefault: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.l.default.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeMAccent: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.m.accent.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeSPositive: View {
    var body: some View {
        SDDSCounter(
            text: "999999999999999",
            appearance: Counter.s.positive.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeXsWarning: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.xs.warning.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeXxsNegative: View {
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: Counter.xxs.negative.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeLWhite: View {
    var body: some View {
        SDDSCounter(
            text: "1",
            appearance: Counter.l.white.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}
