import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSNavigationBar_Simple: View {
    var body: some View {
        SDDSNavigationBar(
            type: .mainPage(appearance: NavigationBarMainPage.hasBackground.appearance),
            title: "Главная",
            textPlacement: .bottom,
            textAlign: .center,
            contentPlacement: .bottom,
            actionStart: { EmptyView() },
            actionEnd: { EmptyView() },
            content: { Text("Контент") }
        )
    }
}
