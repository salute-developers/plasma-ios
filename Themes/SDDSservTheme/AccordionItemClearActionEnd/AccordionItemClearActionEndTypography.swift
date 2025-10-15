import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionItemClearActionEndTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: AccordionItemSizeConfiguration) -> TypographyToken? {
        if size is AccordionItemClearActionEndAnySize {
            return h2
        }
        if size is AccordionItemClearActionEndSizeH2 {
            return h2
        }
        if size is AccordionItemClearActionEndSizeH3 {
            return h3
        }
        if size is AccordionItemClearActionEndSizeH4 {
            return h4
        }
        if size is AccordionItemClearActionEndSizeH5 {
            return h5
        }
        if size is AccordionItemClearActionEndSizeL {
            return l
        }
        if size is AccordionItemClearActionEndSizeM {
            return m
        }
        if size is AccordionItemClearActionEndSizeS {
            return s
        }
        if size is AccordionItemClearActionEndSizeXs {
            return xs
        }
        return h2
    }
}
