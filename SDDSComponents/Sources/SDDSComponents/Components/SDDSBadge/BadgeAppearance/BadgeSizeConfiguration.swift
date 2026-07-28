import SwiftUI
import Foundation
import SDDSThemeCore

public protocol BadgeSizeConfiguration {
    var height: CGFloat { get }
    var startPadding: CGFloat { get }
    var endPadding: CGFloat { get }
    var startContentSize: CGSize { get }
    // sdds:apiName=startContentMargin
    var startContentPadding: CGFloat { get }
    var endContentSize: CGSize { get }
    // sdds:apiName=endContentMargin
    var endContentPadding: CGFloat { get }
    // sdds:apiName=shape
    var cornerRadius: CGFloat { get }
}

struct DefaultBadgeSize: BadgeSizeConfiguration {
    var height: CGFloat = 0
    var startPadding: CGFloat = 0
    var endPadding: CGFloat = 0
    var startContentSize: CGSize = .zero
    var startContentPadding: CGFloat = 0
    var endContentSize: CGSize = .zero
    var endContentPadding: CGFloat = 0
    var cornerRadius: CGFloat = 0
    
    init() {}
}
