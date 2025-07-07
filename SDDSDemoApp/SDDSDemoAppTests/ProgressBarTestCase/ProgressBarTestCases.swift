//
//  ProgressBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 13.05.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [ProgressBar]
 */

struct ProgressBarDefault: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarSecondary: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarWarning: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.25),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarPositive: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarNegative: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.99),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarGradient: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarDefaultValueOne: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.01),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarAccent: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(1),
            isEnabled: true,
            appearance: appearance
        )
    }
}

struct ProgressBarInfo: View {
    var appearance: ProgressBarAppearance
    
    var body: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: appearance
        )
    }
}
