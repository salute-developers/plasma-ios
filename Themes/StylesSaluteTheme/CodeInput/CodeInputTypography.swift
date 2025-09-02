import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CodeInputTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: CodeInputSizeConfiguration) -> TypographyToken? {
        if size is CodeInputAnySize {
            return l
        }
        if size is CodeInputSizeL {
            return l
        }
        if size is CodeInputSizeM {
            return m
        }
        if size is CodeInputSizeS {
            return s
        }
        return nil
    }
}
