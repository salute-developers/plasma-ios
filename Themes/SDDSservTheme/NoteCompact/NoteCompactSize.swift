import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NoteCompactSize {
    static let l = NoteCompactSizeL()
    static let m = NoteCompactSizeM()
    static let s = NoteCompactSizeS()
    static let xs = NoteCompactSizeXs()

    static let all: [NoteCompactSizeConfiguration] = [
        NoteCompactSize.l,
        NoteCompactSize.m,
        NoteCompactSize.s,
        NoteCompactSize.xs,
    ] 
}
struct NoteCompactSizeL: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0.0)
    var actionStartMargin = CGFloat(16.0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(12.0)
    var iconSize = CGFloat(24.0)
    var paddingBottom = CGFloat(24.0)
    var paddingEnd = CGFloat(30.0)
    var paddingStart = CGFloat(30.0)
    var paddingTop = CGFloat(7.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var textTopMargin = CGFloat(4.0)
    public var debugDescription: String {
        return "NoteCompactSize"
    }
}
struct NoteCompactSizeM: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0.0)
    var actionStartMargin = CGFloat(16.0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(10.0)
    var iconSize = CGFloat(24.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(24.0)
    var paddingStart = CGFloat(24.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    public var debugDescription: String {
        return "NoteCompactSize"
    }
}
struct NoteCompactSizeS: NoteCompactSizeConfiguration {
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
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    var textTopMargin = CGFloat(2.0)
    public var debugDescription: String {
        return "NoteCompactSize"
    }
}
struct NoteCompactSizeXs: NoteCompactSizeConfiguration {
    var actionEndMargin = CGFloat(0.0)
    var actionStartMargin = CGFloat(12.0)
    var closeSize = CGFloat(0)
    var closeStartMargin = CGFloat(0.0)
    var contentBeforeArrangement = NoteCompactContentBeforeArrangement.top
    var contentBeforeEndMargin = CGFloat(6.0)
    var iconSize = CGFloat(16.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(3.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
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
