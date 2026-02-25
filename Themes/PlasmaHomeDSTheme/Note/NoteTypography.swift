import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteTypography: GeneralTypographyConfiguration {
    var contentBeforeFixed: TypographyToken?
    var contentBeforeScalable: TypographyToken?
    
    init(
        contentBeforeFixed: TypographyToken? = nil,
        contentBeforeScalable: TypographyToken? = nil
    ) {
        self.contentBeforeFixed = contentBeforeFixed
        self.contentBeforeScalable = contentBeforeScalable
    }
    
    init(oneSize: TypographyToken) {
        self.contentBeforeFixed = oneSize
        self.contentBeforeScalable = oneSize
    }
    
    func typography(with size: NoteSizeConfiguration) -> TypographyToken? {
        if size is NoteAnySize {
            return contentBeforeFixed
        }
        if size is NoteSizeContentbeforefixed {
            return contentBeforeFixed
        }
        if size is NoteSizeContentbeforescalable {
            return contentBeforeScalable
        }
        return contentBeforeFixed
    }
}
