import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionClearActionEndTypography: GeneralTypographyConfiguration {
    var h2: TypographyToken?
    var h3: TypographyToken?
    var h4: TypographyToken?
    var h5: TypographyToken?
    var l: TypographyToken?
    var m: TypographyToken?
    var s: TypographyToken?
    var xs: TypographyToken?
    
    init(
        h2: TypographyToken? = nil,
        h3: TypographyToken? = nil,
        h4: TypographyToken? = nil,
        h5: TypographyToken? = nil,
        l: TypographyToken? = nil,
        m: TypographyToken? = nil,
        s: TypographyToken? = nil,
        xs: TypographyToken? = nil
    ) {
        self.h2 = h2
        self.h3 = h3
        self.h4 = h4
        self.h5 = h5
        self.l = l
        self.m = m
        self.s = s
        self.xs = xs
    }
    
    init(oneSize: TypographyToken) {
        self.h2 = oneSize
        self.h3 = oneSize
        self.h4 = oneSize
        self.h5 = oneSize
        self.l = oneSize
        self.m = oneSize
        self.s = oneSize
        self.xs = oneSize
    }
    
    func typography(with size: AccordionSizeConfiguration) -> TypographyToken? {
        if size is AccordionClearActionEndAnySize {
            return h2
        }
        if size is AccordionClearActionEndSizeH2 {
            return h2
        }
        if size is AccordionClearActionEndSizeH3 {
            return h3
        }
        if size is AccordionClearActionEndSizeH4 {
            return h4
        }
        if size is AccordionClearActionEndSizeH5 {
            return h5
        }
        if size is AccordionClearActionEndSizeL {
            return l
        }
        if size is AccordionClearActionEndSizeM {
            return m
        }
        if size is AccordionClearActionEndSizeS {
            return s
        }
        if size is AccordionClearActionEndSizeXs {
            return xs
        }
        return h2
    }
}
