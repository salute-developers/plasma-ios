//
//  SpinnerTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 21.07.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

struct SpinnerTestCase: View {
    var appearance: SpinnerAppearance
    
    var body: some View {
        SDDSSpinner(
            isAnimating: true,
            appearance: appearance
        )
    }
}
