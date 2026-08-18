import Foundation
import SwiftUI
import SDDSApiInfo

/// Определяет конфигурацию размеров текстового поля.
public protocol TextFieldSizeConfiguration: CustomDebugStringConvertible {
    @ApiName("labelPadding")
    var titleBottomPadding: CGFloat { get }
    @ApiName("labelPadding")
    var titleInnerPadding: CGFloat { get }
    @ApiName("boxPaddingStart")
    var boxLeadingPadding: CGFloat { get }
    @ApiName("boxPaddingEnd")
    var boxTrailingPadding: CGFloat { get }
    @ApiName("helperTextPadding")
    var captionTopPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    @ApiName("shape")
    var cornerRadius: CGFloat { get }
    @ApiName("startContentPadding")
    var iconPadding: CGFloat { get }
    @ApiName("endContentPadding")
    var iconActionPadding: CGFloat { get }
    @ApiName("boxMinHeight")
    var fieldHeight: CGFloat { get }
    @ApiName("startContentSize")
    @ApiValue("size(startContentSize, startContentSize)")
    var iconSize: CGSize { get }
    @ApiName("endContentSize")
    @ApiValue("size(endContentSize, endContentSize)")
    var iconActionSize: CGSize { get }
    @ApiName("chipsPadding")
    var chipContainerHorizontalPadding: CGFloat { get }
    @ApiValue("CGFloat(1.0)", zero: "CGFloat(0)")
    var dividerHeight: CGFloat { get }
    @ApiValue("CGFloat(0)", zero: "CGFloat(0)")
    var textBeforeLeadingPadding: CGFloat { get }
    @ApiName("prefixPadding")
    var textBeforeTrailingPadding: CGFloat { get }
    @ApiName("suffixPadding")
    var textAfterLeadingPadding: CGFloat { get }
    @ApiValue("CGFloat(0)", zero: "CGFloat(0)")
    var textAfterTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    @ApiValue("point(indicatorOffsetX, indicatorOffsetY)")
    var indicatorOffset: CGPoint { get }
    @ApiValue("size(indicatorSize, indicatorSize)")
    var indicatorSize: CGSize { get }
    @ApiName("boxPaddingBottom")
    var boxPaddingTop: CGFloat { get }
    var boxPaddingBottom: CGFloat { get }
}

public struct ZeroTextFieldSize: TextFieldSizeConfiguration {
    public var titleBottomPadding: CGFloat { 0 }
    public var titleInnerPadding: CGFloat { 0 }
    public var boxLeadingPadding: CGFloat { 0 }
    public var boxTrailingPadding: CGFloat { 0 }
    public var captionTopPadding: CGFloat { 0 }
    public var optionalPadding: CGFloat { 0 }
    public var cornerRadius: CGFloat { 0 }
    public var iconPadding: CGFloat { 0 }
    public var iconActionPadding: CGFloat { 0 }
    public var fieldHeight: CGFloat { 0 }
    public var iconSize: CGSize { .zero }
    public var iconActionSize: CGSize { .zero }
    public var chipContainerHorizontalPadding: CGFloat { 0 }
    public var dividerHeight: CGFloat { 0 }
    public var textBeforeLeadingPadding: CGFloat { 0 }
    public var textBeforeTrailingPadding: CGFloat { 0 }
    public var textAfterLeadingPadding: CGFloat { 0 }
    public var textAfterTrailingPadding: CGFloat { 0 }
    public var chipsPadding: CGFloat { 0 }
    public var indicatorOffset: CGPoint { .zero }
    public var indicatorSize: CGSize { .zero }
    public var boxPaddingTop: CGFloat { 0 }
    public var boxPaddingBottom: CGFloat { 0 }

    public init() {}

    public var debugDescription: String {
        "ZeroTextFieldSize"
    }
}
