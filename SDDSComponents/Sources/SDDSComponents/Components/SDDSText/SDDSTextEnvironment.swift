import SwiftUI

/// Shared defaults for ``SDDSText`` (fill, truncation, alignment). Override via ``EnvironmentValues/sddsTextEnvironment``.
public struct SDDSTextEnvironment: Equatable {
    public var fillStyle: FillStyle
    public var lineLimit: Int?
    public var minimumScaleFactor: CGFloat?
    public var multilineTextAlignment: TextAlignment
    public var truncationMode: Text.TruncationMode

    public init(
        fillStyle: FillStyle = .color(.titleColor),
        lineLimit: Int? = nil,
        minimumScaleFactor: CGFloat? = 1,
        multilineTextAlignment: TextAlignment = .leading,
        truncationMode: Text.TruncationMode = .tail
    ) {
        self.fillStyle = fillStyle
        self.lineLimit = lineLimit
        self.minimumScaleFactor = minimumScaleFactor
        self.multilineTextAlignment = multilineTextAlignment
        self.truncationMode = truncationMode
    }
}

private struct SDDSTextEnvironmentKey: EnvironmentKey {
    static let defaultValue = SDDSTextEnvironment()
}

public extension EnvironmentValues {
    var sddsTextEnvironment: SDDSTextEnvironment {
        get { self[SDDSTextEnvironmentKey.self] }
        set { self[SDDSTextEnvironmentKey.self] = newValue }
    }
}
