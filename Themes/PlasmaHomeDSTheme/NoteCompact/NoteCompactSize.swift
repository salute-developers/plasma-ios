import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteCompactSize {
    static let contentBeforeFixed = NoteCompactSizeContentbeforefixed()
    static let contentBeforeScalable = NoteCompactSizeContentbeforescalable()

    static let all: [NoteCompactSizeConfiguration] = [
        NoteCompactSize.contentBeforeFixed,
        NoteCompactSize.contentBeforeScalable,
    ] 
}
struct NoteCompactSizeContentbeforefixed: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0.0)
    var actionStartMargin = CGFloat(12.0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(8.0)
    var iconSize = CGFloat(16.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    public var debugDescription: String {
        return "NoteCompactSize"
    }
}
struct NoteCompactSizeContentbeforescalable: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0.0)
    var actionStartMargin = CGFloat(12.0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.center
    var contentBeforeEndMargin = CGFloat(12.0)
    var iconSize = CGFloat(0.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    public var debugDescription: String {
        return "NoteCompactSize"
    }
}

struct NoteCompactAnySize: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0)
    var actionStartMargin = CGFloat(0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(0)
    var iconSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var textTopMargin = CGFloat(0)

    init(size: NoteCompactSizeConfiguration) {
        self.actionEndMargin = size.actionEndMargin
        self.actionStartMargin = size.actionStartMargin
        self.closeSize = size.closeSize
        self.closeStartMargin = size.closeStartMargin
        self.contentBeforeArrangement = size.contentBeforeArrangement
        self.contentBeforeEndMargin = size.contentBeforeEndMargin
        self.iconSize = size.iconSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
        self.textTopMargin = size.textTopMargin
    }
    var debugDescription: String {
        return "NoteCompactAnySize"
    }
}
