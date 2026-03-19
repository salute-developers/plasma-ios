import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct PaginationDotsHorizontalTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: PaginationDotsSizeConfiguration) -> TypographyToken? {
        if size is PaginationDotsHorizontalAnySize {
            return m
        }
        if size is PaginationDotsHorizontalSizeM {
            return m
        }
        if size is PaginationDotsHorizontalSizeS {
            return s
        }
        return m
    }
}
