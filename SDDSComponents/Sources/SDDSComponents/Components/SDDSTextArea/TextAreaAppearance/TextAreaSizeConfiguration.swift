import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var boxLeadingPadding: CGFloat { get }
    var boxTrailingPadding: CGFloat { get }
    func boxPaddingBottom(labelPlacement: TextAreaLabelPlacement) -> CGFloat
    func boxPaddingTop(labelPlacement: TextAreaLabelPlacement) -> CGFloat
    var captionTopPadding: CGFloat { get }
    var captionBottomPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var iconActionPadding: CGFloat { get }
    var iconActionSize: CGSize { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var lineWidth: CGFloat { get }
    var iconActionClearTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    
    var fieldHeight: CGFloat { get }
    func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGPoint
    func indicatorSize(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGSize
}

public struct ZeroTextAreaSize: TextAreaSizeConfiguration {
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
    public var lineWidth: CGFloat { 0 }
    public var textBeforeLeadingPadding: CGFloat { 0 }
    public var textBeforeTrailingPadding: CGFloat { 0 }
    public var textAfterLeadingPadding: CGFloat { 0 }
    public var textAfterTrailingPadding: CGFloat { 0 }
    public var textHorizontalPadding: CGFloat { 0 }
    public var chipGroupVerticalTopPadding: CGFloat { 0 }
    public var chipGroupVerticalBottomPadding: CGFloat { 0 }
    public var iconActionClearTrailingPadding: CGFloat { 0 }
    public var chipsPadding: CGFloat { 0 }
    public var fieldHeight: CGFloat { 0 }
    
    public func boxPaddingBottom(labelPlacement: TextAreaLabelPlacement) -> CGFloat {
        return 0
    }
    
    public func boxPaddingTop(labelPlacement: TextAreaLabelPlacement) -> CGFloat {
        return 0
    }

    public func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGPoint {
        .zero
    }
    
    public func indicatorSize(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGSize {
        .zero
    }

    public var debugDescription: String {
        "ZeroTextAreaSize with all zero values."
    }

    public init() {}
}
