import SwiftUI

public extension View {
    /// Добавляет TabBar внизу view с фоном, который заполняет нижнюю safe area
    /// - Parameters:
    ///   - items: Массив TabBarItemData для отображения
    ///   - selectedIndex: Binding к текущему выбранному индексу таба
    ///   - appearance: TabBarAppearance для стилизации
    /// - Returns: View с TabBar, расположенным внизу
    func tabBar(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        appearance: TabBarAppearance
    ) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                self
                
                VStack(spacing: 0) {
                    SDDSTabBar(
                        items: items,
                        selectedIndex: selectedIndex,
                        appearance: appearance
                    )
                    .environment(\.safeAreaInsets, geometry.safeAreaInsets)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }

    }
}
