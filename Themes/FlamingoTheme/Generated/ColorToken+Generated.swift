import SwiftUI
import UIKit
@_exported import SDDSThemeCore

public extension ColorToken {
    
    static var backgroundDarkPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000FF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var backgroundDarkSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808")),
            lightColor: Color(UIColor(hex: "#080808"))
        )
    }
    
    static var backgroundDarkTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#171717")),
            lightColor: Color(UIColor(hex: "#171717"))
        )
    }
    
    static var backgroundDefaultPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808")),
            lightColor: Color(UIColor(hex: "#F9F9F9"))
        )
    }
    
    static var backgroundDefaultSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var backgroundDefaultTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#171717")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var backgroundInversePrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var backgroundInverseSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#080808"))
        )
    }
    
    static var backgroundInverseTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#171717"))
        )
    }
    
    static var backgroundLightPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var backgroundLightSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var backgroundLightTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#199AF0")),
            lightColor: Color(UIColor(hex: "#0B7ECB"))
        )
    }
    
    static var outlineDefaultInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0E8ADDFF")),
            lightColor: Color(UIColor(hex: "#0966A5FF"))
        )
    }
    
    static var outlineDefaultInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#66BCF5FF")),
            lightColor: Color(UIColor(hex: "#0D96F2FF"))
        )
    }
    
    static var outlineDefaultInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D3B59")),
            lightColor: Color(UIColor(hex: "#CFECFF"))
        )
    }
    
    static var outlineDefaultInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#114C74FF")),
            lightColor: Color(UIColor(hex: "#A8DCFFFF"))
        )
    }
    
    static var outlineDefaultInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#145E8FFF")),
            lightColor: Color(UIColor(hex: "#FAFDFFFF"))
        )
    }
    
    static var outlineDefaultInfoTransparent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#528EFF29")),
            lightColor: Color(UIColor(hex: "#0C72B614"))
        )
    }
    
    static var outlineDefaultInfoTransparentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#528EFF31")),
            lightColor: Color(UIColor(hex: "#0C72B618"))
        )
    }
    
    static var outlineDefaultInfoTransparentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#528EFFFF")),
            lightColor: Color(UIColor(hex: "#0C72B6FF"))
        )
    }
    
    static var outlineDefaultNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D51")),
            lightColor: Color(UIColor(hex: "#F31B31"))
        )
    }
    
    static var outlineDefaultNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF1F35FF")),
            lightColor: Color(UIColor(hex: "#DA0B20FF"))
        )
    }
    
    static var outlineDefaultNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF5C6CFF")),
            lightColor: Color(UIColor(hex: "#F54254FF"))
        )
    }
    
    static var outlineDefaultNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#6B1019")),
            lightColor: Color(UIColor(hex: "#FFE0E3"))
        )
    }
    
    static var outlineDefaultNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#85141FFF")),
            lightColor: Color(UIColor(hex: "#FFB8BFFF"))
        )
    }
    
    static var outlineDefaultNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#A01825FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultNegativeTransparent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D5129")),
            lightColor: Color(UIColor(hex: "#E3122714"))
        )
    }
    
    static var outlineDefaultNegativeTransparentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D5131")),
            lightColor: Color(UIColor(hex: "#E2122718"))
        )
    }
    
    static var outlineDefaultNegativeTransparentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D51FF")),
            lightColor: Color(UIColor(hex: "#E21227FF"))
        )
    }
    
    static var outlineDefaultPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var outlineDefaultPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1F9835FF")),
            lightColor: Color(UIColor(hex: "#0C6A1BFF"))
        )
    }
    
    static var outlineDefaultPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#2ACB47FF")),
            lightColor: Color(UIColor(hex: "#14B32EFF"))
        )
    }
    
    static var outlineDefaultPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#084008")),
            lightColor: Color(UIColor(hex: "#94FF94"))
        )
    }
    
    static var outlineDefaultPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0B5B0BFF")),
            lightColor: Color(UIColor(hex: "#6BFF6BFF"))
        )
    }
    
    static var outlineDefaultPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F760FFF")),
            lightColor: Color(UIColor(hex: "#BDFFBDFF"))
        )
    }
    
    static var outlineDefaultPositiveTransparent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E29")),
            lightColor: Color(UIColor(hex: "#1A9E3214"))
        )
    }
    
    static var outlineDefaultPositiveTransparentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E31")),
            lightColor: Color(UIColor(hex: "#1A9E3218"))
        )
    }
    
    static var outlineDefaultPositiveTransparentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23EFF")),
            lightColor: Color(UIColor(hex: "#1A9E32FF"))
        )
    }
    
    static var outlineDefaultPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4E4E4E")),
            lightColor: Color(UIColor(hex: "#DDDDDD"))
        )
    }
    
    static var outlineDefaultPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#8C8C8CFF")),
            lightColor: Color(UIColor(hex: "#B3B3B3FF"))
        )
    }
    
    static var outlineDefaultPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultRating: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD83D")),
            lightColor: Color(UIColor(hex: "#DCB104"))
        )
    }
    
    static var outlineDefaultRatingActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD21FFF")),
            lightColor: Color(UIColor(hex: "#B49104FF"))
        )
    }
    
    static var outlineDefaultRatingHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFDE5CFF")),
            lightColor: Color(UIColor(hex: "#FACB0FFF"))
        )
    }
    
    static var outlineDefaultRatingMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#403507")),
            lightColor: Color(UIColor(hex: "#FFE88A"))
        )
    }
    
    static var outlineDefaultRatingMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#5C4B0AFF")),
            lightColor: Color(UIColor(hex: "#FFDF61FF"))
        )
    }
    
    static var outlineDefaultRatingMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#77620DFF")),
            lightColor: Color(UIColor(hex: "#FFF0B3FF"))
        )
    }
    
    static var outlineDefaultRatingTransparent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD83D29")),
            lightColor: Color(UIColor(hex: "#DCB10414"))
        )
    }
    
    static var outlineDefaultRatingTransparentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD83D31")),
            lightColor: Color(UIColor(hex: "#DCB10418"))
        )
    }
    
    static var outlineDefaultRatingTransparentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD83DFF")),
            lightColor: Color(UIColor(hex: "#DCB104FF"))
        )
    }
    
    static var outlineDefaultSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#707070")),
            lightColor: Color(UIColor(hex: "#B3B3B3"))
        )
    }
    
    static var outlineDefaultSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#737373FF")),
            lightColor: Color(UIColor(hex: "#8F8F8FFF"))
        )
    }
    
    static var outlineDefaultSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#949494")),
            lightColor: Color(UIColor(hex: "#707070"))
        )
    }
    
    static var outlineDefaultTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#575757FF")),
            lightColor: Color(UIColor(hex: "#595959FF"))
        )
    }
    
    static var outlineDefaultTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineDefaultTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineDefaultTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineDefaultWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF7024")),
            lightColor: Color(UIColor(hex: "#E85702"))
        )
    }
    
    static var outlineDefaultWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF5D05FF")),
            lightColor: Color(UIColor(hex: "#C04802FF"))
        )
    }
    
    static var outlineDefaultWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF8442FF")),
            lightColor: Color(UIColor(hex: "#FD6B17FF"))
        )
    }
    
    static var outlineDefaultWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#5C2709")),
            lightColor: Color(UIColor(hex: "#FEE2D2"))
        )
    }
    
    static var outlineDefaultWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#79340CFF")),
            lightColor: Color(UIColor(hex: "#FDC9AAFF"))
        )
    }
    
    static var outlineDefaultWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#95400FFF")),
            lightColor: Color(UIColor(hex: "#FFFCFAFF"))
        )
    }
    
    static var outlineDefaultWarningTransparent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF702429")),
            lightColor: Color(UIColor(hex: "#D14D0014"))
        )
    }
    
    static var outlineDefaultWarningTransparentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF702431")),
            lightColor: Color(UIColor(hex: "#D14D0018"))
        )
    }
    
    static var outlineDefaultWarningTransparentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF7024FF")),
            lightColor: Color(UIColor(hex: "#D14D00FF"))
        )
    }
    
    static var outlineInverseAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInversePositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInversePositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInversePositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInversePositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInversePositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInversePositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInversePrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInversePrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInversePrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInversePromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInversePromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInversePromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInversePromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInversePromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInversePromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineInverseWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineInverseWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineInverseWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnDarkWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnDarkWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnDarkWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var outlineOnLightWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var outlineOnLightWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var outlineOnLightWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var overlayDefaultBlur: Self {
        Self(
            darkColor: Color(UIColor(hex: "#08080833")),
            lightColor: Color(UIColor(hex: "#F9F9F933"))
        )
    }
    
    static var overlayDefaultHard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808F5")),
            lightColor: Color(UIColor(hex: "#F9F9F9F5"))
        )
    }
    
    static var overlayDefaultSoft: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808088F")),
            lightColor: Color(UIColor(hex: "#F9F9F98F"))
        )
    }
    
    static var overlayInverseBlur: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var overlayInverseHard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000E6")),
            lightColor: Color(UIColor(hex: "#000000E6"))
        )
    }
    
    static var overlayInverseSoft: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0000008F")),
            lightColor: Color(UIColor(hex: "#0000008F"))
        )
    }
    
    static var overlayOnDarkBlur: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var overlayOnDarkHard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000E6")),
            lightColor: Color(UIColor(hex: "#000000E6"))
        )
    }
    
    static var overlayOnDarkSoft: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0000008F")),
            lightColor: Color(UIColor(hex: "#0000008F"))
        )
    }
    
    static var overlayOnLightBlur: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var overlayOnLightHard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000E6")),
            lightColor: Color(UIColor(hex: "#000000E6"))
        )
    }
    
    static var overlayOnLightSoft: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0000008F")),
            lightColor: Color(UIColor(hex: "#0000008F"))
        )
    }
    
    static var surfaceDefaultAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var surfaceDefaultAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#18952FFF")),
            lightColor: Color(UIColor(hex: "#178C2CFF"))
        )
    }
    
    static var surfaceDefaultAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1DAF37FF")),
            lightColor: Color(UIColor(hex: "#1EB83AFF"))
        )
    }
    
    static var surfaceDefaultAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceDefaultClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceDefaultClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceDefaultInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#118CDF")),
            lightColor: Color(UIColor(hex: "#0C72B6"))
        )
    }
    
    static var surfaceDefaultInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1086D5FF")),
            lightColor: Color(UIColor(hex: "#0A66A3FF"))
        )
    }
    
    static var surfaceDefaultInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1798EEFF")),
            lightColor: Color(UIColor(hex: "#0D7EC9FF"))
        )
    }
    
    static var surfaceDefaultInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0C283B")),
            lightColor: Color(UIColor(hex: "#EDF8FF"))
        )
    }
    
    static var surfaceDefaultInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0A2333FF")),
            lightColor: Color(UIColor(hex: "#E0F3FFFF"))
        )
    }
    
    static var surfaceDefaultInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#10344CFF")),
            lightColor: Color(UIColor(hex: "#F5FBFFFF"))
        )
    }
    
    static var surfaceDefaultNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E")),
            lightColor: Color(UIColor(hex: "#E31227"))
        )
    }
    
    static var surfaceDefaultNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF1F35FF")),
            lightColor: Color(UIColor(hex: "#D01124FF"))
        )
    }
    
    static var surfaceDefaultNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF475AFF")),
            lightColor: Color(UIColor(hex: "#ED1D31FF"))
        )
    }
    
    static var surfaceDefaultNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4A0D13")),
            lightColor: Color(UIColor(hex: "#FFF5F6"))
        )
    }
    
    static var surfaceDefaultNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#410B11FF")),
            lightColor: Color(UIColor(hex: "#FFEBEDFF"))
        )
    }
    
    static var surfaceDefaultNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#5B1018FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var surfaceDefaultPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#18952FFF")),
            lightColor: Color(UIColor(hex: "#178C2CFF"))
        )
    }
    
    static var surfaceDefaultPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1DAF37FF")),
            lightColor: Color(UIColor(hex: "#1EB83AFF"))
        )
    }
    
    static var surfaceDefaultPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0A2B10")),
            lightColor: Color(UIColor(hex: "#E0FFE9"))
        )
    }
    
    static var surfaceDefaultPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#08210CFF")),
            lightColor: Color(UIColor(hex: "#D6FFE2FF"))
        )
    }
    
    static var surfaceDefaultPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0E3A16FF")),
            lightColor: Color(UIColor(hex: "#F5FFF8FF"))
        )
    }
    
    static var surfaceDefaultPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultRating: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD83D")),
            lightColor: Color(UIColor(hex: "#DCB104"))
        )
    }
    
    static var surfaceDefaultRatingActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFD633FF")),
            lightColor: Color(UIColor(hex: "#C8A104FF"))
        )
    }
    
    static var surfaceDefaultRatingHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFDE5CFF")),
            lightColor: Color(UIColor(hex: "#F0C105FF"))
        )
    }
    
    static var surfaceDefaultRatingMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#2B2408")),
            lightColor: Color(UIColor(hex: "#FFF7D6"))
        )
    }
    
    static var surfaceDefaultRatingMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#221D06FF")),
            lightColor: Color(UIColor(hex: "#FFF5CCFF"))
        )
    }
    
    static var surfaceDefaultRatingMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#3C320BFF")),
            lightColor: Color(UIColor(hex: "#FFFBEBFF"))
        )
    }
    
    static var surfaceDefaultSolidCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#F"))
        )
    }
    
    static var surfaceDefaultSolidCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#212121FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultSolidCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultSolidDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808")),
            lightColor: Color(UIColor(hex: "#F"))
        )
    }
    
    static var surfaceDefaultSolidDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#030303FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultSolidDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D0D0DFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#F5F5F5"))
        )
    }
    
    static var surfaceDefaultSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#212121FF")),
            lightColor: Color(UIColor(hex: "#F0F0F0FF"))
        )
    }
    
    static var surfaceDefaultSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#FAFAFAFF"))
        )
    }
    
    static var surfaceDefaultSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#363636")),
            lightColor: Color(UIColor(hex: "#ECECEC"))
        )
    }
    
    static var surfaceDefaultSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#E8E8E8FF"))
        )
    }
    
    static var surfaceDefaultSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#404040FF")),
            lightColor: Color(UIColor(hex: "#F7F7F7FF"))
        )
    }
    
    static var surfaceDefaultSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4E4E4E")),
            lightColor: Color(UIColor(hex: "#DDDDDD"))
        )
    }
    
    static var surfaceDefaultSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4A4A4AFF")),
            lightColor: Color(UIColor(hex: "#D4D4D4FF"))
        )
    }
    
    static var surfaceDefaultSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#595959FF")),
            lightColor: Color(UIColor(hex: "#EDEDEDFF"))
        )
    }
    
    static var surfaceDefaultTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.400][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var surfaceDefaultTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E0F")),
            lightColor: Color(UIColor(hex: "#108E2529"))
        )
    }
    
    static var surfaceDefaultTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E3D")),
            lightColor: Color(UIColor(hex: "#108E250A"))
        )
    }
    
    static var surfaceDefaultTransparentCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.06]"))
        )
    }
    
    static var surfaceDefaultTransparentCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "#0808081A"))
        )
    }
    
    static var surfaceDefaultTransparentCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF3D")),
            lightColor: Color(UIColor(hex: "#08080805"))
        )
    }
    
    static var surfaceDefaultTransparentDeep: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFA3")),
            lightColor: Color(UIColor(hex: "#000000A3"))
        )
    }
    
    static var surfaceDefaultTransparentDeepActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF94")),
            lightColor: Color(UIColor(hex: "#000000AD"))
        )
    }
    
    static var surfaceDefaultTransparentDeepHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFC2")),
            lightColor: Color(UIColor(hex: "#0000008F"))
        )
    }
    
    static var surfaceDefaultTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#199AF014")),
            lightColor: Color(UIColor(hex: "#0C72B60A"))
        )
    }
    
    static var surfaceDefaultTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#199AF00F")),
            lightColor: Color(UIColor(hex: "#0C72B60F"))
        )
    }
    
    static var surfaceDefaultTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#199AF024")),
            lightColor: Color(UIColor(hex: "#0C72B605"))
        )
    }
    
    static var surfaceDefaultTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D5114")),
            lightColor: Color(UIColor(hex: "#E3122708"))
        )
    }
    
    static var surfaceDefaultTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D510F")),
            lightColor: Color(UIColor(hex: "#E212270D"))
        )
    }
    
    static var surfaceDefaultTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF3D5124")),
            lightColor: Color(UIColor(hex: "#E2122703"))
        )
    }
    
    static var surfaceDefaultTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E3214")),
            lightColor: Color(UIColor(hex: "#1A9E320A"))
        )
    }
    
    static var surfaceDefaultTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E320F")),
            lightColor: Color(UIColor(hex: "#1A9E320F"))
        )
    }
    
    static var surfaceDefaultTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E3224")),
            lightColor: Color(UIColor(hex: "#1A9E3205"))
        )
    }
    
    static var surfaceDefaultTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.02]"))
        )
    }
    
    static var surfaceDefaultTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0A")),
            lightColor: Color(UIColor(hex: "#0808080A"))
        )
    }
    
    static var surfaceDefaultTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "#08080800"))
        )
    }
    
    static var surfaceDefaultTransparentPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultTransparentPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultTransparentPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceDefaultTransparentRating: Self {
        Self(
            darkColor: Color(UIColor(hex: "#B7920114")),
            lightColor: Color(UIColor(hex: "#8F72000A"))
        )
    }
    
    static var surfaceDefaultTransparentRatingActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#B792010F")),
            lightColor: Color(UIColor(hex: "#8F72000F"))
        )
    }
    
    static var surfaceDefaultTransparentRatingHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#B7920124")),
            lightColor: Color(UIColor(hex: "#8F720005"))
        )
    }
    
    static var surfaceDefaultTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.06]"))
        )
    }
    
    static var surfaceDefaultTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "#0808081A"))
        )
    }
    
    static var surfaceDefaultTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF3D")),
            lightColor: Color(UIColor(hex: "#08080805"))
        )
    }
    
    static var surfaceDefaultTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF33")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.12]"))
        )
    }
    
    static var surfaceDefaultTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF24")),
            lightColor: Color(UIColor(hex: "#08080829"))
        )
    }
    
    static var surfaceDefaultTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF52")),
            lightColor: Color(UIColor(hex: "#0808080A"))
        )
    }
    
    static var surfaceDefaultTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF702414")),
            lightColor: Color(UIColor(hex: "#D14D0008"))
        )
    }
    
    static var surfaceDefaultTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF70240F")),
            lightColor: Color(UIColor(hex: "#D14D000D"))
        )
    }
    
    static var surfaceDefaultTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF702424")),
            lightColor: Color(UIColor(hex: "#D14D0003"))
        )
    }
    
    static var surfaceDefaultWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05")),
            lightColor: Color(UIColor(hex: "#E85702"))
        )
    }
    
    static var surfaceDefaultWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F05B05FF")),
            lightColor: Color(UIColor(hex: "#D44F02FF"))
        )
    }
    
    static var surfaceDefaultWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FB7223FF")),
            lightColor: Color(UIColor(hex: "#FC5E03FF"))
        )
    }
    
    static var surfaceDefaultWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#3D1D0A")),
            lightColor: Color(UIColor(hex: "#FFF5F0"))
        )
    }
    
    static var surfaceDefaultWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#351909FF")),
            lightColor: Color(UIColor(hex: "#FFEEE5FF"))
        )
    }
    
    static var surfaceDefaultWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4F250DFF")),
            lightColor: Color(UIColor(hex: "#FFFCFAFF"))
        )
    }
    
    static var surfaceInverseAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#24B23E"))
        )
    }
    
    static var surfaceInverseAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F8523FF")),
            lightColor: Color(UIColor(hex: "#21A138FF"))
        )
    }
    
    static var surfaceInverseAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#12A12AFF")),
            lightColor: Color(UIColor(hex: "#28C344FF"))
        )
    }
    
    static var surfaceInverseAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceInverseClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceInverseClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceInverseInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B31")),
            lightColor: Color(UIColor(hex: "#FF293E"))
        )
    }
    
    static var surfaceInverseNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31228FF")),
            lightColor: Color(UIColor(hex: "#FF142CFF"))
        )
    }
    
    static var surfaceInverseNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F5384BFF")),
            lightColor: Color(UIColor(hex: "#FF5263FF"))
        )
    }
    
    static var surfaceInverseNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var surfaceInversePositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F8523FF")),
            lightColor: Color(UIColor(hex: "#178C2CFF"))
        )
    }
    
    static var surfaceInversePositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#12A12AFF")),
            lightColor: Color(UIColor(hex: "#1EB83AFF"))
        )
    }
    
    static var surfaceInversePositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInversePromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseSolidCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#F"))
        )
    }
    
    static var surfaceInverseSolidCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#212121FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseSolidCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseSolidDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#080808"))
        )
    }
    
    static var surfaceInverseSolidDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#030303FF"))
        )
    }
    
    static var surfaceInverseSolidDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#262626FF"))
        )
    }
    
    static var surfaceInverseSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F5F5F5")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var surfaceInverseSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F0F0F0FF")),
            lightColor: Color(UIColor(hex: "#1C1C1CFF"))
        )
    }
    
    static var surfaceInverseSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FAFAFAFF")),
            lightColor: Color(UIColor(hex: "#3B3B3BFF"))
        )
    }
    
    static var surfaceInverseSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ECECEC")),
            lightColor: Color(UIColor(hex: "#363636"))
        )
    }
    
    static var surfaceInverseSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E8E8E8FF")),
            lightColor: Color(UIColor(hex: "#2B2B2BFF"))
        )
    }
    
    static var surfaceInverseSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F7F7F7FF")),
            lightColor: Color(UIColor(hex: "#4A4A4AFF"))
        )
    }
    
    static var surfaceInverseSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4E4E4E")),
            lightColor: Color(UIColor(hex: "#DDDDDD"))
        )
    }
    
    static var surfaceInverseSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4A4A4AFF")),
            lightColor: Color(UIColor(hex: "#D4D4D4FF"))
        )
    }
    
    static var surfaceInverseSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#595959FF")),
            lightColor: Color(UIColor(hex: "#EDEDEDFF"))
        )
    }
    
    static var surfaceInverseTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.400][0.12]"))
        )
    }
    
    static var surfaceInverseTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E250F")),
            lightColor: Color(UIColor(hex: "#24B23E29"))
        )
    }
    
    static var surfaceInverseTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E253D")),
            lightColor: Color(UIColor(hex: "#24B23E0A"))
        )
    }
    
    static var surfaceInverseTransparentCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.06]")),
            lightColor: Color(UIColor(hex: "#FFFFFF1F"))
        )
    }
    
    static var surfaceInverseTransparentCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080A")),
            lightColor: Color(UIColor(hex: "#FFFFFF29"))
        )
    }
    
    static var surfaceInverseTransparentCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808081F")),
            lightColor: Color(UIColor(hex: "#FFFFFF0A"))
        )
    }
    
    static var surfaceInverseTransparentDeep: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000A3")),
            lightColor: Color(UIColor(hex: "#FFFFFFA3"))
        )
    }
    
    static var surfaceInverseTransparentDeepActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000094")),
            lightColor: Color(UIColor(hex: "#FFFFFFAD"))
        )
    }
    
    static var surfaceInverseTransparentDeepHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000C2")),
            lightColor: Color(UIColor(hex: "#FFFFFF8F"))
        )
    }
    
    static var surfaceInverseTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.500][0.12]"))
        )
    }
    
    static var surfaceInverseTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B310F")),
            lightColor: Color(UIColor(hex: "#FF293E29"))
        )
    }
    
    static var surfaceInverseTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B313D")),
            lightColor: Color(UIColor(hex: "#FF293E0A"))
        )
    }
    
    static var surfaceInverseTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.500][0.12]"))
        )
    }
    
    static var surfaceInverseTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E250F")),
            lightColor: Color(UIColor(hex: "#1A9E3229"))
        )
    }
    
    static var surfaceInverseTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E253D")),
            lightColor: Color(UIColor(hex: "#1A9E320A"))
        )
    }
    
    static var surfaceInverseTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.02]")),
            lightColor: Color(UIColor(hex: "#FFFFFF0F"))
        )
    }
    
    static var surfaceInverseTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#08080800")),
            lightColor: Color(UIColor(hex: "#FFFFFF1A"))
        )
    }
    
    static var surfaceInverseTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080F")),
            lightColor: Color(UIColor(hex: "#FFFFFF05"))
        )
    }
    
    static var surfaceInverseTransparentPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.06]")),
            lightColor: Color(UIColor(hex: "#FFFFFF1F"))
        )
    }
    
    static var surfaceInverseTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080A")),
            lightColor: Color(UIColor(hex: "#FFFFFF29"))
        )
    }
    
    static var surfaceInverseTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808081F")),
            lightColor: Color(UIColor(hex: "#FFFFFF0A"))
        )
    }
    
    static var surfaceInverseTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.12]")),
            lightColor: Color(UIColor(hex: "#FFFFFF33"))
        )
    }
    
    static var surfaceInverseTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080F")),
            lightColor: Color(UIColor(hex: "#FFFFFF3D"))
        )
    }
    
    static var surfaceInverseTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808083D")),
            lightColor: Color(UIColor(hex: "#FFFFFF1F"))
        )
    }
    
    static var surfaceInverseTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.500][0.12]"))
        )
    }
    
    static var surfaceInverseTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E857020F")),
            lightColor: Color(UIColor(hex: "#FA5F0529"))
        )
    }
    
    static var surfaceInverseTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E857023D")),
            lightColor: Color(UIColor(hex: "#FA5F050A"))
        )
    }
    
    static var surfaceInverseWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702")),
            lightColor: Color(UIColor(hex: "#FA5F05"))
        )
    }
    
    static var surfaceInverseWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#DE5302FF")),
            lightColor: Color(UIColor(hex: "#E65705FF"))
        )
    }
    
    static var surfaceInverseWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FC5E03FF")),
            lightColor: Color(UIColor(hex: "#FB782DFF"))
        )
    }
    
    static var surfaceInverseWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceInverseWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E")),
            lightColor: Color(UIColor(hex: "#24B23E"))
        )
    }
    
    static var surfaceOnDarkAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#23A93BFF")),
            lightColor: Color(UIColor(hex: "#21A138FF"))
        )
    }
    
    static var surfaceOnDarkAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#28C344FF")),
            lightColor: Color(UIColor(hex: "#28C344FF"))
        )
    }
    
    static var surfaceOnDarkAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnDarkClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnDarkClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnDarkInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E")),
            lightColor: Color(UIColor(hex: "#FF293E"))
        )
    }
    
    static var surfaceOnDarkNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF1F35FF")),
            lightColor: Color(UIColor(hex: "#FF142CFF"))
        )
    }
    
    static var surfaceOnDarkNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF475AFF")),
            lightColor: Color(UIColor(hex: "#FF5263FF"))
        )
    }
    
    static var surfaceOnDarkNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var surfaceOnDarkPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#18952FFF")),
            lightColor: Color(UIColor(hex: "#178C2CFF"))
        )
    }
    
    static var surfaceOnDarkPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1DAF37FF")),
            lightColor: Color(UIColor(hex: "#1EB83AFF"))
        )
    }
    
    static var surfaceOnDarkPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkSolidCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#171717")),
            lightColor: Color(UIColor(hex: "#171717"))
        )
    }
    
    static var surfaceOnDarkSolidCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#121212FF")),
            lightColor: Color(UIColor(hex: "#0D0D0DFF"))
        )
    }
    
    static var surfaceOnDarkSolidCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1C1C1CFF")),
            lightColor: Color(UIColor(hex: "#363636FF"))
        )
    }
    
    static var surfaceOnDarkSolidDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkSolidDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkSolidDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F5F5F5")),
            lightColor: Color(UIColor(hex: "#F5F5F5"))
        )
    }
    
    static var surfaceOnDarkSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F0F0F0FF")),
            lightColor: Color(UIColor(hex: "#F0F0F0FF"))
        )
    }
    
    static var surfaceOnDarkSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FAFAFAFF")),
            lightColor: Color(UIColor(hex: "#FAFAFAFF"))
        )
    }
    
    static var surfaceOnDarkSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ECECEC")),
            lightColor: Color(UIColor(hex: "#ECECEC"))
        )
    }
    
    static var surfaceOnDarkSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E8E8E8FF")),
            lightColor: Color(UIColor(hex: "#E8E8E8FF"))
        )
    }
    
    static var surfaceOnDarkSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F7F7F7FF")),
            lightColor: Color(UIColor(hex: "#F7F7F7FF"))
        )
    }
    
    static var surfaceOnDarkSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#363636")),
            lightColor: Color(UIColor(hex: "#363636"))
        )
    }
    
    static var surfaceOnDarkSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#2B2B2BFF"))
        )
    }
    
    static var surfaceOnDarkSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#404040FF")),
            lightColor: Color(UIColor(hex: "#4A4A4AFF"))
        )
    }
    
    static var surfaceOnDarkTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.400][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.400][0.12]"))
        )
    }
    
    static var surfaceOnDarkTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E0F")),
            lightColor: Color(UIColor(hex: "#24B23E29"))
        )
    }
    
    static var surfaceOnDarkTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E3D")),
            lightColor: Color(UIColor(hex: "#24B23E0A"))
        )
    }
    
    static var surfaceOnDarkTransparentCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "#FFFFFF0F"))
        )
    }
    
    static var surfaceOnDarkTransparentCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0A")),
            lightColor: Color(UIColor(hex: "#FFFFFF1A"))
        )
    }
    
    static var surfaceOnDarkTransparentCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "#FFFFFF05"))
        )
    }
    
    static var surfaceOnDarkTransparentDeep: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFA3")),
            lightColor: Color(UIColor(hex: "#FFFFFFA3"))
        )
    }
    
    static var surfaceOnDarkTransparentDeepActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF94")),
            lightColor: Color(UIColor(hex: "#FFFFFFAD"))
        )
    }
    
    static var surfaceOnDarkTransparentDeepHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFC2")),
            lightColor: Color(UIColor(hex: "#FFFFFF8F"))
        )
    }
    
    static var surfaceOnDarkTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.500][0.12]"))
        )
    }
    
    static var surfaceOnDarkTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E0F")),
            lightColor: Color(UIColor(hex: "#FF293E29"))
        )
    }
    
    static var surfaceOnDarkTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E3D")),
            lightColor: Color(UIColor(hex: "#FF293E0A"))
        )
    }
    
    static var surfaceOnDarkTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.500][0.12]"))
        )
    }
    
    static var surfaceOnDarkTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E320F")),
            lightColor: Color(UIColor(hex: "#1A9E3229"))
        )
    }
    
    static var surfaceOnDarkTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E323D")),
            lightColor: Color(UIColor(hex: "#1A9E320A"))
        )
    }
    
    static var surfaceOnDarkTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "#FFFFFF0F"))
        )
    }
    
    static var surfaceOnDarkTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0A")),
            lightColor: Color(UIColor(hex: "#FFFFFF1A"))
        )
    }
    
    static var surfaceOnDarkTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "#FFFFFF05"))
        )
    }
    
    static var surfaceOnDarkTransparentPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF1F")),
            lightColor: Color(UIColor(hex: "#FFFFFF1F"))
        )
    }
    
    static var surfaceOnDarkTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF0F")),
            lightColor: Color(UIColor(hex: "#FFFFFF29"))
        )
    }
    
    static var surfaceOnDarkTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF3D")),
            lightColor: Color(UIColor(hex: "#FFFFFF0A"))
        )
    }
    
    static var surfaceOnDarkTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF33")),
            lightColor: Color(UIColor(hex: "#FFFFFF33"))
        )
    }
    
    static var surfaceOnDarkTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF24")),
            lightColor: Color(UIColor(hex: "#FFFFFF3D"))
        )
    }
    
    static var surfaceOnDarkTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFF52")),
            lightColor: Color(UIColor(hex: "#FFFFFF1F"))
        )
    }
    
    static var surfaceOnDarkTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.500][0.12]"))
        )
    }
    
    static var surfaceOnDarkTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F050F")),
            lightColor: Color(UIColor(hex: "#FA5F0529"))
        )
    }
    
    static var surfaceOnDarkTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F053D")),
            lightColor: Color(UIColor(hex: "#FA5F050A"))
        )
    }
    
    static var surfaceOnDarkWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05")),
            lightColor: Color(UIColor(hex: "#FA5F05"))
        )
    }
    
    static var surfaceOnDarkWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F05B05FF")),
            lightColor: Color(UIColor(hex: "#E65705FF"))
        )
    }
    
    static var surfaceOnDarkWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FB7223FF")),
            lightColor: Color(UIColor(hex: "#FB782DFF"))
        )
    }
    
    static var surfaceOnDarkWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnDarkWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var surfaceOnLightAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F8523FF")),
            lightColor: Color(UIColor(hex: "#0E7C20FF"))
        )
    }
    
    static var surfaceOnLightAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#12A12AFF")),
            lightColor: Color(UIColor(hex: "#12A12AFF"))
        )
    }
    
    static var surfaceOnLightAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightClear: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnLightClearActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnLightClearHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000000")),
            lightColor: Color(UIColor(hex: "#00000000"))
        )
    }
    
    static var surfaceOnLightInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B31")),
            lightColor: Color(UIColor(hex: "#F31B31"))
        )
    }
    
    static var surfaceOnLightNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31228FF")),
            lightColor: Color(UIColor(hex: "#ED0C23FF"))
        )
    }
    
    static var surfaceOnLightNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F5384BFF")),
            lightColor: Color(UIColor(hex: "#F54254FF"))
        )
    }
    
    static var surfaceOnLightNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var surfaceOnLightPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F8523FF")),
            lightColor: Color(UIColor(hex: "#0E7C20FF"))
        )
    }
    
    static var surfaceOnLightPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#12A12AFF")),
            lightColor: Color(UIColor(hex: "#12A12AFF"))
        )
    }
    
    static var surfaceOnLightPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightSolidCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F")),
            lightColor: Color(UIColor(hex: "#F"))
        )
    }
    
    static var surfaceOnLightSolidCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightSolidCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightSolidDefault: Self {
        Self(
            darkColor: Color(UIColor(hex: "#080808")),
            lightColor: Color(UIColor(hex: "#080808"))
        )
    }
    
    static var surfaceOnLightSolidDefaultActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#030303FF")),
            lightColor: Color(UIColor(hex: "#030303FF"))
        )
    }
    
    static var surfaceOnLightSolidDefaultHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D0D0DFF")),
            lightColor: Color(UIColor(hex: "#262626FF"))
        )
    }
    
    static var surfaceOnLightSolidPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var surfaceOnLightSolidPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#212121FF")),
            lightColor: Color(UIColor(hex: "#1C1C1CFF"))
        )
    }
    
    static var surfaceOnLightSolidPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#3B3B3BFF"))
        )
    }
    
    static var surfaceOnLightSolidSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#363636")),
            lightColor: Color(UIColor(hex: "#363636"))
        )
    }
    
    static var surfaceOnLightSolidSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#303030FF")),
            lightColor: Color(UIColor(hex: "#2B2B2BFF"))
        )
    }
    
    static var surfaceOnLightSolidSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#404040FF")),
            lightColor: Color(UIColor(hex: "#4A4A4AFF"))
        )
    }
    
    static var surfaceOnLightSolidTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#DDDDDD")),
            lightColor: Color(UIColor(hex: "#DDDDDD"))
        )
    }
    
    static var surfaceOnLightSolidTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#D9D9D9FF")),
            lightColor: Color(UIColor(hex: "#D4D4D4FF"))
        )
    }
    
    static var surfaceOnLightSolidTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E8E8E8FF")),
            lightColor: Color(UIColor(hex: "#EDEDEDFF"))
        )
    }
    
    static var surfaceOnLightTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var surfaceOnLightTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E250F")),
            lightColor: Color(UIColor(hex: "#108E2529"))
        )
    }
    
    static var surfaceOnLightTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E253D")),
            lightColor: Color(UIColor(hex: "#108E250A"))
        )
    }
    
    static var surfaceOnLightTransparentCard: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.06]")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.06]"))
        )
    }
    
    static var surfaceOnLightTransparentCardActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080A")),
            lightColor: Color(UIColor(hex: "#0808081A"))
        )
    }
    
    static var surfaceOnLightTransparentCardHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808081F")),
            lightColor: Color(UIColor(hex: "#08080805"))
        )
    }
    
    static var surfaceOnLightTransparentDeep: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000A3")),
            lightColor: Color(UIColor(hex: "#000000A3"))
        )
    }
    
    static var surfaceOnLightTransparentDeepActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#00000094")),
            lightColor: Color(UIColor(hex: "#000000AD"))
        )
    }
    
    static var surfaceOnLightTransparentDeepHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#000000C2")),
            lightColor: Color(UIColor(hex: "#0000008F"))
        )
    }
    
    static var surfaceOnLightTransparentInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.600][0.12]"))
        )
    }
    
    static var surfaceOnLightTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B310F")),
            lightColor: Color(UIColor(hex: "#F31B3129"))
        )
    }
    
    static var surfaceOnLightTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B313D")),
            lightColor: Color(UIColor(hex: "#F31B310A"))
        )
    }
    
    static var surfaceOnLightTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var surfaceOnLightTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E250F")),
            lightColor: Color(UIColor(hex: "#108E2529"))
        )
    }
    
    static var surfaceOnLightTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E253D")),
            lightColor: Color(UIColor(hex: "#108E250A"))
        )
    }
    
    static var surfaceOnLightTransparentPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.02]")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.02]"))
        )
    }
    
    static var surfaceOnLightTransparentPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#08080800")),
            lightColor: Color(UIColor(hex: "#0808080A"))
        )
    }
    
    static var surfaceOnLightTransparentPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080F")),
            lightColor: Color(UIColor(hex: "#08080800"))
        )
    }
    
    static var surfaceOnLightTransparentPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightTransparentSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.06]")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.06]"))
        )
    }
    
    static var surfaceOnLightTransparentSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080A")),
            lightColor: Color(UIColor(hex: "#0808081A"))
        )
    }
    
    static var surfaceOnLightTransparentSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808081F")),
            lightColor: Color(UIColor(hex: "#08080805"))
        )
    }
    
    static var surfaceOnLightTransparentTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.gray.1000][0.12]")),
            lightColor: Color(UIColor(hex: "[general.gray.1000][0.12]"))
        )
    }
    
    static var surfaceOnLightTransparentTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808080F")),
            lightColor: Color(UIColor(hex: "#08080829"))
        )
    }
    
    static var surfaceOnLightTransparentTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0808083D")),
            lightColor: Color(UIColor(hex: "#0808080A"))
        )
    }
    
    static var surfaceOnLightTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.600][0.12]"))
        )
    }
    
    static var surfaceOnLightTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E857020F")),
            lightColor: Color(UIColor(hex: "#E8570229"))
        )
    }
    
    static var surfaceOnLightTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E857023D")),
            lightColor: Color(UIColor(hex: "#E857020A"))
        )
    }
    
    static var surfaceOnLightWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702")),
            lightColor: Color(UIColor(hex: "#E85702"))
        )
    }
    
    static var surfaceOnLightWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#DE5302FF")),
            lightColor: Color(UIColor(hex: "#D44F02FF"))
        )
    }
    
    static var surfaceOnLightWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FC5E03FF")),
            lightColor: Color(UIColor(hex: "#FC5E03FF"))
        )
    }
    
    static var surfaceOnLightWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var surfaceOnLightWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var textDefaultAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1F9835FF")),
            lightColor: Color(UIColor(hex: "#0C6A1BFF"))
        )
    }
    
    static var textDefaultAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#2ACB47FF")),
            lightColor: Color(UIColor(hex: "#14B32EFF"))
        )
    }
    
    static var textDefaultAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#118CDF")),
            lightColor: Color(UIColor(hex: "#0C72B6"))
        )
    }
    
    static var textDefaultInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0F7BC2FF")),
            lightColor: Color(UIColor(hex: "#095A90FF"))
        )
    }
    
    static var textDefaultInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#50B1F2FF")),
            lightColor: Color(UIColor(hex: "#0E8ADDFF"))
        )
    }
    
    static var textDefaultInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E")),
            lightColor: Color(UIColor(hex: "#E31227"))
        )
    }
    
    static var textDefaultNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF0A23FF")),
            lightColor: Color(UIColor(hex: "#BD0F21FF"))
        )
    }
    
    static var textDefaultNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF475AFF")),
            lightColor: Color(UIColor(hex: "#EE2F43FF"))
        )
    }
    
    static var textDefaultNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultParagraph: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ECECEC")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var textDefaultParagraphActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#D4D4D4FF")),
            lightColor: Color(UIColor(hex: "#4F4F4FFF"))
        )
    }
    
    static var textDefaultParagraphHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#BABABAFF")),
            lightColor: Color(UIColor(hex: "#787878FF"))
        )
    }
    
    static var textDefaultPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var textDefaultPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#15842AFF")),
            lightColor: Color(UIColor(hex: "#147B27FF"))
        )
    }
    
    static var textDefaultPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1EB83AFF")),
            lightColor: Color(UIColor(hex: "#1FC13DFF"))
        )
    }
    
    static var textDefaultPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var textDefaultPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#4F4F4FFF"))
        )
    }
    
    static var textDefaultPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#787878FF"))
        )
    }
    
    static var textDefaultPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#B3B3B3")),
            lightColor: Color(UIColor(hex: "#4E4E4E"))
        )
    }
    
    static var textDefaultSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#3D3D3DFF")),
            lightColor: Color(UIColor(hex: "#404040FF"))
        )
    }
    
    static var textDefaultSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#707070")),
            lightColor: Color(UIColor(hex: "#949494"))
        )
    }
    
    static var textDefaultTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#737373FF")),
            lightColor: Color(UIColor(hex: "#757575FF"))
        )
    }
    
    static var textDefaultTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textDefaultTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.400][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var textDefaultTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E25")),
            lightColor: Color(UIColor(hex: "#108E2525"))
        )
    }
    
    static var textDefaultTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23EFF")),
            lightColor: Color(UIColor(hex: "#108E25FF"))
        )
    }
    
    static var textDefaultTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.600][0.12]"))
        )
    }
    
    static var textDefaultTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E25")),
            lightColor: Color(UIColor(hex: "#F31B3125"))
        )
    }
    
    static var textDefaultTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293EFF")),
            lightColor: Color(UIColor(hex: "#F31B31FF"))
        )
    }
    
    static var textDefaultTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var textDefaultTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E3225")),
            lightColor: Color(UIColor(hex: "#108E2525"))
        )
    }
    
    static var textDefaultTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32FF")),
            lightColor: Color(UIColor(hex: "#108E25FF"))
        )
    }
    
    static var textDefaultTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.600][0.12]"))
        )
    }
    
    static var textDefaultTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F0525")),
            lightColor: Color(UIColor(hex: "#E8570225"))
        )
    }
    
    static var textDefaultTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05FF")),
            lightColor: Color(UIColor(hex: "#E85702FF"))
        )
    }
    
    static var textDefaultWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05")),
            lightColor: Color(UIColor(hex: "#E85702"))
        )
    }
    
    static var textDefaultWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#DC5304FF")),
            lightColor: Color(UIColor(hex: "#C04802FF"))
        )
    }
    
    static var textDefaultWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FB7223FF")),
            lightColor: Color(UIColor(hex: "#FD6B17FF"))
        )
    }
    
    static var textDefaultWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textDefaultWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textDefaultWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#24B23E"))
        )
    }
    
    static var textInverseAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D731EFF")),
            lightColor: Color(UIColor(hex: "#1D9032FF"))
        )
    }
    
    static var textInverseAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#13AA2CFF")),
            lightColor: Color(UIColor(hex: "#2BD44AFF"))
        )
    }
    
    static var textInverseAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInverseAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInverseAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0C72B6")),
            lightColor: Color(UIColor(hex: "#118CDF"))
        )
    }
    
    static var textInverseInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0A6099FF")),
            lightColor: Color(UIColor(hex: "#0E75B9FF"))
        )
    }
    
    static var textInverseInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#229EF1FF")),
            lightColor: Color(UIColor(hex: "#2AA0EFFF"))
        )
    }
    
    static var textInverseInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInverseInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInverseInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E31227")),
            lightColor: Color(UIColor(hex: "#FF293E"))
        )
    }
    
    static var textInverseNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#C61022FF")),
            lightColor: Color(UIColor(hex: "#FF001AFF"))
        )
    }
    
    static var textInverseNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ED263AFF")),
            lightColor: Color(UIColor(hex: "#FF5263FF"))
        )
    }
    
    static var textInverseNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInverseNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInverseNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseParagraph: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#ECECEC"))
        )
    }
    
    static var textInverseParagraphActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ADADADFF")),
            lightColor: Color(UIColor(hex: "#BDBDBDFF"))
        )
    }
    
    static var textInverseParagraphHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInversePositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#24B23E"))
        )
    }
    
    static var textInversePositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D731EFF")),
            lightColor: Color(UIColor(hex: "#1D9032FF"))
        )
    }
    
    static var textInversePositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#13AA2CFF")),
            lightColor: Color(UIColor(hex: "#2BD44AFF"))
        )
    }
    
    static var textInversePositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInversePositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInversePositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInversePrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInversePrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ADADADFF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInversePrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInversePromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInversePromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInversePromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInversePromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInversePromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInversePromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4E4E4E")),
            lightColor: Color(UIColor(hex: "#B3B3B3"))
        )
    }
    
    static var textInverseSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#8C8C8CFF")),
            lightColor: Color(UIColor(hex: "#8F8F8FFF"))
        )
    }
    
    static var textInverseSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#949494")),
            lightColor: Color(UIColor(hex: "#707070"))
        )
    }
    
    static var textInverseTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#575757FF")),
            lightColor: Color(UIColor(hex: "#595959FF"))
        )
    }
    
    static var textInverseTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textInverseTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.400][0.12]"))
        )
    }
    
    static var textInverseTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E2525")),
            lightColor: Color(UIColor(hex: "#24B23E25"))
        )
    }
    
    static var textInverseTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E25FF")),
            lightColor: Color(UIColor(hex: "#24B23EFF"))
        )
    }
    
    static var textInverseTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.500][0.12]"))
        )
    }
    
    static var textInverseTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B3125")),
            lightColor: Color(UIColor(hex: "#FF293E25"))
        )
    }
    
    static var textInverseTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B31FF")),
            lightColor: Color(UIColor(hex: "#FF293EFF"))
        )
    }
    
    static var textInverseTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.500][0.12]"))
        )
    }
    
    static var textInverseTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E2525")),
            lightColor: Color(UIColor(hex: "#1A9E3225"))
        )
    }
    
    static var textInverseTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E25FF")),
            lightColor: Color(UIColor(hex: "#1A9E32FF"))
        )
    }
    
    static var textInverseTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.500][0.12]"))
        )
    }
    
    static var textInverseTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E8570225")),
            lightColor: Color(UIColor(hex: "#FA5F0525"))
        )
    }
    
    static var textInverseTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702FF")),
            lightColor: Color(UIColor(hex: "#FA5F05FF"))
        )
    }
    
    static var textInverseWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702")),
            lightColor: Color(UIColor(hex: "#FA5F05"))
        )
    }
    
    static var textInverseWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CA4B02FF")),
            lightColor: Color(UIColor(hex: "#D25004FF"))
        )
    }
    
    static var textInverseWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FD650DFF")),
            lightColor: Color(UIColor(hex: "#FB782DFF"))
        )
    }
    
    static var textInverseWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textInverseWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textInverseWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E")),
            lightColor: Color(UIColor(hex: "#24B23E"))
        )
    }
    
    static var textOnDarkAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1F9835FF")),
            lightColor: Color(UIColor(hex: "#1D9032FF"))
        )
    }
    
    static var textOnDarkAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#2ACB47FF")),
            lightColor: Color(UIColor(hex: "#2BD44AFF"))
        )
    }
    
    static var textOnDarkAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E")),
            lightColor: Color(UIColor(hex: "#FF293E"))
        )
    }
    
    static var textOnDarkNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF0A23FF")),
            lightColor: Color(UIColor(hex: "#FF001AFF"))
        )
    }
    
    static var textOnDarkNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF475AFF")),
            lightColor: Color(UIColor(hex: "#FF5263FF"))
        )
    }
    
    static var textOnDarkNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkParagraph: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ECECEC")),
            lightColor: Color(UIColor(hex: "#ECECEC"))
        )
    }
    
    static var textOnDarkParagraphActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#D4D4D4FF")),
            lightColor: Color(UIColor(hex: "#BDBDBDFF"))
        )
    }
    
    static var textOnDarkParagraphHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#BABABAFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32")),
            lightColor: Color(UIColor(hex: "#1A9E32"))
        )
    }
    
    static var textOnDarkPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#15842AFF")),
            lightColor: Color(UIColor(hex: "#147B27FF"))
        )
    }
    
    static var textOnDarkPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1EB83AFF")),
            lightColor: Color(UIColor(hex: "#1FC13DFF"))
        )
    }
    
    static var textOnDarkPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#B3B3B3")),
            lightColor: Color(UIColor(hex: "#B3B3B3"))
        )
    }
    
    static var textOnDarkSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#3D3D3DFF")),
            lightColor: Color(UIColor(hex: "#8F8F8FFF"))
        )
    }
    
    static var textOnDarkSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#707070")),
            lightColor: Color(UIColor(hex: "#707070"))
        )
    }
    
    static var textOnDarkTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#737373FF")),
            lightColor: Color(UIColor(hex: "#595959FF"))
        )
    }
    
    static var textOnDarkTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnDarkTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.400][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.400][0.12]"))
        )
    }
    
    static var textOnDarkTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23E25")),
            lightColor: Color(UIColor(hex: "#24B23E25"))
        )
    }
    
    static var textOnDarkTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#24B23EFF")),
            lightColor: Color(UIColor(hex: "#24B23EFF"))
        )
    }
    
    static var textOnDarkTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.500][0.12]"))
        )
    }
    
    static var textOnDarkTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293E25")),
            lightColor: Color(UIColor(hex: "#FF293E25"))
        )
    }
    
    static var textOnDarkTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FF293EFF")),
            lightColor: Color(UIColor(hex: "#FF293EFF"))
        )
    }
    
    static var textOnDarkTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.500][0.12]"))
        )
    }
    
    static var textOnDarkTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E3225")),
            lightColor: Color(UIColor(hex: "#1A9E3225"))
        )
    }
    
    static var textOnDarkTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#1A9E32FF")),
            lightColor: Color(UIColor(hex: "#1A9E32FF"))
        )
    }
    
    static var textOnDarkTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.500][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.500][0.12]"))
        )
    }
    
    static var textOnDarkTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F0525")),
            lightColor: Color(UIColor(hex: "#FA5F0525"))
        )
    }
    
    static var textOnDarkTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05FF")),
            lightColor: Color(UIColor(hex: "#FA5F05FF"))
        )
    }
    
    static var textOnDarkWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FA5F05")),
            lightColor: Color(UIColor(hex: "#FA5F05"))
        )
    }
    
    static var textOnDarkWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#DC5304FF")),
            lightColor: Color(UIColor(hex: "#D25004FF"))
        )
    }
    
    static var textOnDarkWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FB7223FF")),
            lightColor: Color(UIColor(hex: "#FB782DFF"))
        )
    }
    
    static var textOnDarkWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnDarkWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnDarkWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var textOnLightAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D731EFF")),
            lightColor: Color(UIColor(hex: "#0C6A1BFF"))
        )
    }
    
    static var textOnLightAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#13AA2CFF")),
            lightColor: Color(UIColor(hex: "#14B32EFF"))
        )
    }
    
    static var textOnLightAccentMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightAccentMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightAccentMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightInfo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightInfoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightInfoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightInfoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightInfoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightInfoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B31")),
            lightColor: Color(UIColor(hex: "#F31B31"))
        )
    }
    
    static var textOnLightNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E40C22FF")),
            lightColor: Color(UIColor(hex: "#DA0B20FF"))
        )
    }
    
    static var textOnLightNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F5384BFF")),
            lightColor: Color(UIColor(hex: "#F54254FF"))
        )
    }
    
    static var textOnLightNegativeMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightNegativeMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightNegativeMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightParagraph: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var textOnLightParagraphActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ADADADFF")),
            lightColor: Color(UIColor(hex: "#4F4F4FFF"))
        )
    }
    
    static var textOnLightParagraphHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#787878FF"))
        )
    }
    
    static var textOnLightPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E26")),
            lightColor: Color(UIColor(hex: "#108E26"))
        )
    }
    
    static var textOnLightPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#0D731EFF")),
            lightColor: Color(UIColor(hex: "#0C6A1BFF"))
        )
    }
    
    static var textOnLightPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#13AA2CFF")),
            lightColor: Color(UIColor(hex: "#14B32EFF"))
        )
    }
    
    static var textOnLightPositiveMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightPositiveMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightPositiveMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightPrimary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#262626")),
            lightColor: Color(UIColor(hex: "#262626"))
        )
    }
    
    static var textOnLightPrimaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#ADADADFF")),
            lightColor: Color(UIColor(hex: "#4F4F4FFF"))
        )
    }
    
    static var textOnLightPrimaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#787878FF"))
        )
    }
    
    static var textOnLightPromo: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightPromoActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightPromoHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightPromoMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightPromoMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightPromoMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightSecondary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#4E4E4E")),
            lightColor: Color(UIColor(hex: "#4E4E4E"))
        )
    }
    
    static var textOnLightSecondaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#8C8C8CFF")),
            lightColor: Color(UIColor(hex: "#404040FF"))
        )
    }
    
    static var textOnLightSecondaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightTertiary: Self {
        Self(
            darkColor: Color(UIColor(hex: "#949494")),
            lightColor: Color(UIColor(hex: "#949494"))
        )
    }
    
    static var textOnLightTertiaryActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#575757FF")),
            lightColor: Color(UIColor(hex: "#757575FF"))
        )
    }
    
    static var textOnLightTertiaryHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
    
    static var textOnLightTransparentAccent: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var textOnLightTransparentAccentActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E2525")),
            lightColor: Color(UIColor(hex: "#108E2525"))
        )
    }
    
    static var textOnLightTransparentAccentHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E25FF")),
            lightColor: Color(UIColor(hex: "#108E25FF"))
        )
    }
    
    static var textOnLightTransparentNegative: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.red.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.red.600][0.12]"))
        )
    }
    
    static var textOnLightTransparentNegativeActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B3125")),
            lightColor: Color(UIColor(hex: "#F31B3125"))
        )
    }
    
    static var textOnLightTransparentNegativeHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#F31B31FF")),
            lightColor: Color(UIColor(hex: "#F31B31FF"))
        )
    }
    
    static var textOnLightTransparentPositive: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.green.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.green.600][0.12]"))
        )
    }
    
    static var textOnLightTransparentPositiveActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E2525")),
            lightColor: Color(UIColor(hex: "#108E2525"))
        )
    }
    
    static var textOnLightTransparentPositiveHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#108E25FF")),
            lightColor: Color(UIColor(hex: "#108E25FF"))
        )
    }
    
    static var textOnLightTransparentWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "[general.orange.600][0.12]")),
            lightColor: Color(UIColor(hex: "[general.orange.600][0.12]"))
        )
    }
    
    static var textOnLightTransparentWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E8570225")),
            lightColor: Color(UIColor(hex: "#E8570225"))
        )
    }
    
    static var textOnLightTransparentWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702FF")),
            lightColor: Color(UIColor(hex: "#E85702FF"))
        )
    }
    
    static var textOnLightWarning: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E85702")),
            lightColor: Color(UIColor(hex: "#E85702"))
        )
    }
    
    static var textOnLightWarningActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CA4B02FF")),
            lightColor: Color(UIColor(hex: "#C04802FF"))
        )
    }
    
    static var textOnLightWarningHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FD650DFF")),
            lightColor: Color(UIColor(hex: "#FD6B17FF"))
        )
    }
    
    static var textOnLightWarningMinor: Self {
        Self(
            darkColor: Color(UIColor(hex: "#FFFFFFFF")),
            lightColor: Color(UIColor(hex: "#FFFFFFFF"))
        )
    }
    
    static var textOnLightWarningMinorActive: Self {
        Self(
            darkColor: Color(UIColor(hex: "#E6E6E6FF")),
            lightColor: Color(UIColor(hex: "#CCCCCCFF"))
        )
    }
    
    static var textOnLightWarningMinorHover: Self {
        Self(
            darkColor: Color(UIColor(hex: "#CCCCCCFF")),
            lightColor: Color(UIColor(hex: "#000000FF"))
        )
    }
}
