import SwiftUI

public extension View {
    /// Добавляет TabBar внизу view.
    ///
    /// Для `.bar` фон заполняет нижнюю safe area, `.island` отступает от краёв.
    /// - Parameters:
    ///   - items: Массив TabBarItemData для отображения
    ///   - selectedIndex: Binding к текущему выбранному индексу таба
    ///   - type: Тип таб-бара с соответствующим appearance
    ///   - subtheme: SubthemeData для применения субтемы
    /// - Returns: View с TabBar, расположенным внизу
    func tabBar(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        type: TabBarType,
        subtheme: SubthemeData = SubthemeData()
    ) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                self

                VStack(spacing: 0) {
                    SDDSTabBar(
                        items: items,
                        selectedIndex: selectedIndex,
                        type: type
                    )
                    .environment(\.safeAreaInsets, geometry.safeAreaInsets)
                    .environment(\.subtheme, subtheme)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
