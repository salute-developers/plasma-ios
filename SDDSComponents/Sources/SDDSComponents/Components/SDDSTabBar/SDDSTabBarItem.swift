import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSTabBarItem<Content: View, Extra: View>: View {
    @Environment(\.tabBarItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let _appearance: TabBarItemAppearance?
    let content: Content
    let selectedContent: Content
    let text: String
    let isSelected: Bool
    let extra: Extra
    
    @State private var extraSize = CGSize.zero
    @State private var itemSize = CGSize.zero
    
    public init(
        @ViewBuilder content: () -> Content,
        @ViewBuilder selectedContent: () -> Content,
        text: String,
        isSelected: Bool = false,
        appearance: TabBarItemAppearance? = nil,
        @ViewBuilder extra: () -> Extra = { EmptyView() }
    ) {
        self.content = content()
        self.selectedContent = selectedContent()
        self.text = text
        self.isSelected = isSelected
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
                .foregroundColor(iconColor.color(for: colorScheme))
                .frame(width: appearance.size.iconSize, height: appearance.size.iconSize)
                
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
        .frame(maxWidth: .infinity)
        .frame(minHeight: appearance.size.minHeight)
        .background(
            backgroundColor.color(for: colorScheme)
                .shape(pathDrawer: appearance.size.shape)
        )
        .readSize { size in
            self.itemSize = size
        }
    }
    
    @ViewBuilder
    private var label: some View {
        Text(text)
            .typography(labelTypography)
            .foregroundColor(labelColor.color(for: colorScheme))
            .multilineTextAlignment(.center)
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
            isSelected: isSelected,
            appearance: data.appearance,
            extra: { data.extra ?? AnyView(EmptyView()) }
        )
    }
}
