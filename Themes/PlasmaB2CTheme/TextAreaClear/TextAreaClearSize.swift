import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaClearSize {
    static let l = TextAreaClearSizeL()
    static let m = TextAreaClearSizeM()
    static let s = TextAreaClearSizeS()
    static let xl = TextAreaClearSizeXl()
    static let xs = TextAreaClearSizeXs()

    static let all: [TextAreaSizeConfiguration] = [
        TextAreaClearSize.l,
        TextAreaClearSize.m,
        TextAreaClearSize.s,
        TextAreaClearSize.xl,
        TextAreaClearSize.xs,
    ] 
}
struct TextAreaClearSizeL: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(16.0)
    var boxPaddingTop = CGFloat(16.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionBottomPadding = CGFloat(4.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(10.0)
    var fieldHeight = CGFloat(56.0)
    var iconActionPadding = CGFloat(10.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaClearSize"
    }
}
struct TextAreaClearSizeM: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(12.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionBottomPadding = CGFloat(4.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(8.0)
    var fieldHeight = CGFloat(48.0)
    var iconActionPadding = CGFloat(8.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaClearSize"
    }
}
struct TextAreaClearSizeS: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(8.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionBottomPadding = CGFloat(4.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(6.0)
    var fieldHeight = CGFloat(40.0)
    var iconActionPadding = CGFloat(6.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaClearSize"
    }
}
struct TextAreaClearSizeXl: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(21.0)
    var boxPaddingTop = CGFloat(21.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionBottomPadding = CGFloat(4.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(10.0)
    var fieldHeight = CGFloat(64.0)
    var iconActionPadding = CGFloat(10.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaClearSize"
    }
}
struct TextAreaClearSizeXs: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(8.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionBottomPadding = CGFloat(4.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(4.0)
    var fieldHeight = CGFloat(32.0)
    var iconActionPadding = CGFloat(4.0)
    var iconActionSize = CGSize(width:16.0, height:16.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaClearSize"
    }
}

struct TextAreaClearAnySize: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(0)
    var boxPaddingBottom = CGFloat(0)
    var boxPaddingTop = CGFloat(0)
    var boxTrailingPadding = CGFloat(0)
    var captionBottomPadding = CGFloat(0)
    var captionTopPadding = CGFloat(0)
    var chipContainerHorizontalPadding = CGFloat(0)
    var chipsPadding = CGFloat(0)
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(0)
    var fieldHeight = CGFloat(0)
    var iconActionPadding = CGFloat(0)
    var iconActionSize = CGSize.zero
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)

    init(size: TextAreaSizeConfiguration) {
        self.boxLeadingPadding = size.boxLeadingPadding
        self.boxPaddingBottom = size.boxPaddingBottom
        self.boxPaddingTop = size.boxPaddingTop
        self.boxTrailingPadding = size.boxTrailingPadding
        self.captionBottomPadding = size.captionBottomPadding
        self.captionTopPadding = size.captionTopPadding
        self.chipContainerHorizontalPadding = size.chipContainerHorizontalPadding
        self.chipsPadding = size.chipsPadding
        self.cornerRadius = size.cornerRadius
        self.endContentPadding = size.endContentPadding
        self.fieldHeight = size.fieldHeight
        self.iconActionPadding = size.iconActionPadding
        self.iconActionSize = size.iconActionSize
        self.indicatorOffset = size.indicatorOffset
        self.indicatorSize = size.indicatorSize
        self.optionalPadding = size.optionalPadding
        self.titleBottomPadding = size.titleBottomPadding
        self.titleInnerPadding = size.titleInnerPadding
    }
    var debugDescription: String {
        return "TextAreaClearAnySize"
    }
}
