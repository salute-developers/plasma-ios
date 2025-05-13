//
//  ProgressBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.05.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [ProgressBar]
 */

struct ProgressBarDefault: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: ProgressBar.default.default.appearance
        )
    }
}

struct ProgressBarSecondary: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: ProgressBar.default.secondary.appearance
        )
    }
}

struct ProgressBarWarning: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: ProgressBar.default.warning.appearance
        )
    }
}

struct ProgressBarPositive: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: ProgressBar.default.positive.appearance
        )
    }
}

struct ProgressBarNegative: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.99),
            isEnabled: true,
            appearance: ProgressBar.default.negative.appearance
        )
    }
}

struct ProgressBarGradient: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: ProgressBar.default.gradient.appearance
        )
    }
}

struct ProgressBarDefaultValueOne: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.01),
            isEnabled: true,
            appearance: ProgressBar.default.default.appearance
        )
    }
}

struct ProgressBarAccent: View {
    var body: some View {
        SDDSProgressView(
            progress: .constant(1),
            isEnabled: true,
            appearance: ProgressBar.default.accent.appearance
        )
    }
}
