import Foundation
import SwiftUI
import SDDSApiInfo

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    @ApiName("labelPadding")
    var titleBottomPadding: CGFloat { get }
    @ApiName("labelPadding")
    var titleInnerPadding: CGFloat { get }
    @ApiName("boxPaddingStart")
    var boxLeadingPadding: CGFloat { get }
    @ApiName("boxPaddingEnd")
    var boxTrailingPadding: CGFloat { get }
    var boxPaddingBottom: CGFloat { get }
    var boxPaddingTop: CGFloat { get }
    @ApiName("helperTextPadding")
    var captionTopPadding: CGFloat { get }
    @ApiName("helperTextPadding")
    var captionBottomPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    @ApiName("shape")
    var cornerRadius: CGFloat { get }
    @ApiName("endContentPadding")
    var iconActionPadding: CGFloat { get }
    @ApiValue("size(endContentSize, endContentSize)")
    var iconActionSize: CGSize { get }
    @ApiName("chipsPadding")
    var chipContainerHorizontalPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    @ApiName("boxMinHeight")
    var fieldHeight: CGFloat { get }
    @ApiValue("point(indicatorOffsetX, indicatorOffsetY)")
    var indicatorOffset: CGPoint { get }
    @ApiValue("size(indicatorSize, indicatorSize)")
    var indicatorSize: CGSize { get }
    var endContentPadding: CGFloat { get }
    var scrollBarThickness: CGFloat { get }
    var scrollBarPaddingTop: CGFloat { get }
    var scrollBarPaddingBottom: CGFloat { get }
    var scrollBarPaddingEnd: CGFloat { get }
}

public struct ZeroTextAreaSize: TextAreaSizeConfiguration {
    public var boxPaddingBottom: CGFloat { 0 }
    public var boxPaddingTop: CGFloat { 0 }
    public var chipContainerHorizontalPadding: CGFloat { 0 }
    public var titleBottomPadding: CGFloat { 0 }
    public var titleInnerPadding: CGFloat { 0 }
    public var boxLeadingPadding: CGFloat { 0 }
    public var boxTrailingPadding: CGFloat { 0 }
    public var captionTopPadding: CGFloat { 0 }
    public var captionBottomPadding: CGFloat { 0 }
    public var optionalPadding: CGFloat { 0 }
    public var cornerRadius: CGFloat { 0 }
    public var iconActionPadding: CGFloat { 0 }
    public var iconActionSize: CGSize { .zero }
    public var textBeforeLeadingPadding: CGFloat { 0 }
    public var textBeforeTrailingPadding: CGFloat { 0 }
    public var textAfterLeadingPadding: CGFloat { 0 }
    public var textAfterTrailingPadding: CGFloat { 0 }
    public var textHorizontalPadding: CGFloat { 0 }
    public var chipGroupVerticalTopPadding: CGFloat { 0 }
    public var chipGroupVerticalBottomPadding: CGFloat { 0 }
    public var chipsPadding: CGFloat { 0 }
    public var fieldHeight: CGFloat { 0 }
    public var indicatorSize: CGSize { .zero }
    public var indicatorOffset: CGPoint { .zero }
    public var endContentPadding: CGFloat { 0 }
    public var scrollBarThickness: CGFloat { 0 }
    public var scrollBarPaddingTop: CGFloat { 0 }
    public var scrollBarPaddingBottom: CGFloat { 0 }
    public var scrollBarPaddingEnd: CGFloat { 0 }

    public var debugDescription: String {
        "ZeroTextAreaSize with all zero values."
    }

    public init() {}
}
