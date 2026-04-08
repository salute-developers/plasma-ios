import SwiftUI

/// Defaults for ``SDDSIcon`` (fill and optional square size).
public struct SDDSIconEnvironment: Equatable {
    public var fillStyle: FillStyle
    /// When non-nil, used as width and height if the icon does not pass an explicit side length.
    public var defaultSize: CGFloat?

    public init(fillStyle: FillStyle = .color(.titleColor), defaultSize: CGFloat? = 24) {
        self.fillStyle = fillStyle
        self.defaultSize = defaultSize
    }
}

private struct SDDSIconEnvironmentKey: EnvironmentKey {
    static let defaultValue = SDDSIconEnvironment()
}

public extension EnvironmentValues {
    var sddsIconEnvironment: SDDSIconEnvironment {
        get { self[SDDSIconEnvironmentKey.self] }
        set { self[SDDSIconEnvironmentKey.self] = newValue }
    }
}
