//
//  CircularProgressBarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 29.05.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [CircularProgressBar]
 */

struct CircularProgressXxlDefault: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressXlSecondary: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressLAccent: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressMGradient: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 1,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressSInfo: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressXsPositive: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressXxsWarning: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: true,
            appearance: appearance
        )
    }
}

struct CircularProgressXxlNegativeNoTrack: View {
    var appearance: CircularProgressBarAppearance
    
    var body: some View {
        SDDSCircularProgressBar(
            progress: 0.5,
            hasTrack: false,
            appearance: appearance
        )
    }
}
