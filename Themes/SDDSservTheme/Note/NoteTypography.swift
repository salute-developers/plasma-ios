import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteTypography: GeneralTypographyConfiguration {
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: NoteSizeConfiguration) -> TypographyToken? {
        if size is NoteAnySize {
            return l
        }
        if size is NoteSizeL {
            return l
        }
        if size is NoteSizeM {
            return m
        }
        if size is NoteSizeS {
            return s
        }
        if size is NoteSizeXs {
            return xs
        }
        return l
    }
}
