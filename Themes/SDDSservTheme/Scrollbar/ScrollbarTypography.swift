import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ScrollbarTypography: GeneralTypographyConfiguration {
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
        if size is ScrollbarAnySize {
            return m
        }
        if size is ScrollbarSizeM {
            return m
        }
        if size is ScrollbarSizeS {
            return s
        }
        return nil
    }
}
