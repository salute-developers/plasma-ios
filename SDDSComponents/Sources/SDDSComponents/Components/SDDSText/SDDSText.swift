import SwiftUI

/**
 ``SDDSText`` is a thin wrapper over `SwiftUI.Text` with DS ``FillStyle`` (color or gradient) and optional per-view overrides.
 Environment defaults: ``EnvironmentValues/sddsTextEnvironment``.
 */
public struct SDDSText: View {
    private let source: SDDSTextSource
    private let fillStyle: FillStyle?
    private let lineLimit: Int?
    private let minimumScaleFactor: CGFloat?
    private let multilineTextAlignment: TextAlignment?
    private let truncationMode: Text.TruncationMode?

    @Environment(\.sddsTextEnvironment) private var textEnvironment

    public init(
        _ source: SDDSTextSource,
        fillStyle: FillStyle? = nil,
        lineLimit: Int? = nil,
        minimumScaleFactor: CGFloat? = nil,
        multilineTextAlignment: TextAlignment? = nil,
        truncationMode: Text.TruncationMode? = nil
    ) {
        self.source = source
        self.fillStyle = fillStyle
        self.lineLimit = lineLimit
        self.minimumScaleFactor = minimumScaleFactor
        self.multilineTextAlignment = multilineTextAlignment
        self.truncationMode = truncationMode
    }

    public init(
        _ string: String,
        fillStyle: FillStyle? = nil,
        lineLimit: Int? = nil,
        minimumScaleFactor: CGFloat? = nil,
        multilineTextAlignment: TextAlignment? = nil,
        truncationMode: Text.TruncationMode? = nil
    ) {
        self.init(
            .string(string),
            fillStyle: fillStyle,
            lineLimit: lineLimit,
            minimumScaleFactor: minimumScaleFactor,
            multilineTextAlignment: multilineTextAlignment,
            truncationMode: truncationMode
        )
    }

    public init(
        _ key: LocalizedStringKey,
        fillStyle: FillStyle? = nil,
        lineLimit: Int? = nil,
        minimumScaleFactor: CGFloat? = nil,
        multilineTextAlignment: TextAlignment? = nil,
        truncationMode: Text.TruncationMode? = nil
    ) {
        self.init(
            .localized(key),
            fillStyle: fillStyle,
            lineLimit: lineLimit,
            minimumScaleFactor: minimumScaleFactor,
            multilineTextAlignment: multilineTextAlignment,
            truncationMode: truncationMode
        )
    }

    private var resolvedFill: FillStyle {
        fillStyle ?? textEnvironment.fillStyle
    }

    private var resolvedLineLimit: Int? {
        lineLimit ?? textEnvironment.lineLimit
    }

    private var resolvedMinScale: CGFloat? {
        minimumScaleFactor ?? textEnvironment.minimumScaleFactor
    }

    private var resolvedAlignment: TextAlignment {
        multilineTextAlignment ?? textEnvironment.multilineTextAlignment
    }

    private var resolvedTruncation: Text.TruncationMode {
        truncationMode ?? textEnvironment.truncationMode
    }

    @ViewBuilder
    public var body: some View {
        content
            .lineLimit(resolvedLineLimit)
            .minimumScaleFactor(resolvedMinScale ?? 1)
            .multilineTextAlignment(resolvedAlignment)
            .truncationMode(resolvedTruncation)
            .fillForeground(style: resolvedFill)
    }

    @ViewBuilder
    private var content: some View {
        switch source {
        case .string(let value):
            Text(value)
        case .localized(let key):
            Text(key)
        case .attributed(let value):
            Text(value)
        case .text(let text):
            text
        }
    }
}
