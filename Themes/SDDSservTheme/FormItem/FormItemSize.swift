import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct FormItemSize {
    static let l = FormItemSizeL()
    static let m = FormItemSizeM()
    static let s = FormItemSizeS()
    static let xs = FormItemSizeXs()

    static let all: [FormItemSizeConfiguration] = [
        FormItemSize.l,
        FormItemSize.m,
        FormItemSize.s,
        FormItemSize.xs,
    ] 
}
struct FormItemSizeL: FormItemSizeConfiguration {
    var captionPadding = CGFloat(5.0)
    var counterPadding = CGFloat(5.0)
    var hintHeight = CGFloat(24.0)
    var hintWidth = CGFloat(24.0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(16.0)
    var titleBlockSpacing = CGFloat(4.0)
    var titleBlockWidth = CGFloat(0)
    var titleCaptionPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "FormItemSize"
    }
}
struct FormItemSizeM: FormItemSizeConfiguration {
    var captionPadding = CGFloat(5.0)
    var counterPadding = CGFloat(5.0)
    var hintHeight = CGFloat(24.0)
    var hintWidth = CGFloat(24.0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(14.0)
    var titleBlockSpacing = CGFloat(4.0)
    var titleBlockWidth = CGFloat(0)
    var titleCaptionPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "FormItemSize"
    }
}
struct FormItemSizeS: FormItemSizeConfiguration {
    var captionPadding = CGFloat(5.0)
    var counterPadding = CGFloat(5.0)
    var hintHeight = CGFloat(24.0)
    var hintWidth = CGFloat(24.0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(12.0)
    var titleBlockSpacing = CGFloat(4.0)
    var titleBlockWidth = CGFloat(0)
    var titleCaptionPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "FormItemSize"
    }
}
struct FormItemSizeXs: FormItemSizeConfiguration {
    var captionPadding = CGFloat(5.0)
    var counterPadding = CGFloat(5.0)
    var hintHeight = CGFloat(14.0)
    var hintWidth = CGFloat(16.0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(8.0)
    var titleBlockSpacing = CGFloat(4.0)
    var titleBlockWidth = CGFloat(0)
    var titleCaptionPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "FormItemSize"
    }
}

struct FormItemAnySize: FormItemSizeConfiguration {
    var captionPadding = CGFloat(0)
    var counterPadding = CGFloat(0)
    var hintHeight = CGFloat(0)
    var hintWidth = CGFloat(0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(0)
    var titleBlockSpacing = CGFloat(0)
    var titleBlockWidth = CGFloat(0)
    var titleCaptionPadding = CGFloat(0)

    init(size: FormItemSizeConfiguration) {
        self.captionPadding = size.captionPadding
        self.counterPadding = size.counterPadding
        self.hintHeight = size.hintHeight
        self.hintWidth = size.hintWidth
        self.indicatorOffset = size.indicatorOffset
        self.titleBlockPadding = size.titleBlockPadding
        self.titleBlockSpacing = size.titleBlockSpacing
        self.titleBlockWidth = size.titleBlockWidth
        self.titleCaptionPadding = size.titleCaptionPadding
    }
    var debugDescription: String {
        return "FormItemAnySize"
    }
}
