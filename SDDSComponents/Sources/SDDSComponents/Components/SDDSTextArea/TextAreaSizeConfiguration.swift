import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var boxLeadingPadding: CGFloat { get }
    var boxTrailingPadding: CGFloat { get }
    func boxPaddingBottom(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat
    func boxPaddingTop(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat
    var captionTopPadding: CGFloat { get }
    var captionBottomPadding: CGFloat { get }
    var optionalPadding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconActionPadding: CGFloat { get }
    var indicatorSize: CGSize { get }
    var iconActionSize: CGSize { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var lineWidth: CGFloat { get }
    var chipGroupHeight: CGFloat { get }
    var iconActionClearTrailingPadding: CGFloat { get }
    var chipsPadding: CGFloat { get }
    
    var fieldHeight: CGFloat { get }
    func indicatorOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGPoint
}
