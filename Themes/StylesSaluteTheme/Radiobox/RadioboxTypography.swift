import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct RadioboxTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: SelectionControlSizeConfiguration) -> TypographyToken? {
        if size is RadioboxAnySize {
            return m
        }
        if size is RadioboxSizeM {
            return m
        }
        if size is RadioboxSizeS {
            return s
        }
        return m
    }
}
