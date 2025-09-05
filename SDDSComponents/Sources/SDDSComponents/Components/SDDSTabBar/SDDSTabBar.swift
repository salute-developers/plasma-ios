import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSTabBar` представляет собой компонент для отображения панели навигации с табами внизу экрана.

 - Parameters:
    - items: Массив элементов табов (TabBarItemData)
    - selectedIndex: Binding к текущему выбранному индексу таба
    - appearance: Параметры внешнего вида таб-бара (опционально)
    - onTabSelected: Callback при выборе таба (опционально)

 ## Окружение
 
 - `tabBarAppearance`: Стандартные настройки внешнего вида таб-бара
 - `colorScheme`: Цветовая схема (light/dark)
 - `safeAreaInsets`: Отступы безопасной зоны устройства

 ## Особенности
 - Автоматически заполняет нижнюю safe area фоновым цветом
 - Поддерживает настраиваемые размеры и отступы для элементов
 - Включает divider сверху с правильной формой компонента
 - Адаптивный дизайн с учетом скругленных углов
 - Поддержка кастомных иконок и текста для каждого таба

 ## Примеры использования

 ```swift
 // Базовый таб-бар
 SDDSTabBar(
     items: tabBarItems,
     selectedIndex: $selectedIndex,
     appearance: TabBar.m.default.appearance
 )
 
 // Таб-бар с кастомным callback
 SDDSTabBar(
     items: tabBarItems,
     selectedIndex: $selectedIndex,
     appearance: TabBar.l.accent.appearance,
     onTabSelected: { index in
         print("Выбран таб: \(index)")
     }
 )
 ```
 */
public struct SDDSTabBar: View {
    @Environment(\.tabBarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @State private var contentSize: CGSize = .zero
    private let _appearance: TabBarAppearance?
    private let items: [TabBarItemData]
    @Binding private var selectedIndex: Int
    private let onTabSelected: ((Int) -> Void)?
    
    public init(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        appearance: TabBarAppearance? = nil,
        onTabSelected: ((Int) -> Void)? = nil
    ) {
        self.items = items
        self._selectedIndex = selectedIndex
        self._appearance = appearance
        self.onTabSelected = onTabSelected
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            TabBarContent(
                items: items,
                selectedIndex: $selectedIndex,
                itemSpacing: appearance.size.itemSpacing,
                contentPaddingStart: appearance.size.contentPaddingStart,
                contentPaddingEnd: appearance.size.contentPaddingEnd,
                contentPaddingTop: appearance.size.contentPaddingTop,
                contentPaddingBottom: appearance.size.contentPaddingBottom,
                tabBarItemAppearance: appearance.tabBarItemAppearance,
                onTabSelected: onTabSelected
            )
            
            Rectangle()
                .fill(appearance.backgroundColor.color(for: colorScheme))
                .frame(maxWidth: .infinity)
                .frame(height: safeAreaInsets.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: topPathDrawer)
        .readSize { size in
            self.contentSize = size
        }
        .background {
            Rectangle()
                .fill(appearance.dividerColor.color(for: colorScheme))
                .frame(height: appearance.size.dividerThickness + contentSize.height)
                .shape(pathDrawer: topPathDrawer)
        }
        .shadow(appearance.shadow)
    }
    
    // MARK: - Computed Properties
    
    private var topPathDrawer: PathDrawer {
        if let drawer = appearance.size.topShape as? CornerRadiusDrawer {
            return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.top))
        } else {
            return appearance.size.topShape
        }
    }
    
    private var appearance: TabBarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var backgroundColor: ColorToken {
        appearance.backgroundColor
    }
}
