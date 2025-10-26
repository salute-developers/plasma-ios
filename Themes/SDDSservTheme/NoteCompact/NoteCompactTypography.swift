import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteCompactTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: NoteCompactSizeConfiguration) -> TypographyToken? {
        if size is NoteCompactAnySize {
            return l
        }
        if size is NoteCompactSizeL {
            return l
        }
        if size is NoteCompactSizeM {
            return m
        }
        if size is NoteCompactSizeS {
            return s
        }
        if size is NoteCompactSizeXs {
            return xs
        }
        return l
    }
}
