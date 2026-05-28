import SwiftUI

public struct SDDSFormHorizontal<Content: View>: View {
    private let _appearance: FormItemAppearance?
    private let horizontalSpacing: CGFloat
    private let verticalAlignment: VerticalAlignment
    private let content: () -> Content

    public init(
        appearance: FormItemAppearance? = nil,
        horizontalSpacing: CGFloat = 4,
        verticalAlignment: VerticalAlignment = .top,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._appearance = appearance
        self.horizontalSpacing = horizontalSpacing
        self.verticalAlignment = verticalAlignment
        self.content = content
    }

    public var body: some View {
        HStack(alignment: verticalAlignment, spacing: horizontalSpacing) {
            content()
        }
        .environment(\.formItemAppearance, appearance)
    }

    private var appearance: FormItemAppearance {
        _appearance ?? .defaultValue
    }
}
