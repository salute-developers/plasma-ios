import SwiftUI
import SDDSComponents

/// Универсальный конфигуратор binding-«ручек» компонента — аналог Android
/// `Editors.kt`/`ComposeStyleProvider`: по списку ``BindingProperty`` рисует
/// контрол на каждую размерность (меню для `singleChoice`, тоггл для `toggle`)
/// и обновляет map значений `values`. Резолвом стиля из этих значений
/// занимается вызывающая сторона (`<Component>Styles.resolveStyle(bindings:)`).
///
/// Верстка выровнена с ``VariationsView``/``SandboxThemeSubthemeSection``.
struct BindingConfiguratorView: View {
    let properties: [BindingProperty]
    @Binding var values: [String: String]

    var body: some View {
        ForEach(properties) { property in
            switch property.kind {
            case .singleChoice(let options):
                HStack {
                    Text(property.name)
                    Menu {
                        ForEach(options, id: \.self) { option in
                            Button(option) { values[property.name] = option }
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(values[property.name] ?? property.defaultValue)
                                .multilineTextAlignment(.trailing)
                                .padding(.trailing, 8)
                        }
                    }
                }
            case .toggle:
                Toggle(
                    property.name,
                    isOn: Binding(
                        get: { (values[property.name] ?? property.defaultValue) == "true" },
                        set: { values[property.name] = $0 ? "true" : "false" }
                    )
                )
            }
        }
    }
}
