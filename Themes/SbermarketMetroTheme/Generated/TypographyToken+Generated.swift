import Foundation
@_exported import SDDSThemeCore

public extension AdaptiveTypographyToken {
    
    static var bodyLBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 17,
                lineHeight: 24,
                kerning: 0.02
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 18,
                lineHeight: 24,
                kerning: 0.02
            )
        )
    }
    
    static var bodyMBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 15,
                lineHeight: 20,
                kerning: 0.02
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 16,
                lineHeight: 20,
                kerning: 0.02
            )
        )
    }
    
    static var bodySBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 13,
                lineHeight: 18,
                kerning: 0.02
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 14,
                lineHeight: 18,
                kerning: 0.02
            )
        )
    }
    
    static var bodyXsBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 12,
                lineHeight: 16,
                kerning: 0.02
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 12,
                lineHeight: 16,
                kerning: 0.02
            )
        )
    }
    
    static var bodyXxsBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 10,
                lineHeight: 12,
                kerning: 0.02
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 10,
                lineHeight: 12,
                kerning: 0.02
            )
        )
    }
    
    static var textLBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 18,
                lineHeight: 28,
                kerning: 0
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 24,
                lineHeight: 32,
                kerning: 0
            )
        )
    }
    
    static var textMBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 16,
                lineHeight: 24,
                kerning: 0
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 18,
                lineHeight: 26,
                kerning: 0
            )
        )
    }
    
    static var textSBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 14,
                lineHeight: 20,
                kerning: 0
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 14,
                lineHeight: 20,
                kerning: 0
            )
        )
    }
    
    static var textXsBold: Self {
        Self(
            small: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 12,
                lineHeight: 16,
                kerning: 0
            ),
            medium: TypographyToken(
                fontName: "",
                weight: .,
                style: .,
                size: ,
                lineHeight: ,
                kerning: 
            ),
            large: TypographyToken(
                fontName: "SBSansDisplay-Semibold",
                weight: .light,
                style: .normal,
                size: 12,
                lineHeight: 16,
                kerning: 0
            )
        )
    }
    
    
    static var tokens: [Self] = [
        bodyLBold,
        bodyMBold,
        bodySBold,
        bodyXsBold,
        bodyXxsBold,
        textLBold,
        textMBold,
        textSBold,
        textXsBold,
    ]
}
