import Foundation
import SwiftUI

public struct SDDSScrollbar: View {
    public let hasTrack: Bool
    public let thumbLength: CGFloat
    public let thumbOffsetY: CGFloat
    private let trackColor: Color
    private let thumbColor: Color
    
    public init(
        hasTrack: Bool,
        thumbLength: CGFloat,
        thumbOffsetY: CGFloat,
        trackColor: Color,
        thumbColor: Color
    ) {
        self.hasTrack = hasTrack
        self.thumbLength = thumbLength
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
        Rectangle()
            .foregroundColor(thumbColor)
            .frame(height: thumbLength)
    }
    
    private var track: some View {
        Rectangle()
            .foregroundColor(trackColor)
    }
}
