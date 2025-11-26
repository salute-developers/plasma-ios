import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSTabBarItem<Content: View, Extra: View>: View {
    @Environment(\.tabBarItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    private let _appearance: TabBarItemAppearance?
    let content: Content
    let selectedContent: Content
    let text: String
    let isSelected: Bool
    let extra: Extra
    let contentWidth: CGFloat?
    let disableText: Bool
    
    @State private var extraSize = CGSize.zero
    @State private var itemSize = CGSize.zero
    
    public init(
        @ViewBuilder content: () -> Content,
        @ViewBuilder selectedContent: () -> Content,
        text: String,
        isSelected: Bool = false,
        contentWidth: CGFloat? = nil,
        disableText: Bool = false,
        appearance: TabBarItemAppearance? = nil,
        @ViewBuilder extra: () -> Extra = { EmptyView() }
    ) {
        self.content = content()
        self.selectedContent = selectedContent()
        self.text = text
        self.isSelected = isSelected
        self.contentWidth = contentWidth
        self.disableText = disableText
        self._appearance = appearance
        self.extra = extra()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Spacer()
                .frame(height: appearance.size.paddingTop)
            
            if appearance.size.labelPlacement == .top {
                label
                
                Spacer()
                    .frame(height: appearance.size.labelPadding)
            }
            
            ZStack(alignment: .top) {
                Group {
                    if isSelected {
                        selectedContent
                    } else {
                        content
                    }
                }
                .foregroundColor(iconColor.color(for: colorScheme, subtheme: subtheme))
                .frame(width: contentWidth ?? appearance.size.iconSize, height: appearance.size.iconSize)
                
                extra
                    .environment(\.indicatorAppearance, appearance.indicatorAppearance ?? .defaultValue)
                    .environment(\.counterAppearance, appearance.counterAppearance ?? .defaultValue)
                    .readSize { size in
                        self.extraSize = size
                    }
                    .frame(maxWidth: itemSize.width)
                    .offset(
                        x: calculateExtraOffsetX(),
                        y: -extraSize.height / 2
                    )
            }

            if appearance.size.labelPlacement == .bottom {
                Spacer()
                    .frame(height: appearance.size.labelPadding)
                label
            }
            
            Spacer()
                .frame(height: appearance.size.paddingBottom)
        }
        .frame(minHeight: appearance.size.minHeight)
        .background(
            backgroundColor.color(for: colorScheme, subtheme: subtheme)
                .shape(pathDrawer: appearance.size.shape)
        )
        .readSize { size in
            self.itemSize = size
        }
    }
    
    @ViewBuilder
    private var label: some View {
        if disableText {
            EmptyView()
        } else {
            Text(text)
                .typography(labelTypography)
                .foregroundColor(labelColor.color(for: colorScheme, subtheme: subtheme))
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Computed Properties
    
    private var labelTypography: TypographyToken {
        appearance.labelTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var backgroundColor: ColorToken {
        isSelected ? ColorToken.clearColor : appearance.backgroundColor.defaultColor
    }
    
    private var iconColor: ColorToken {
        isSelected ? appearance.iconColor.selectedColor : appearance.iconColor.defaultColor
    }
    
    private var labelColor: ColorToken {
        isSelected ? appearance.labelColor.selectedColor : appearance.labelColor.defaultColor
    }
    
    var appearance: TabBarItemAppearance {
        _appearance ?? environmentAppearance
    }
    
    // MARK: - Helper Methods
    
    private func calculateExtraOffsetX() -> CGFloat {
        let iconWidth = appearance.size.iconSize
        let itemWidth = itemSize.width
        let extraWidth = extraSize.width
        
        // Если extra помещается в иконку, центрируем его в правом верхнем углу иконки
        if extraWidth <= iconWidth {
            return iconWidth / 2
        } else {
            // Если extra не помещается, центрируем его по всей ширине TabBarItem
            return (itemWidth - extraWidth) / 2
        }
    }
}

// MARK: - Convenience Initializers

extension SDDSTabBarItem where Extra == EmptyView {
    public init(
        @ViewBuilder content: () -> Content,
        @ViewBuilder selectedContent: () -> Content,
        text: String,
        isSelected: Bool = false,
        appearance: TabBarItemAppearance? = nil
    ) {
        self.init(
            content: content,
            selectedContent: selectedContent,
            text: text,
            isSelected: isSelected,
            appearance: appearance,
            extra: { EmptyView() }
        )
    }
}

extension SDDSTabBarItem where Content == AnyView, Extra == AnyView {
    /// Инициализатор, принимающий TabBarItemData
    public init(
        data: TabBarItemData,
        isSelected: Bool = false
    ) {
        self.init(
            content: { data.content ?? AnyView(EmptyView()) },
            selectedContent: { data.selectedContent ?? data.content ?? AnyView(EmptyView()) },
            text: data.text,
            isSelected: data.allowSelection ? isSelected : false,
            contentWidth: data.contentWidth,
            disableText: data.disableText,
            appearance: data.appearance,
            extra: { data.extra ?? AnyView(EmptyView()) }
        )
    }
}
