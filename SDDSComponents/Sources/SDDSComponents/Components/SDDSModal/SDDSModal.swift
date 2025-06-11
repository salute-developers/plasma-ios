import SwiftUI
@_exported import SDDSIcons
@_exported import SDDSThemeCore

public struct SDDSModal<Content: View>: View {
    private let content: () -> Content
    private let closeImage: Image?
    private let appearance: ModalAppearance
    private let onClose: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        @ViewBuilder content: @escaping () -> Content,
        closeImage: Image? = Asset.close36.image,
        appearance: ModalAppearance,
        onClose: @escaping () -> Void
    ) {
        self.content = content
        self.closeImage = closeImage
        self.appearance = appearance
        self.onClose = onClose
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            content()
            
            if let closeImage = closeImage {
                Button(action: onClose) {
                    closeImage
                        .renderingMode(.template)
                        .frame(width: appearance.size.closeSize, height: appearance.size.closeSize)
                        .foregroundColor(appearance.closeColor.color(for: colorScheme))
                }
            }
        }
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .background(appearance.backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: appearance.size.shape)
        .shadow(appearance.size.shadow)
    }
} 
