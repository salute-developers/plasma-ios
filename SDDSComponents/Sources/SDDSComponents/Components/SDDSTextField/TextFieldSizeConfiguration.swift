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
    var indicatorSize: CGSize { get }
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
    
    func indicatorPadding(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement, layout: TextFieldLayout) -> CGFloat
    func indicatorYOffset(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement, layout: TextFieldLayout) -> CGFloat
}
