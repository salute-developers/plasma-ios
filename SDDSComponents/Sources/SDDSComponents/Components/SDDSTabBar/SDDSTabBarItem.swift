import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSTabBarItem<Content: View, Extra: View>: View {
    @Environment(\.tabBarItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let _appearance: TabBarItemAppearance?
    let content: Content
    let text: String
    let isSelected: Bool
    let extra: Extra
    
    public init(
        @ViewBuilder content: () -> Content,
        text: String,
        isSelected: Bool = false,
        appearance: TabBarItemAppearance? = nil,
        @ViewBuilder extra: () -> Extra = { EmptyView() }
    ) {
        self.content = content()
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
            
            ZStack(alignment: .topTrailing) {
                content
                    .frame(width: appearance.size.iconSize, height: appearance.size.iconSize)
                    .foregroundColor(iconColor.color(for: colorScheme))
                
                extra
                    .applyIfLet(appearance.indicatorAppearance) { extra, indicatorAppearance in
                        extra.environment(\.indicatorAppearance, indicatorAppearance)
                    }
                    .applyIfLet(appearance.counterAppearance) { extra, counterAppearance in
                        extra.environment(\.counterAppearance, counterAppearance)
                    }
                    .position(
                        x: appearance.size.iconSize,
                        y: 0
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
        .background(backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: appearance.size.shape)
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
        isSelected ? appearance.backgroundColor.selectedColor : appearance.backgroundColor.defaultColor
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
}

// MARK: - Convenience Initializers

extension SDDSTabBarItem where Extra == EmptyView {
    public init(
        @ViewBuilder content: () -> Content,
        text: String,
        isSelected: Bool = false,
        appearance: TabBarItemAppearance? = nil
    ) {
        self.init(
            content: content,
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
            text: data.text,
            isSelected: isSelected,
            appearance: data.appearance,
            extra: { data.extra ?? AnyView(EmptyView()) }
        )
    }
}
