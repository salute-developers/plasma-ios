import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RadioboxGroupTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: RadioboxGroupSizeConfiguration) -> TypographyToken? {
        if size is RadioboxGroupAnySize {
            return m
        }
        if size is RadioboxGroupSizeM {
            return m
        }
        if size is RadioboxGroupSizeS {
            return s
        }
        return m
    }
}
