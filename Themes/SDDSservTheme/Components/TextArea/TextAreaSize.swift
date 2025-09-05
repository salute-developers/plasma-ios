import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaSize {
    static let l = TextAreaSizeL()
    static let m = TextAreaSizeM()
    static let s = TextAreaSizeS()
    static let xl = TextAreaSizeXl()
    static let xs = TextAreaSizeXs()

    static let all: [TextAreaSizeConfiguration] = [
        TextAreaSize.l,
        TextAreaSize.m,
        TextAreaSize.s,
        TextAreaSize.xl,
        TextAreaSize.xs,
    ] 
}
struct TextAreaSizeL: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(16.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(16.0)
    var boxTrailingPadding = CGFloat(16.0)
    var captionBottomPadding = CGFloat(12.0)
    var captionTopPadding = CGFloat(12.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundM.cornerRadius+2.0
    var endContentPadding = CGFloat(10.0)
    var fieldHeight = CGFloat(56.0)
    var iconActionPadding = CGFloat(10.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var scrollBarPaddingBottom = CGFloat(36.0)
    var scrollBarPaddingEnd = CGFloat(2.0)
    var scrollBarPaddingTop = CGFloat(18.0)
    var scrollBarThickness = CGFloat(2.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeM: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(14.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(12.0)
    var boxTrailingPadding = CGFloat(14.0)
    var captionBottomPadding = CGFloat(12.0)
    var captionTopPadding = CGFloat(12.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var endContentPadding = CGFloat(8.0)
    var fieldHeight = CGFloat(48.0)
    var iconActionPadding = CGFloat(8.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var scrollBarPaddingBottom = CGFloat(36.0)
    var scrollBarPaddingEnd = CGFloat(2.0)
    var scrollBarPaddingTop = CGFloat(18.0)
    var scrollBarThickness = CGFloat(2.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeS: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(12.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(12.0)
    var captionBottomPadding = CGFloat(12.0)
    var captionTopPadding = CGFloat(12.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var endContentPadding = CGFloat(6.0)
    var fieldHeight = CGFloat(40.0)
    var iconActionPadding = CGFloat(6.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var scrollBarPaddingBottom = CGFloat(36.0)
    var scrollBarPaddingEnd = CGFloat(2.0)
    var scrollBarPaddingTop = CGFloat(18.0)
    var scrollBarThickness = CGFloat(2.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeXl: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(20.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(12.0)
    var boxTrailingPadding = CGFloat(18.0)
    var captionBottomPadding = CGFloat(12.0)
    var captionTopPadding = CGFloat(12.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundL.cornerRadius
    var endContentPadding = CGFloat(10.0)
    var fieldHeight = CGFloat(56.0)
    var iconActionPadding = CGFloat(10.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var scrollBarPaddingBottom = CGFloat(36.0)
    var scrollBarPaddingEnd = CGFloat(2.0)
    var scrollBarPaddingTop = CGFloat(18.0)
    var scrollBarThickness = CGFloat(2.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeXs: TextAreaSizeConfiguration {
    var boxLeadingPadding = CGFloat(8.0)
    var boxPaddingBottom = CGFloat(8.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(8.0)
    var captionBottomPadding = CGFloat(8.0)
    var captionTopPadding = CGFloat(8.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var endContentPadding = CGFloat(4.0)
    var fieldHeight = CGFloat(32.0)
    var iconActionPadding = CGFloat(4.0)
    var iconActionSize = CGSize(width:16.0, height:16.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var scrollBarPaddingBottom = CGFloat(36.0)
    var scrollBarPaddingEnd = CGFloat(2.0)
    var scrollBarPaddingTop = CGFloat(18.0)
    var scrollBarThickness = CGFloat(2.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}

struct TextAreaAnySize: TextAreaSizeConfiguration {
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
    var scrollBarPaddingBottom = CGFloat(0)
    var scrollBarPaddingEnd = CGFloat(0)
    var scrollBarPaddingTop = CGFloat(0)
    var scrollBarThickness = CGFloat(0)
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
        self.scrollBarPaddingBottom = size.scrollBarPaddingBottom
        self.scrollBarPaddingEnd = size.scrollBarPaddingEnd
        self.scrollBarPaddingTop = size.scrollBarPaddingTop
        self.scrollBarThickness = size.scrollBarThickness
        self.titleBottomPadding = size.titleBottomPadding
        self.titleInnerPadding = size.titleInnerPadding
    }
    var debugDescription: String {
        return "TextAreaAnySize"
    }
}
