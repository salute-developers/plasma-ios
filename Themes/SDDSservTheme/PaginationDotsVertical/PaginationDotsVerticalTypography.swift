import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct PaginationDotsVerticalTypography: GeneralTypographyConfiguration {
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
        if size is PaginationDotsVerticalAnySize {
            return m
        }
        if size is PaginationDotsVerticalSizeM {
            return m
        }
        if size is PaginationDotsVerticalSizeS {
            return s
        }
        return m
    }
}
