import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TextFieldClearSize {
    static let l = TextFieldClearSizeL()
    static let m = TextFieldClearSizeM()
    static let s = TextFieldClearSizeS()
    static let xs = TextFieldClearSizeXs()

    static let all: [TextFieldSizeConfiguration] = [
        TextFieldClearSize.l,
        TextFieldClearSize.m,
        TextFieldClearSize.s,
        TextFieldClearSize.xs,
    ] 
}
struct TextFieldClearSizeL: TextFieldSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0.0)
    public var boxPaddingBottom = CGFloat(16.0)
    public var boxPaddingTop = CGFloat(16.0)
    public var boxTrailingPadding = CGFloat(0.0)
    public var captionTopPadding = CGFloat(4.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = CGFloat(0)
    public var dividerHeight = CGFloat(1.0)
    public var fieldHeight = CGFloat(56.0)
    public var iconActionPadding = CGFloat(10.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var iconPadding = CGFloat(8.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var textAfterLeadingPadding = CGFloat(6.0)
    public var textAfterTrailingPadding = CGFloat(0)
    public var textBeforeLeadingPadding = CGFloat(0)
    public var textBeforeTrailingPadding = CGFloat(6.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeM: TextFieldSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0.0)
    public var boxPaddingBottom = CGFloat(12.0)
    public var boxPaddingTop = CGFloat(12.0)
    public var boxTrailingPadding = CGFloat(0.0)
    public var captionTopPadding = CGFloat(4.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = CGFloat(0)
    public var dividerHeight = CGFloat(1.0)
    public var fieldHeight = CGFloat(48.0)
    public var iconActionPadding = CGFloat(8.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var iconPadding = CGFloat(6.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var textAfterLeadingPadding = CGFloat(6.0)
    public var textAfterTrailingPadding = CGFloat(0)
    public var textBeforeLeadingPadding = CGFloat(0)
    public var textBeforeTrailingPadding = CGFloat(6.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeS: TextFieldSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0.0)
    public var boxPaddingBottom = CGFloat(8.0)
    public var boxPaddingTop = CGFloat(8.0)
    public var boxTrailingPadding = CGFloat(0.0)
    public var captionTopPadding = CGFloat(4.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = CGFloat(0)
    public var dividerHeight = CGFloat(1.0)
    public var fieldHeight = CGFloat(40.0)
    public var iconActionPadding = CGFloat(6.0)
    public var iconActionSize = CGSize(width:24.0, height:24.0)
    public var iconPadding = CGFloat(4.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var textAfterLeadingPadding = CGFloat(6.0)
    public var textAfterTrailingPadding = CGFloat(0)
    public var textBeforeLeadingPadding = CGFloat(0)
    public var textBeforeTrailingPadding = CGFloat(6.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeXs: TextFieldSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0.0)
    public var boxPaddingBottom = CGFloat(8.0)
    public var boxPaddingTop = CGFloat(8.0)
    public var boxTrailingPadding = CGFloat(0.0)
    public var captionTopPadding = CGFloat(4.0)
    public var chipContainerHorizontalPadding = CGFloat(6.0)
    public var chipsPadding = CGFloat(6.0)
    public var cornerRadius = CGFloat(0)
    public var dividerHeight = CGFloat(1.0)
    public var fieldHeight = CGFloat(32.0)
    public var iconActionPadding = CGFloat(4.0)
    public var iconActionSize = CGSize(width:16.0, height:16.0)
    public var iconPadding = CGFloat(4.0)
    public var iconSize = CGSize(width:16.0, height:16.0)
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(4.0)
    public var textAfterLeadingPadding = CGFloat(6.0)
    public var textAfterTrailingPadding = CGFloat(0)
    public var textBeforeLeadingPadding = CGFloat(0)
    public var textBeforeTrailingPadding = CGFloat(6.0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}

struct TextFieldClearAnySize: TextFieldSizeConfiguration {
    public var boxLeadingPadding = CGFloat(0)
    public var boxPaddingBottom = CGFloat(0)
    public var boxPaddingTop = CGFloat(0)
    public var boxTrailingPadding = CGFloat(0)
    public var captionTopPadding = CGFloat(0)
    public var chipContainerHorizontalPadding = CGFloat(0)
    public var chipsPadding = CGFloat(0)
    public var cornerRadius = CGFloat(0)
    public var dividerHeight = CGFloat(0)
    public var fieldHeight = CGFloat(0)
    public var iconActionPadding = CGFloat(0)
    public var iconActionSize = CGSize.zero
    public var iconPadding = CGFloat(0)
    public var iconSize = CGSize.zero
    public var indicatorOffset = CGPoint.zero
    public var indicatorSize = CGSize.zero
    public var optionalPadding = CGFloat(0)
    public var textAfterLeadingPadding = CGFloat(0)
    public var textAfterTrailingPadding = CGFloat(0)
    public var textBeforeLeadingPadding = CGFloat(0)
    public var textBeforeTrailingPadding = CGFloat(0)
    public var titleBottomPadding = CGFloat(0)
    public var titleInnerPadding = CGFloat(0)

    init(size: TextFieldSizeConfiguration) {
        self.boxLeadingPadding = size.boxLeadingPadding
        self.boxPaddingBottom = size.boxPaddingBottom
        self.boxPaddingTop = size.boxPaddingTop
        self.boxTrailingPadding = size.boxTrailingPadding
        self.captionTopPadding = size.captionTopPadding
        self.chipContainerHorizontalPadding = size.chipContainerHorizontalPadding
        self.chipsPadding = size.chipsPadding
        self.cornerRadius = size.cornerRadius
        self.dividerHeight = size.dividerHeight
        self.fieldHeight = size.fieldHeight
        self.iconActionPadding = size.iconActionPadding
        self.iconActionSize = size.iconActionSize
        self.iconPadding = size.iconPadding
        self.iconSize = size.iconSize
        self.indicatorOffset = size.indicatorOffset
        self.indicatorSize = size.indicatorSize
        self.optionalPadding = size.optionalPadding
        self.textAfterLeadingPadding = size.textAfterLeadingPadding
        self.textAfterTrailingPadding = size.textAfterTrailingPadding
        self.textBeforeLeadingPadding = size.textBeforeLeadingPadding
        self.textBeforeTrailingPadding = size.textBeforeTrailingPadding
        self.titleBottomPadding = size.titleBottomPadding
        self.titleInnerPadding = size.titleInnerPadding
    }
    var debugDescription: String {
        return "TextFieldClearAnySize"
    }
}
