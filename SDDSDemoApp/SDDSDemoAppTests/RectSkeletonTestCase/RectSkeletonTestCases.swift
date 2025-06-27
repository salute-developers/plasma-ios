//
//  RectSkeletonTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

import SDDSServTheme
import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

struct RectSkeletonTestCase: View {
    var body: some View {
        SDDSRectSkeleton(
            appearance: SkeletonAppearance(
                shape: CornerRadiusDrawer(cornerRadius: 8),
                gradient: .surfaceDefaultSkeletonGradient,
                duration: 2000
            )
        )
        .frame(width: 200, height: 200)
    }
}
