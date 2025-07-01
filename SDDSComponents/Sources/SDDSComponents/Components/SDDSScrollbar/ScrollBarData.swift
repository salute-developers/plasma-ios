import Foundation
import SDDSThemeCore
import SwiftUI

public struct ScrollBarData {
    public let hasTrack: Bool
    public let hoverExpand: Bool
    public let applyScrollViewHeight: Bool
    public let offsetY: CGFloat
    public let totalHeight: CGFloat
    public let scrollBarThickness: CGFloat
    public let scrollBarPaddingTop: CGFloat
    public let scrollBarPaddingBottom: CGFloat
    public let scrollBarPaddingEnd: CGFloat
    public let scrollBarTrackColor: ColorToken
    public let scrollBarThumbColor: ColorToken
    public let contentInsetTop: CGFloat
    
    public init(
         hasTrack: Bool = true,
         hoverExpand: Bool = true,
         applyScrollViewHeight: Bool = false,
         offsetY: CGFloat,
         totalHeight: CGFloat,
         scrollBarThickness: CGFloat,
         scrollBarPaddingTop: CGFloat,
         scrollBarPaddingBottom: CGFloat,
         scrollBarPaddingEnd: CGFloat,
         scrollBarTrackColor: ColorToken,
         scrollBarThumbColor: ColorToken,
         contentInsetTop: CGFloat
    ) {
        self.hasTrack = hasTrack
        self.hoverExpand = hoverExpand
        self.offsetY = offsetY
        self.totalHeight = totalHeight
        self.applyScrollViewHeight = applyScrollViewHeight
        self.scrollBarThickness = scrollBarThickness
        self.scrollBarPaddingTop = scrollBarPaddingTop
        self.scrollBarPaddingBottom = scrollBarPaddingBottom
        self.scrollBarPaddingEnd = scrollBarPaddingEnd
        self.scrollBarTrackColor = scrollBarTrackColor
        self.scrollBarThumbColor = scrollBarThumbColor
        self.contentInsetTop = contentInsetTop
    }
}
