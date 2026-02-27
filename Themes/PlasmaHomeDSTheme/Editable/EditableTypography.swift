import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct EditableTypography: GeneralTypographyConfiguration {
    var bodyL: TypographyToken?
    var bodyM: TypographyToken?
    var bodyS: TypographyToken?
    var bodyXs: TypographyToken?
    var bodyXxs: TypographyToken?
    var h1: TypographyToken?
    var h2: TypographyToken?
    var h3: TypographyToken?
    var h4: TypographyToken?
    var h5: TypographyToken?
    var h6: TypographyToken?
    
    init(
        bodyL: TypographyToken? = nil,
        bodyM: TypographyToken? = nil,
        bodyS: TypographyToken? = nil,
        bodyXs: TypographyToken? = nil,
        bodyXxs: TypographyToken? = nil,
        h1: TypographyToken? = nil,
        h2: TypographyToken? = nil,
        h3: TypographyToken? = nil,
        h4: TypographyToken? = nil,
        h5: TypographyToken? = nil,
        h6: TypographyToken? = nil
    ) {
        self.bodyL = bodyL
        self.bodyM = bodyM
        self.bodyS = bodyS
        self.bodyXs = bodyXs
        self.bodyXxs = bodyXxs
        self.h1 = h1
        self.h2 = h2
        self.h3 = h3
        self.h4 = h4
        self.h5 = h5
        self.h6 = h6
    }
    
    init(oneSize: TypographyToken) {
        self.bodyL = oneSize
        self.bodyM = oneSize
        self.bodyS = oneSize
        self.bodyXs = oneSize
        self.bodyXxs = oneSize
        self.h1 = oneSize
        self.h2 = oneSize
        self.h3 = oneSize
        self.h4 = oneSize
        self.h5 = oneSize
        self.h6 = oneSize
    }
    
    func typography(with size: EditableSizeConfiguration) -> TypographyToken? {
        if size is EditableAnySize {
            return bodyL
        }
        if size is EditableSizeBodyl {
            return bodyL
        }
        if size is EditableSizeBodym {
            return bodyM
        }
        if size is EditableSizeBodys {
            return bodyS
        }
        if size is EditableSizeBodyxs {
            return bodyXs
        }
        if size is EditableSizeBodyxxs {
            return bodyXxs
        }
        if size is EditableSizeH1 {
            return h1
        }
        if size is EditableSizeH2 {
            return h2
        }
        if size is EditableSizeH3 {
            return h3
        }
        if size is EditableSizeH4 {
            return h4
        }
        if size is EditableSizeH5 {
            return h5
        }
        if size is EditableSizeH6 {
            return h6
        }
        return bodyL
    }
}
