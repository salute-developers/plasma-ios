import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct FormItemSize {
    static let `default` = FormItemSizeDefault()

    static let all: [FormItemSizeConfiguration] = [
        FormItemSize.`default`,
    ] 
}
struct FormItemSizeDefault: FormItemSizeConfiguration {
    var captionPadding = CGFloat(4.0)
    var counterPadding = CGFloat(4.0)
    var hintHeight = CGFloat(14.0)
    var hintWidth = CGFloat(16.0)
    var indicatorOffset = CGPoint.zero
    var titleBlockPadding = CGFloat(4.0)
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
