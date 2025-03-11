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
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(16.0)
    var boxPaddingTop = CGFloat(16.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var dividerHeight = CGFloat(1.0)
    var fieldHeight = CGFloat(56.0)
    var iconActionPadding = CGFloat(10.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var iconPadding = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var textAfterLeadingPadding = CGFloat(6.0)
    var textAfterTrailingPadding = CGFloat(0)
    var textBeforeLeadingPadding = CGFloat(0)
    var textBeforeTrailingPadding = CGFloat(6.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeM: TextFieldSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(12.0)
    var boxPaddingTop = CGFloat(12.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var dividerHeight = CGFloat(1.0)
    var fieldHeight = CGFloat(48.0)
    var iconActionPadding = CGFloat(8.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var iconPadding = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var textAfterLeadingPadding = CGFloat(6.0)
    var textAfterTrailingPadding = CGFloat(0)
    var textBeforeLeadingPadding = CGFloat(0)
    var textBeforeTrailingPadding = CGFloat(6.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeS: TextFieldSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(8.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var dividerHeight = CGFloat(1.0)
    var fieldHeight = CGFloat(40.0)
    var iconActionPadding = CGFloat(6.0)
    var iconActionSize = CGSize(width:24.0, height:24.0)
    var iconPadding = CGFloat(4.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var textAfterLeadingPadding = CGFloat(6.0)
    var textAfterTrailingPadding = CGFloat(0)
    var textBeforeLeadingPadding = CGFloat(0)
    var textBeforeTrailingPadding = CGFloat(6.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}
struct TextFieldClearSizeXs: TextFieldSizeConfiguration {
    var boxLeadingPadding = CGFloat(0.0)
    var boxPaddingBottom = CGFloat(8.0)
    var boxPaddingTop = CGFloat(8.0)
    var boxTrailingPadding = CGFloat(0.0)
    var captionTopPadding = CGFloat(4.0)
    var chipContainerHorizontalPadding = CGFloat(6.0)
    var chipsPadding = CGFloat(6.0)
    var cornerRadius = CGFloat(0)
    var dividerHeight = CGFloat(1.0)
    var fieldHeight = CGFloat(32.0)
    var iconActionPadding = CGFloat(4.0)
    var iconActionSize = CGSize(width:16.0, height:16.0)
    var iconPadding = CGFloat(4.0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(4.0)
    var textAfterLeadingPadding = CGFloat(6.0)
    var textAfterTrailingPadding = CGFloat(0)
    var textBeforeLeadingPadding = CGFloat(0)
    var textBeforeTrailingPadding = CGFloat(6.0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)
    public var debugDescription: String {
        return "TextFieldClearSize"
    }
}

struct TextFieldClearAnySize: TextFieldSizeConfiguration {
    var boxLeadingPadding = CGFloat(0)
    var boxPaddingBottom = CGFloat(0)
    var boxPaddingTop = CGFloat(0)
    var boxTrailingPadding = CGFloat(0)
    var captionTopPadding = CGFloat(0)
    var chipContainerHorizontalPadding = CGFloat(0)
    var chipsPadding = CGFloat(0)
    var cornerRadius = CGFloat(0)
    var dividerHeight = CGFloat(0)
    var fieldHeight = CGFloat(0)
    var iconActionPadding = CGFloat(0)
    var iconActionSize = CGSize.zero
    var iconPadding = CGFloat(0)
    var iconSize = CGSize.zero
    var indicatorOffset = CGPoint.zero
    var indicatorSize = CGSize.zero
    var optionalPadding = CGFloat(0)
    var textAfterLeadingPadding = CGFloat(0)
    var textAfterTrailingPadding = CGFloat(0)
    var textBeforeLeadingPadding = CGFloat(0)
    var textBeforeTrailingPadding = CGFloat(0)
    var titleBottomPadding = CGFloat(0)
    var titleInnerPadding = CGFloat(0)

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
