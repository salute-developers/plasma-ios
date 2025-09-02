import SwiftUI

enum MenuItem: String, CaseIterable {
    case typography
    case gradient
    
    var title: String {
        switch self {
        case .gradient:
            "Градиенты"
        case .typography:
            "Шрифты и типографика"
        }
    }
    
    @ViewBuilder var view: some View {
        switch self {
        case .gradient:
            GradientView()
        case .typography:
            TypographyView()
        }
    }
}

struct MainView: View {
    @State private var selectedItem: MenuItem?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MenuItem.allCases, id: \.self) { item in
                    NavigationLink(destination: item.view) {
                        Text(item.title)
                    }
                }
            }
        }
    }
}
