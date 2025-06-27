//
//  TextSkeletonTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

struct TextSkeletonTestNoTextRandom: View {
    var body: some View {
        SDDSTextSkeleton(
            appearance: SkeletonAppearance(
                shape: CornerRadiusDrawer(cornerRadius: 4),
                gradient: .surfaceDefaultSkeletonGradient,
                duration: 2000
            ),
            lineCount: 3,
            textTypography: .semibold14,
            lineWidthProvider: FixedWidthTextSkeleton(),
            lineSpacing: 2
        )
    }
}

struct TextSkeletonTestFullWidth: View {
    var body: some View {
        SDDSTextSkeleton(
            appearance: SkeletonAppearance(
                shape: CornerRadiusDrawer(cornerRadius: 4),
                gradient: .surfaceDefaultSkeletonGradient,
                duration: 2000
            ),
            lineCount: 10,
            textTypography: .semibold14,
            lineWidthProvider: FullWidthLineProvider(),
            lineSpacing: 2
        )
    }
}

struct FixedWidthTextSkeleton: SkeletonLineWidthProvider {
    func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat {
        if lineIndex == lineCount - 1 {
            return 0.5
        } else {
            return 0.9
        }
    }
}
