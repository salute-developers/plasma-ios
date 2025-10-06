import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CodeFieldTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
    }
    
    func typography(with size: CodeFieldSizeConfiguration) -> TypographyToken? {
        if size is CodeFieldAnySize {
            return l
        }
        if size is CodeFieldSizeL {
            return l
        }
        if size is CodeFieldSizeM {
            return m
        }
        return l
    }
}
