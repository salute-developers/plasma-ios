import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListTypography: GeneralTypographyConfiguration {
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
        if size is ListAnySize {
            return m
        }
        if size is ListSizeM {
            return m
        }
        if size is ListSizeS {
            return s
        }
        return m
    }
}
