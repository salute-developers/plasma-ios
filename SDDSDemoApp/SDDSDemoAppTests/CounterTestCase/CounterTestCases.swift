//
//  CounterTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Counter]
 */

struct CounterSizeLDefault: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeMAccent: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeSPositive: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "999999999999999",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeXsWarning: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeXxsNegative: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "123",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}

struct CounterSizeLWhite: View {
    var appearance: CounterAppearance
    
    var body: some View {
        SDDSCounter(
            text: "1",
            appearance: appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}
