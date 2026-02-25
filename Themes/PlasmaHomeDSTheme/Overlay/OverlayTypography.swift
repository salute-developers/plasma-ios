import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct OverlayTypography: GeneralTypographyConfiguration {
    var `default`: TypographyToken?
    var directionBottom: TypographyToken?
    var directionTop: TypographyToken?
    
    init(
        `default`: TypographyToken? = nil,
        directionBottom: TypographyToken? = nil,
        directionTop: TypographyToken? = nil
    ) {
        self.`default` = `default`
        self.directionBottom = directionBottom
        self.directionTop = directionTop
    }
    
    init(oneSize: TypographyToken) {
        self.`default` = oneSize
        self.directionBottom = oneSize
        self.directionTop = oneSize
    }
    
    func typography(with size: OverlaySizeConfiguration) -> TypographyToken? {
        if size is OverlayAnySize {
            return `default`
        }
        if size is OverlaySizeDefault {
            return `default`
        }
        if size is OverlaySizeDirectionbottom {
            return directionBottom
        }
        if size is OverlaySizeDirectiontop {
            return directionTop
        }
        return `default`
    }
}
