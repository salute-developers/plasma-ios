import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextFieldSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var boxLeadingPadding: CGFloat { get }
    var boxTrailingPadding: CGFloat { get }
    var captionTopPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconPadding: CGFloat { get }
    var iconActionPadding: CGFloat { get }
    var fieldHeight: CGFloat { get }
    var iconSize: CGSize { get }
    var iconActionSize: CGSize { get }
    var multipleValueHorizontalPadding: CGFloat { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var dividerHeight: CGFloat { get }
    var textBeforeLeadingPadding: CGFloat { get }
    var textBeforeTrailingPadding: CGFloat { get }
    var textAfterLeadingPadding: CGFloat { get }
    var textAfterTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    var chipGroupHeight: CGFloat { get }
    var chipGroupVerticalTopPadding: CGFloat { get }
    var chipGroupVerticalBottomPadding: CGFloat { get }
    func indicatorOffset(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGPoint
    func indicatorSize(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGSize
}

public struct ZeroTextFieldSize: TextFieldSizeConfiguration {
    public var titleBottomPadding: CGFloat { 0 }
    public var titleInnerPadding: CGFloat { 0 }
    public var boxLeadingPadding: CGFloat { 0 }
    public var boxTrailingPadding: CGFloat { 0 }
    public var captionTopPadding: CGFloat { 0 }
    public var optionalPadding: CGFloat { 0 }
    public var cornerRadius: CGFloat { 0 }
    public var borderWidth: CGFloat { 0 }
    public var iconPadding: CGFloat { 0 }
    public var iconActionPadding: CGFloat { 0 }
    public var indicatorSize: CGSize { .zero }
    public var fieldHeight: CGFloat { 0 }
    public var iconSize: CGSize { .zero }
    public var iconActionSize: CGSize { .zero }
    public var multipleValueHorizontalPadding: CGFloat { 0 }
    public var chipContainerHorizontalPadding: CGFloat { 0 }
    public var dividerHeight: CGFloat { 0 }
    public var textBeforeLeadingPadding: CGFloat { 0 }
    public var textBeforeTrailingPadding: CGFloat { 0 }
    public var textAfterLeadingPadding: CGFloat { 0 }
    public var textAfterTrailingPadding: CGFloat { 0 }
    public var chipsPadding: CGFloat { 0 }
    public var chipGroupHeight: CGFloat { 0 }
    public var chipGroupVerticalTopPadding: CGFloat { 0 }
    public var chipGroupVerticalBottomPadding: CGFloat { 0 }
    public func indicatorOffset(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGPoint { .zero }
    public func indicatorSize(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGSize { .zero }
    
    public init() {}

    public var debugDescription: String {
        "ZeroTextFieldSize"
    }
}

