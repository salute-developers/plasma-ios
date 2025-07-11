//
//  RectSkeletonTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 27.06.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

struct RectSkeletonTestCase: View {
    var appearance: SkeletonAppearance
    
    var body: some View {
        SDDSRectSkeleton(appearance: appearance)
        .frame(width: 200, height: 200)
    }
}
