import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var fieldHorizontalPadding: CGFloat { get }
    var captionTopPadding: CGFloat { get }
    var captionBottomPadding: CGFloat { get }
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
    
    func fieldHeight(layout: TextAreaLayout) -> CGFloat
    func indicatorPadding(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat
    func indicatorYOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat
}
