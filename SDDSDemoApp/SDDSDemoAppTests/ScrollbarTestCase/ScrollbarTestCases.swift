//
//  ScrollbarTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 14.08.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
 PLASMA-T2124
 */
struct ScrollbarSizeMHasTrackHover: View {
    var appearance: ScrollbarAppearance
    
    var body: some View {
        SDDSScrollbar(
            appearance: appearance,
            hasTrack: true,
            hoverExpand: true,
            thumbOffset: 0.25,
            thumbHeight: 40,
            trackHeight: 200,
            scrollBarPaddingBottom: 10,
            scrollBarPaddingTop: 10
        )
    }
}

/**
 PLASMA-T2125
 */
struct ScrollbarSizeSHoverExpand: View {
    var appearance: ScrollbarAppearance
    
    var body: some View {
        SDDSScrollbar(
            appearance: appearance,
            hasTrack: false,
            hoverExpand: true,
            thumbOffset: 0.25,
            thumbHeight: 40,
            trackHeight: 200,
            scrollBarPaddingBottom: 10,
            scrollBarPaddingTop: 10
        )
    }
}

/**
 PLASMA-T2126
 */
struct ScrollbarScrollDown: View {
    var appearance: ScrollbarAppearance
    
    var body: some View {
        SDDSScrollbar(
            appearance: appearance,
            hasTrack: true,
            hoverExpand: true,
            thumbOffset: 150,
            thumbHeight: 40,
            trackHeight: 200,
            scrollBarPaddingBottom: 10,
            scrollBarPaddingTop: 10
        )
    }
}
