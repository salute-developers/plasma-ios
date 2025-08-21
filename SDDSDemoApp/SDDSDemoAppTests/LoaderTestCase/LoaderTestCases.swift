//
//  LoaderTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.08.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 Тест-кейсы для компонента [Loader]
 */

struct LoaderCaseSpinner : View {
    var appearance: LoaderAppearance
    
    var body: some View {
        SDDSLoader(appearance: appearance)
        .environment(
            \.spinnerData,
             SDDSSpinnerData(
                isAnimating: false,
                appearance: appearance.spinnerAppearance
             )
        )
    }
}

struct LoaderCaseCircularProgress : View {
    var appearance: LoaderAppearance
    
    var body: some View {
        SDDSLoader(appearance: appearance)
        .environment(
            \.circularProgressBarData,
             SDDSCircularProgressBarData(
                progress: 0.5,
                suffix: "50%",
                hasTrack: true,
                content: nil
             )
        )
    }
}
