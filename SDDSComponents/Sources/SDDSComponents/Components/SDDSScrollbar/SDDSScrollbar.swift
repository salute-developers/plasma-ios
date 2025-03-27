import Foundation
import SwiftUI

public struct SDDSScrollbar: View {
    public let hasTrack: Bool
    public let thumbLength: CGFloat
    public let trackThickness: CGFloat
    public let thumbOffsetY: CGFloat
    private let trackColor: Color
    private let thumbColor: Color
    
    public init(
        hasTrack: Bool,
        thumbLength: CGFloat,
        trackThickness: CGFloat,
        thumbOffsetY: CGFloat,
        trackColor: Color,
        thumbColor: Color
    ) {
        self.hasTrack = hasTrack
        self.thumbLength = thumbLength
        self.trackThickness = trackThickness
        self.thumbOffsetY = thumbOffsetY
        self.trackColor = trackColor
        self.thumbColor = thumbColor
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            if hasTrack {
                track
            }
            thumb
                .offset(
                    x: 0,
                    y: thumbOffsetY
                )
        }
    }
    
    private var thumb: some View {
        baseScrollBar
            .foregroundColor(thumbColor)
            .frame(height: thumbLength)
    }
    
    private var track: some View {
        baseScrollBar
            .foregroundColor(trackColor)
    }
    
    private var baseScrollBar: some View {
        RoundedRectangle(cornerRadius: trackThickness / 2)
    }
}
