import SwiftUI

/**
 `SDDSImage` displays a resizable `SwiftUI.Image` constrained by an aspect ratio from ``ImageAppearance`` (typically from generated theme variations).

 - Parameters:
   - image: Image content to display.
   - appearance: Optional appearance; defaults to ``EnvironmentValues/imageAppearance``.
 */
public struct SDDSImage: View {
    private let image: Image
    private let _appearance: ImageAppearance?

    @Environment(\.imageAppearance) private var environmentAppearance

    public init(image: Image, appearance: ImageAppearance? = nil) {
        self.image = image
        self._appearance = appearance
    }

    private var appearance: ImageAppearance {
        _appearance ?? environmentAppearance
    }

    private var aspectRatio: CGFloat {
        let w = max(appearance.size.ratioWidth, CGFloat.leastNonzeroMagnitude)
        let h = max(appearance.size.ratioHeight, CGFloat.leastNonzeroMagnitude)
        return w / h
    }

    public var body: some View {
        image
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
    }
}
