//
//  IndicatorTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Indicator]
 */

struct IndicatorLDefault: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.l.default.appearance
        )
    }
}

struct IndicatorMAccent: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.m.accent.appearance
        )
    }
}

struct IndicatorSInactove: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.s.inactive.appearance
        )
    }
}

struct IndicatorLPositive: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.l.positive.appearance
        )
    }
}

struct IndicatorLWarning: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.l.warning.appearance
        )
    }
}

struct IndicatorLNegative: View {
    var body: some View {
        SDDSIndicator(
            appearance: Indicator.l.negative.appearance
        )
    }
}
