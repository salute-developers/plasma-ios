import SwiftUI

public struct SDDSDropdownMenu<Content: View>: View {
    @Environment(\.dropDownMenuAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: DropdownMenuAppearance?
    private let content: Content
    
    public init(
        @ViewBuilder content: @escaping () -> (Content),
        appearance: DropdownMenuAppearance? = nil
    ) {
        self.content = content()
        self._appearance = appearance
    }
    
    public var body: some View {
        content
            .applyIfLet(appearance.dividerAppearance) { content, appearance in
                content.environment(\.dividerAppearance, appearance)
            }
            .background(appearance.backgroundColor.color(for: colorScheme))
            .shadow(appearance.shadow)
    }
    
    var appearance: DropdownMenuAppearance {
        _appearance ?? environmentAppearance
    }
}
