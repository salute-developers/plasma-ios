import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextFieldSizeConfiguration: CustomDebugStringConvertible {
    // sdds:apiName=labelPadding
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    // sdds:apiName=boxPaddingStart
    var boxLeadingPadding: CGFloat { get }
    // sdds:apiName=boxPaddingEnd
    var boxTrailingPadding: CGFloat { get }
    // sdds:apiName=helperTextPadding
    var captionTopPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    // sdds:apiName=shape
    var cornerRadius: CGFloat { get }
    // sdds:apiName=startContentPadding
    var iconPadding: CGFloat { get }
    // sdds:apiName=endContentPadding
    var iconActionPadding: CGFloat { get }
    // sdds:apiName=boxMinHeight
    var fieldHeight: CGFloat { get }
    // sdds:apiName=startContentSize
    var iconSize: CGSize { get }
    // sdds:apiName=endContentSize
    var iconActionSize: CGSize { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var dividerHeight: CGFloat { get }
    var textBeforeLeadingPadding: CGFloat { get }
    var textBeforeTrailingPadding: CGFloat { get }
    var textAfterLeadingPadding: CGFloat { get }
    var textAfterTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    var indicatorOffset: CGPoint { get }
    var indicatorSize: CGSize { get }
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
