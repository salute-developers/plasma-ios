import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IndicatorTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
    }
    
    func typography(with size: IndicatorSizeConfiguration) -> TypographyToken? {
        if size is IndicatorAnySize {
            return l
        }
        if size is IndicatorSizeL {
            return l
        }
        if size is IndicatorSizeM {
            return m
        }
        if size is IndicatorSizeS {
            return s
        }
        return l
    }
}
