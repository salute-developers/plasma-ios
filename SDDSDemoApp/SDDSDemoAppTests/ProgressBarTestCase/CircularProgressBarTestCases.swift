//
//  CircularProgressBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [CircularProgressBar]
 */

struct CircularProgressXxlDefault: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.xxl.default.appearance
        )
    }
}

struct CircularProgressXlSecondary: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.xl.secondary.appearance
        )
    }
}

struct CircularProgressLAccent: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.l.accent.appearance
        )
    }
}

struct CircularProgressMGradient: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 1,
            hasTrack: true,
            appearance: CircularProgressBar.m.gradient.appearance
        )
    }
}

struct CircularProgressSInfo: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.s.info.appearance
        )
    }
}

struct CircularProgressXsPositive: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.xs.positive.appearance
        )
    }
}

struct CircularProgressXxsWarning: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: CircularProgressBar.xxs.warning.appearance
        )
    }
}

struct CircularProgressXxlNegativeNoTrack: View {
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: false,
            appearance: CircularProgressBar.xxl.negative.appearance
        )
    }
}
