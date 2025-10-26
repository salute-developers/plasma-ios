import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteSize {
    static let l = NoteSizeL()
    static let m = NoteSizeM()
    static let s = NoteSizeS()
    static let xs = NoteSizeXs()

    static let all: [NoteSizeConfiguration] = [
        NoteSize.l,
        NoteSize.m,
        NoteSize.s,
        NoteSize.xs,
    ] 
}
struct NoteSizeL: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0.0)
    var closeEndMargin = CGFloat(0.0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(12.0)
    var iconSize = CGFloat(24.0)
    var paddingBottom = CGFloat(7.0)
    var paddingEnd = CGFloat(28.0)
    var paddingStart = CGFloat(28.0)
    var paddingTop = CGFloat(24.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var textTopMargin = CGFloat(4.0)
    var titlePaddingEnd = CGFloat(0.0)
    public var debugDescription: String {
        return "NoteSize"
    }
}
struct NoteSizeM: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0.0)
    var closeEndMargin = CGFloat(0.0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(10.0)
    var iconSize = CGFloat(24.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(24.0)
    var paddingStart = CGFloat(24.0)
    var paddingTop = CGFloat(20.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    var titlePaddingEnd = CGFloat(0.0)
    public var debugDescription: String {
        return "NoteSize"
    }
}
struct NoteSizeS: NoteSizeConfiguration {
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
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    var titlePaddingEnd = CGFloat(0.0)
    public var debugDescription: String {
        return "NoteSize"
    }
}
struct NoteSizeXs: NoteSizeConfiguration {
    var actionTopMargin = CGFloat(0.0)
    var closeEndMargin = CGFloat(0.0)
    var closeSize = CGFloat(0)
    var closeTopMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(6.0)
    var iconSize = CGFloat(16.0)
    var paddingBottom = CGFloat(3.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
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
