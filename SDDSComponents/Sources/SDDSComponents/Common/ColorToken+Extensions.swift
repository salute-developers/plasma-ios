import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public extension TypographyToken {
    static var semibold18: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 18,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold16: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 16,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold14: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 14,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold12: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 12,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold8: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 8,
            lineHeight: 8,
            kerning: 0
        )
    }
    
    static var undefined: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 15,
            lineHeight: 22,
            kerning: 0
        )
    }
}

public extension ColorToken {
    static var blackTitleColor: ColorToken {
        .init(
            darkColor: .white,
            lightColor: .black
        )
    }
    
    static var clearColor: ColorToken {
        Color.clear.token
    }
    
    static var titleColor: ColorToken {
        .init(
            darkColor: .black,
            lightColor: .white
        )
    }
    
    static var greenColor: ColorToken {
        Color.green.token
    }
    
    static var subtitleColor: ColorToken {
        Color.white.opacity(0.3).token
    }
    
    static var backgroundColor: ColorToken {
        .init(
            darkColor: Color(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, opacity: 1.0),
            lightColor: Color(red: 8.0/255.0, green: 8.0/255.0, blue: 8.0/255.0, opacity: 1.0)
        )
    }
}

public extension ShapeToken {
    static var `default`: ShapeToken {
        .default
    }
}

public extension ColorToken {
    func withOpacity(_ opacity: Double) -> ColorToken {
        return ColorToken(
            darkColor: self.darkColor.opacity(opacity),
            lightColor: self.lightColor.opacity(opacity)
        )
    }
}

public extension Color {
    var token: ColorToken {
        ColorToken(darkColor: self, lightColor: self)
    }
}

public extension ColorToken {
    var inverted: ColorToken {
        ColorToken(darkColor: lightColor, lightColor: darkColor)
    }
}
