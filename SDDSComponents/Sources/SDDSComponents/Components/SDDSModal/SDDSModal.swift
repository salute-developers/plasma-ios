import SwiftUI
import SDDSIcons
@_exported import SDDSThemeCore

public struct SDDSModal<Content: View>: View {
    private let content: () -> Content
    private let closeImage: Image
    private let appearance: ModalAppearance
    private let useNativeBlackout: Bool
    private let onClose: () -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        @ViewBuilder content: @escaping () -> Content,
        closeImage: Image = Asset.close36.image,
        appearance: ModalAppearance,
        useNativeBlackout: Bool = true,
        onClose: @escaping () -> Void
    ) {
        self.content = content
        self.closeImage = closeImage
        self.appearance = appearance
        self.useNativeBlackout = useNativeBlackout
        self.onClose = onClose
    }
    
    public var body: some View {
        ZStack(alignment: .topTrailing) {
            if useNativeBlackout {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture(perform: onClose)
            }
            
            ZStack(alignment: .topTrailing) {
                content()
                
                Button(action: onClose) {
                    closeImage
                        .renderingMode(.template)
                        .frame(width: appearance.size.closeSize, height: appearance.size.closeSize)
                        .foregroundColor(appearance.closeColor.color(for: colorScheme))
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
} 
