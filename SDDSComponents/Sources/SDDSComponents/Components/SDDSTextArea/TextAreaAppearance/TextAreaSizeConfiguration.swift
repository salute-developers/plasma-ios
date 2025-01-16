import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var boxLeadingPadding: CGFloat { get }
    var boxTrailingPadding: CGFloat { get }
    var captionTopPadding: CGFloat { get }
    var captionBottomPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    var textInputPaddings: EdgeInsets { get }
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconActionPadding: CGFloat { get }
    var indicatorSize: CGSize { get }
    var iconActionSize: CGSize { get }
    var multipleValueHorizontalPadding: CGFloat { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var lineWidth: CGFloat { get }
    var textBeforeLeadingPadding: CGFloat { get }
    var textBeforeTrailingPadding: CGFloat { get }
    var textAfterLeadingPadding: CGFloat { get }
    var textAfterTrailingPadding: CGFloat { get }
    var textHorizontalPadding: CGFloat { get }
    var chipGroupHeight: CGFloat { get }
    var chipGroupVerticalTopPadding: CGFloat { get }
    var chipGroupVerticalBottomPadding: CGFloat { get }
    var textInputBottomPadding: CGFloat { get }
    var iconActionClearTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    
    func fieldHeight(layout: TextAreaLayout) -> CGFloat
    func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGPoint
}

public struct ZeroTextAreaSize: TextAreaSizeConfiguration {
    public var titleBottomPadding: CGFloat { 0 }
    public var titleInnerPadding: CGFloat { 0 }
    public var boxLeadingPadding: CGFloat { 0 }
    public var boxTrailingPadding: CGFloat { 0 }
    public var captionTopPadding: CGFloat { 0 }
    public var captionBottomPadding: CGFloat { 0 }
    public var optionalPadding: CGFloat { 0 }
    public var textInputPaddings: EdgeInsets { .init() }
    public var cornerRadius: CGFloat { 0 }
    public var borderWidth: CGFloat { 0 }
    public var iconActionPadding: CGFloat { 0 }
    public var indicatorSize: CGSize { .zero }
    public var iconActionSize: CGSize { .zero }
    public var multipleValueHorizontalPadding: CGFloat { 0 }
    public var chipContainerHorizontalPadding: CGFloat { 0 }
    public var lineWidth: CGFloat { 0 }
    public var textBeforeLeadingPadding: CGFloat { 0 }
    public var textBeforeTrailingPadding: CGFloat { 0 }
    public var textAfterLeadingPadding: CGFloat { 0 }
    public var textAfterTrailingPadding: CGFloat { 0 }
    public var textHorizontalPadding: CGFloat { 0 }
    public var chipGroupHeight: CGFloat { 0 }
    public var chipGroupVerticalTopPadding: CGFloat { 0 }
    public var chipGroupVerticalBottomPadding: CGFloat { 0 }
    public var textInputBottomPadding: CGFloat { 0 }
    public var iconActionClearTrailingPadding: CGFloat { 0 }
    public var chipsPadding: CGFloat { 0 }
    
    public func fieldHeight(layout: TextAreaLayout) -> CGFloat {
        0
    }

    public func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGPoint {
        .zero
    }

    public var debugDescription: String {
        "ZeroTextAreaSize with all zero values."
    }

    public init() {}
}
