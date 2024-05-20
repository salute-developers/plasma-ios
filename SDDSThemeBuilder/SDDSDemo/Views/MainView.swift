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
    @State private var path = [MenuItem]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(MenuItem.allCases, id: \.self) { item in
                    Button(item.title) {
                        path.append(item)
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { selection in
                selection.view
            }
        }
    }
}
