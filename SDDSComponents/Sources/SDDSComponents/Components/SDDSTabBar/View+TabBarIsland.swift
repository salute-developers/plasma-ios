import SwiftUI

public extension View {
    /// Добавляет TabBarIsland внизу view
    /// - Parameters:
    ///   - items: Массив TabBarItemData для отображения
    ///   - selectedIndex: Binding к текущему выбранному индексу таба
    ///   - appearance: TabBarAppearance для стилизации
    /// - Returns: View с TabBarIsland, расположенным внизу
    func tabBarIsland(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        appearance: TabBarIslandAppearance
    ) -> some View {
        ZStack(alignment: .bottom) {
            self
            
            VStack(spacing: 0) {
                SDDSTabBarIsland(
                    items: items,
                    selectedIndex: selectedIndex,
                    appearance: appearance
                )
            }
        }
    }
}
