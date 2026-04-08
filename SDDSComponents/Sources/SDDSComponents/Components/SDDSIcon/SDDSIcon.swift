import SwiftUI

/**
 ``SDDSIcon`` wraps `SwiftUI.Image` with ``FillStyle`` tint/gradient. Use ``EnvironmentValues/sddsIconEnvironment`` for defaults.
 */
public struct SDDSIcon: View {
    private let source: SDDSImageSource
    private let fillStyle: FillStyle?
    private let sideLength: CGFloat?

    @Environment(\.sddsIconEnvironment) private var iconEnvironment

    public init(
        source: SDDSImageSource,
        fillStyle: FillStyle? = nil,
        sideLength: CGFloat? = nil
    ) {
        self.source = source
        self.fillStyle = fillStyle
        self.sideLength = sideLength
    }

    public init(
        _ image: Image,
        fillStyle: FillStyle? = nil,
        sideLength: CGFloat? = nil
    ) {
        self.init(source: .image(image), fillStyle: fillStyle, sideLength: sideLength)
    }

    private var resolvedFill: FillStyle {
        fillStyle ?? iconEnvironment.fillStyle
    }

    private var resolvedSide: CGFloat? {
        sideLength ?? iconEnvironment.defaultSize
    }

    public var body: some View {
        iconImage
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .applyFrame(side: resolvedSide)
            .fillForeground(style: resolvedFill)
    }

    private var iconImage: Image {
        switch source {
        case .image(let image):
            image
        case .asset(let name, let bundle):
            Image(name, bundle: bundle)
        case .systemSymbol(let name):
            Image(systemName: name)
        }
    }
}

private extension View {
    @ViewBuilder
    func applyFrame(side: CGFloat?) -> some View {
        if let side {
            frame(width: side, height: side)
        } else {
            self
        }
    }
}
