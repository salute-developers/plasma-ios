import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteSize {
    static let contentBeforeFixed = NoteSizeContentbeforefixed()
    static let contentBeforeScalable = NoteSizeContentbeforescalable()

    static let all: [NoteSizeConfiguration] = [
        NoteSize.contentBeforeFixed,
        NoteSize.contentBeforeScalable,
    ] 
}
struct NoteSizeContentbeforefixed: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0.0)
    var closeEndMargin = CGFloat(0.0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(8.0)
    var iconSize = CGFloat(16.0)
    var paddingBottom = CGFloat(5.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    var titlePaddingEnd = CGFloat(0.0)
    public var debugDescription: String {
        return "NoteSize"
    }
}
struct NoteSizeContentbeforescalable: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0.0)
    var closeEndMargin = CGFloat(0.0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.center
    var contentBeforeEndMargin = CGFloat(12.0)
    var iconSize = CGFloat(0.0)
    var paddingBottom = CGFloat(5.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    var titlePaddingEnd = CGFloat(0.0)
    public var debugDescription: String {
        return "NoteSize"
    }
}

struct NoteAnySize: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0)
    var closeEndMargin = CGFloat(0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(0)
    var iconSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var textTopMargin = CGFloat(0)
    var titlePaddingEnd = CGFloat(0)

    init(size: NoteSizeConfiguration) {
        self.actionTopMargin = size.actionTopMargin
        self.closeEndMargin = size.closeEndMargin
        self.closeSize = size.closeSize
        self.closeTopMargin = size.closeTopMargin
        self.contentBeforeArrangement = size.contentBeforeArrangement
        self.contentBeforeEndMargin = size.contentBeforeEndMargin
        self.iconSize = size.iconSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
        self.textTopMargin = size.textTopMargin
        self.titlePaddingEnd = size.titlePaddingEnd
    }
    var debugDescription: String {
        return "NoteAnySize"
    }
}
