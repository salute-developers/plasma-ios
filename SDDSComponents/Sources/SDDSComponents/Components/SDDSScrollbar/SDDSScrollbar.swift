import Foundation
import SwiftUI

public enum ScrollbarLayoutOrientation {
    case v
    case h
}

public struct TrackSize {
    let length: CGFloat
}

public struct SDDSScrollbar: View {
//    public let visibility: Bool
    public let hasTrack: Bool
    public let orientation: ScrollbarLayoutOrientation
    public let trackSize: TrackSize
    
    public init(hasTrack: Bool, orientation: ScrollbarLayoutOrientation, trackSize: TrackSize) {
        self.hasTrack = hasTrack
        self.orientation = orientation
        self.trackSize = trackSize
    }
    
    public var body: some View {
        switch orientation {
        case .h:
            HStack {
                indicator
            }
        case .v:
            VStack {
                
            }
        }
    }
    
    @ViewBuilder
    private var indicator: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(width: 5, height: 25)
            if hasTrack {
                track
            }
        }
        .cornerRadius(5)
    }
    
    private var track: some View {
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.2))
            .frame(width: 5, height: 100)
    }
}

#Preview {
    SDDSScrollbar(
        hasTrack: true,
        orientation: .h,
        trackSize: TrackSize(length: 0))
}
