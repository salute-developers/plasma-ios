import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteCompactTypography: GeneralTypographyConfiguration {
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
    
    func typography(with size: NoteCompactSizeConfiguration) -> TypographyToken? {
        if size is NoteCompactAnySize {
            return contentBeforeFixed
        }
        if size is NoteCompactSizeContentbeforefixed {
            return contentBeforeFixed
        }
        if size is NoteCompactSizeContentbeforescalable {
            return contentBeforeScalable
        }
        return contentBeforeFixed
    }
}
