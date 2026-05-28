import SwiftUI

public struct SDDSFormVertical<Content: View>: View {
    private let _appearance: FormItemAppearance?
    private let verticalSpacing: CGFloat
    private let horizontalAlignment: HorizontalAlignment
    private let content: () -> Content

    public init(
        appearance: FormItemAppearance? = nil,
        verticalSpacing: CGFloat = 4,
        horizontalAlignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._appearance = appearance
        self.verticalSpacing = verticalSpacing
        self.horizontalAlignment = horizontalAlignment
        self.content = content
    }

    public var body: some View {
        VStack(alignment: horizontalAlignment, spacing: verticalSpacing) {
            content()
        }
        .environment(\.formItemAppearance, appearance)
    }

    private var appearance: FormItemAppearance {
        _appearance ?? .defaultValue
    }
}
