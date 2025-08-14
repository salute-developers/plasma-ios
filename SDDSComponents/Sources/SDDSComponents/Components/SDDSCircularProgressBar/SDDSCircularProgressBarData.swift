import Foundation
import SwiftUI

public struct SDDSCircularProgressBarData {
    public var progress: Double
    public var suffix: String
    public var hasTrack: Bool
    public var content: AnyView?
    public var appearance: CircularProgressBarAppearance?
    
    public init(progress: Double = 0, suffix: String = "%", hasTrack: Bool = false, content: AnyView? = nil, appearance: CircularProgressBarAppearance? = nil) {
        self.progress = progress
        self.suffix = suffix
        self.hasTrack = hasTrack
        self.content = content
        self.appearance = appearance
    }
}

extension SDDSCircularProgressBarData: EnvironmentKey {
    public static var defaultValue: SDDSCircularProgressBarData? = nil
}

public extension EnvironmentValues {
    var circularProgressBarData: SDDSCircularProgressBarData? {
        get { self[SDDSCircularProgressBarData.self] }
        set { self[SDDSCircularProgressBarData.self] = newValue }
    }
}
