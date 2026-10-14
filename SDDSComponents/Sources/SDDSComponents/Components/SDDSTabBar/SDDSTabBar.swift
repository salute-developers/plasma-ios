import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSTabBar` представляет собой компонент для отображения панели навигации с табами внизу экрана.

 - Parameters:
    - items: Массив элементов табов (TabBarItemData)
    - selectedIndex: Binding к текущему выбранному индексу таба
    - type: Тип таб-бара (`.bar` или `.island`) с соответствующим appearance
    - onTabSelected: Callback при выборе таба (опционально)

 ## Окружение

 - `tabBarAppearance` / `tabBarAppearance`: внешний вид соответствующего типа,
   когда appearance не передан явно
 - `colorScheme`: Цветовая схема (light/dark)
 - `safeAreaInsets`: Отступы безопасной зоны устройства

 ## Особенности
 - `.bar` заполняет нижнюю safe area фоновым цветом и рисует divider сверху
 - `.island` отступает от краёв экрана и скругляется сверху и снизу
 - Поддерживает настраиваемые размеры и отступы для элементов
 - Поддержка кастомных иконок и текста для каждого таба

 ## Примеры использования

 ```swift
 // Таб-бар во всю ширину
 SDDSTabBar(
     items: tabBarItems,
     selectedIndex: $selectedIndex,
     type: .bar(appearance: TabBar.m.default.appearance)
 )

 // Островной таб-бар с кастомным callback
 SDDSTabBar(
     items: tabBarItems,
     selectedIndex: $selectedIndex,
     type: .island(appearance: TabBarIsland.m.default.appearance),
     onTabSelected: { index in
         print("Выбран таб: \(index)")
     }
 )
 ```
 */
public struct SDDSTabBar: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    @State private var contentSize: CGSize = .zero
    private let type: TabBarType
    private let items: [TabBarItemData]
    @Binding private var selectedIndex: Int
    private let onTabSelected: ((Int) -> Void)?

    public init(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        type: TabBarType,
        onTabSelected: ((Int) -> Void)? = nil
    ) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.type = type
        self.onTabSelected = onTabSelected
    }

    public var body: some View {
        switch type {
        case .bar(let appearance):
            bar(appearance: appearance)
        case .island(let appearance):
            island(appearance: appearance)
        }
    }

    // MARK: - Bar

    @ViewBuilder
    private func bar(appearance: TabBarAppearance) -> some View {
        VStack(spacing: 0) {
            content(
                itemSpacing: appearance.size.itemSpacing,
                contentPaddingStart: appearance.size.contentPaddingStart,
                contentPaddingEnd: appearance.size.contentPaddingEnd,
                contentPaddingTop: appearance.size.contentPaddingTop,
                contentPaddingBottom: appearance.size.contentPaddingBottom,
                tabBarItemAppearance: appearance.tabBarItemAppearance
            )

            Rectangle()
                .fill(.clear)
                .frame(maxWidth: .infinity)
                .frame(height: safeAreaInsets.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(background(color: appearance.backgroundColor))
        .shape(pathDrawer: topPathDrawer(for: appearance.size.topShape))
        .readSize { size in
            self.contentSize = size
        }
        .background {
            Rectangle()
                .fill(appearance.dividerColor.color(for: colorScheme, subtheme: subtheme))
                .frame(height: appearance.size.dividerThickness + contentSize.height)
                .shape(pathDrawer: topPathDrawer(for: appearance.size.topShape))
        }
        .shadow(appearance.shadow)
    }

    // MARK: - Island

    @ViewBuilder
    private func island(appearance: TabBarAppearance) -> some View {
        content(
            itemSpacing: appearance.size.itemSpacing,
            contentPaddingStart: appearance.size.contentPaddingStart,
            contentPaddingEnd: appearance.size.contentPaddingEnd,
            contentPaddingTop: appearance.size.contentPaddingTop,
            contentPaddingBottom: appearance.size.contentPaddingBottom,
            tabBarItemAppearance: appearance.tabBarItemAppearance
        )
        .background(islandBackground(appearance: appearance))
        .padding([.leading], appearance.size.paddingStart)
        .padding([.trailing], appearance.size.paddingEnd)
        .shadow(appearance.shadow)
    }

    /// Фон острова рисуется двумя половинами: у верхней своя форма, у нижней своя.
    @ViewBuilder
    private func islandBackground(appearance: TabBarAppearance) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                background(color: appearance.backgroundColor)
                    .shape(pathDrawer: topPathDrawer(for: appearance.size.topShape))
                    .frame(height: geometry.size.height / 2)

                background(color: appearance.backgroundColor)
                    .shape(pathDrawer: bottomPathDrawer(for: appearance.size.bottomShape, fallback: appearance.size.topShape))
                    .frame(height: geometry.size.height / 2)
                    .offset(y: geometry.size.height / 2)
            }
        }
    }

    // MARK: - Shared

    @ViewBuilder
    private func content(
        itemSpacing: CGFloat,
        contentPaddingStart: CGFloat,
        contentPaddingEnd: CGFloat,
        contentPaddingTop: CGFloat,
        contentPaddingBottom: CGFloat,
        tabBarItemAppearance: TabBarItemAppearance
    ) -> some View {
        TabBarContent(
            items: items,
            selectedIndex: $selectedIndex,
            itemSpacing: itemSpacing,
            contentPaddingStart: contentPaddingStart,
            contentPaddingEnd: contentPaddingEnd,
            contentPaddingTop: contentPaddingTop,
            contentPaddingBottom: contentPaddingBottom,
            tabBarItemAppearance: tabBarItemAppearance,
            onTabSelected: onTabSelected
        )
    }

    @ViewBuilder
    private func background(color: ColorToken) -> some View {
        Rectangle()
            .fill(color.color(for: colorScheme, subtheme: subtheme))
    }

    private func topPathDrawer(for shape: PathDrawer) -> PathDrawer {
        guard let drawer = shape as? CornerRadiusDrawer else {
            return shape
        }
        return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.top))
    }

    private func bottomPathDrawer(for shape: PathDrawer, fallback: PathDrawer) -> PathDrawer {
        guard let drawer = shape as? CornerRadiusDrawer else {
            return fallback
        }
        return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.bottom))
    }
}
