import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ListSizeConfiguration) -> TypographyToken? {
        if size is ListNumberedAnySize {
            return m
        }
        if size is ListNumberedSizeM {
            return m
        }
        if size is ListNumberedSizeS {
            return s
        }
        return m
    }
}
