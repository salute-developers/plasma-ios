import SwiftUI
import Foundation

struct ReadSizeModifier: ViewModifier {
    var onChange: (CGSize) -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: geometry.size)
                        .onAppear {
                            // Дополнительно вызываем onChange при появлении
                            onChange(geometry.size)
                        }
                }
            )
            .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        self.modifier(ReadSizeModifier(onChange: onChange))
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
