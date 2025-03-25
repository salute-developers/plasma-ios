import Foundation
import SwiftUI

public struct SDDSScrollbar: View {
    public let hasTrack: Bool
    public let thumbHeight: CGFloat
    public let thumbWidth: CGFloat
    public let trackWidth: CGFloat
    public let thumbYOffset: CGFloat
    
    public init(
        hasTrack: Bool,
        thumbHeight: CGFloat,
        thumbWidth: CGFloat,
        trackWidth: CGFloat,
        thumbYOffset: CGFloat
    ) {
        self.hasTrack = hasTrack
        self.thumbHeight = thumbHeight
        self.thumbWidth = thumbWidth
        self.trackWidth = trackWidth
        self.thumbYOffset = thumbYOffset
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            thumb
//                .offset(
//                    x: 0,
//                    y: thumbYOffset
//                )
            if hasTrack {
                track
            }
        }
    }
    
    @ViewBuilder
    private var thumb: some View {
        Rectangle()
            .foregroundColor(Color.gray)
            .frame(width: thumbWidth, height: thumbHeight)
    }
    
    private var track: some View {
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.2))
            .frame(width: trackWidth)
    }
}
