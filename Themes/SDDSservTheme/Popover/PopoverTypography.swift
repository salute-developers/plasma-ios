import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct PopoverTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: PopoverSizeConfiguration) -> TypographyToken? {
        if size is PopoverAnySize {
            return m
        }
        if size is PopoverSizeM {
            return m
        }
        if size is PopoverSizeS {
            return s
        }
        return m
    }
}
