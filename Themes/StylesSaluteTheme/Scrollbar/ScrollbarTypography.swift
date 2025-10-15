import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ScrollBarTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: ScrollbarSizeConfiguration) -> TypographyToken? {
        if size is ScrollBarAnySize {
            return m
        }
        if size is ScrollBarSizeM {
            return m
        }
        if size is ScrollBarSizeS {
            return s
        }
        return m
    }
}
