import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TooltipTypography: GeneralTypographyConfiguration {
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: TooltipSizeConfiguration) -> TypographyToken? {
        if size is TooltipAnySize {
            return m
        }
        if size is TooltipSizeM {
            return m
        }
        if size is TooltipSizeS {
            return s
        }
        return m
    }
}
