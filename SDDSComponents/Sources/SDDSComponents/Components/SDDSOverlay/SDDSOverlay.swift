import SwiftUI

public struct SDDSOverlay<Content: View>: View {
    @Binding public var isPresented: Bool
    private let _appearance: OverlayAppearance?
    private let content: () -> Content
    
    @Environment(\.overlayAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    public init(
        isPresented: Binding<Bool> = .constant(false),
        appearance: OverlayAppearance? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isPresented = isPresented
        self._appearance = appearance
        self.content = content
    }
    
    public var body: some View {
        if isPresented {
            content()
                .background(appearance.backgroundColor.color(for: colorScheme))
                .blur(radius: appearance.blurRadius)
                .overlay {
                    Color.clear
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .allowsHitTesting(appearance.blurRadius == 0 ? true : false)
        } else {
            content()
        }
    }
    
    private var appearance: OverlayAppearance {
        _appearance ?? environmentAppearance
    }
}
