import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

enum SolidColorStyle: String, CaseIterable {
    case black = "Black"
    case green = "Green"
    case lightGray = "LightGray"
    case orange = "Orange"
    case red = "Red"
    case darkGray = "DarkGray"
    case white = "White"
    case transparent = "Transparent"
}

extension SolidColorStyle {
    var primaryTextColor: Color {
        switch self {
        case .black, .green, .darkGray, .red, .orange:
            Color("textPrimaryLight")
        case .transparent, .lightGray, .white:
            Color("textPrimaryDark")
        }
    }
    
    var secondaryTextColor: Color {
        switch self {
        case .black, .green, .darkGray, .red, .orange:
            Color("textSecondaryLight")
        case .transparent, .lightGray, .white:
            Color("textSecondaryDark")
        }
    }
    
    var spinnerColor: Color {
        switch self {
        case .black, .green, .darkGray, .red, .orange:
            Color("textPrimaryLight")
        case .transparent, .lightGray, .white:
            Color("textPrimaryDark")
        }
    }
}

extension SolidColorStyle {
    var suiColor: Color {
        switch self {
        case .black:
            return Color("black")
        case .green:
            return Color("green")
        case .lightGray:
            return Color("lightGray")
        case .orange:
            return Color("orange")
        case .red:
            return Color("red")
        case .darkGray:
            return Color("darkGray")
        case .white:
            return Color("white")
        case .transparent:
            return .clear
        }
    }
}

extension Color {
    var equalToken: ColorToken {
        ColorToken(darkColor: self, lightColor: self)
    }
}
