//
//  CardTestCases.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 24.06.2025.
//

import SDDSComponents
import UIKit
import SwiftUI
import SDDSIcons

/**
Тест-кейсы для компонента [Card]
 */

struct CardLHorizontal: View {
    var apperance: CardAppearance
    
    var body: some View {
        SDDSCard(
            appearance: apperance
        ) {
            horizontalView
        }
        .padding()
    }
}

struct CardMVertical: View {
    var appearance: CardAppearance
    
    var body: some View {
        SDDSCard(
            appearance: appearance
        ) {
            verticalView
        }
        .padding()
    }
}

struct CardSHorizontal: View {
    var appearance: CardAppearance
    
    var body: some View {
        SDDSCard(
            appearance: appearance
        ) {
            horizontalView
        }
        .padding()
    }
}

struct CardLClearVertical: View {
    var appearance: CardAppearance
    
    var body: some View {
        SDDSCard(
            appearance: appearance
        ) {
            verticalView
        }
        .padding()
    }
}

struct CardMClearHorizontal: View {
    var appearance: CardAppearance
    
    var body: some View {
        SDDSCard(appearance: appearance) {
            verticalView
        }
        .padding()
    }
}

struct CardSClearVertical: View {
    var appearance: CardAppearance
    
    var body: some View {
        SDDSCard(appearance: appearance) {
            verticalView
        }
        .padding()
    }
}

private var horizontalView: some View {
    HStack(spacing: 0) {
        cardText
        cardContent
    }
}

private var verticalView: some View {
    VStack(spacing: 0) {
        cardText
        cardContent
    }
}

private var cardText: some View {
    Text("Card text")
        .frame(width: cardSize.width, height: cardSize.height)
}

private var cardContent: some View {
    SDDSCardContent(shapeContent: cardContentShape, backgroundColor: Color(.systemGray6)) {
        VStack(spacing: 8) {
            Image(systemName: "apple.logo")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
                .frame(width: imageSize.width, height: imageSize.height)
        }
        .frame(width: cardSize.width, height: cardSize.height)
    }
}

private var cardSize: CGSize {
    .init(width: 120, height: 120)
}

private var imageSize: CGSize {
    .init(width: 64, height: 64)
}

private var cardContentShape: ShapeContent {
    let cornerRadiusDrawer = CornerRadiusDrawer(cornerRadius: 8)
    return ShapeContent(pathDrawer: cornerRadiusDrawer)
}
