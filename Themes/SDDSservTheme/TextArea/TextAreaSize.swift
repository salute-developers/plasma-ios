import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextAreaSize {
    static let l = TextAreaSizeL()
    static let m = TextAreaSizeM()
    static let s = TextAreaSizeS()
    static let xs = TextAreaSizeXs()

    static let all: [TextAreaSizeConfiguration] = [
        TextAreaSize.l,
        TextAreaSize.m,
        TextAreaSize.s,
        TextAreaSize.xs,
    ] 
}
struct TextAreaSizeL: TextAreaSizeConfiguration {
    public var boxLeadingPadding = CGFloat(16.0)
    public var boxPaddingBottom = CGFloat(12.0)
    public var boxPaddingTop = CGFloat(16.0)
    public var boxTrailingPadding = CGFloat(16.0)
    public var captionBottomPadding = CGFloat(12.0)
    public var captionTopPadding = CGFloat(12.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = ShapeToken.roundM.cornerRadius+2.0
    public var endContentPadding = CGFloat(10.0)
    public var fieldHeight = CGFloat(56.0)
    public var iconActionPadding = CGFloat(10.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeM: TextAreaSizeConfiguration {
    public var boxLeadingPadding = CGFloat(14.0)
    public var boxPaddingBottom = CGFloat(12.0)
    public var boxPaddingTop = CGFloat(12.0)
    public var boxTrailingPadding = CGFloat(14.0)
    public var captionBottomPadding = CGFloat(12.0)
    public var captionTopPadding = CGFloat(12.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = ShapeToken.roundM.cornerRadius
    public var endContentPadding = CGFloat(8.0)
    public var fieldHeight = CGFloat(48.0)
    public var iconActionPadding = CGFloat(8.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeS: TextAreaSizeConfiguration {
    public var boxLeadingPadding = CGFloat(12.0)
    public var boxPaddingBottom = CGFloat(12.0)
    public var boxPaddingTop = CGFloat(8.0)
    public var boxTrailingPadding = CGFloat(12.0)
    public var captionBottomPadding = CGFloat(12.0)
    public var captionTopPadding = CGFloat(12.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = ShapeToken.roundM.cornerRadius
    public var endContentPadding = CGFloat(6.0)
    public var fieldHeight = CGFloat(40.0)
    public var iconActionPadding = CGFloat(6.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}
struct TextAreaSizeXs: TextAreaSizeConfiguration {
    public var boxLeadingPadding = CGFloat(8.0)
    public var boxPaddingBottom = CGFloat(8.0)
    public var boxPaddingTop = CGFloat(8.0)
    public var boxTrailingPadding = CGFloat(8.0)
    public var captionBottomPadding = CGFloat(8.0)
    public var captionTopPadding = CGFloat(8.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = ShapeToken.roundS.cornerRadius
    public var endContentPadding = CGFloat(4.0)
    public var fieldHeight = CGFloat(32.0)
    public var iconActionPadding = CGFloat(4.0)
    public var iconActionSize = CGSize(width:16.0, height:16.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextAreaSize"
    }
}

struct TextAreaAnySize: TextAreaSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0)
    public var boxPaddingBottom = CGFloat(0)
    public var boxPaddingTop = CGFloat(0)
    public var boxTrailingPadding = CGFloat(0)
    public var captionBottomPadding = CGFloat(0)
    public var captionTopPadding = CGFloat(0)
    public var chipContainerHorizontalPadding = CGFloat(0)
    public var chipsPadding = CGFloat(0)
    public var cornerRadius = CGFloat(0)
    public var endContentPadding = CGFloat(0)
    public var fieldHeight = CGFloat(0)
    public var iconActionPadding = CGFloat(0)
    public var iconActionSize = CGSize.zero
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)

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
        return "TextAreaAnySize"
    }
}
