import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// Пример данных и конфигурации для предварительного просмотра
struct SDDSCheckboxGroupPreview: PreviewProvider {
    static var previews: some View {
        let parentData = CheckboxData(
            state: .constant(.deselected),
            title: "Parent Label",
            subtitle: "Parent Description",
            isEnabled: true,
            images: SelectionControlStateImages.checkbox,
            size: SDDSCheckboxSize.medium,
            appearance: CheckboxAppearance.default,
            accessibility: SelectionControlAccessibility()
        )
        
        let childData = (0..<5).map { index in
            CheckboxData(
                state: .constant(.deselected),
                title: "Label \(index + 1)",
                subtitle: "Description \(index + 1)",
                isEnabled: true,
                images: SelectionControlStateImages.checkbox,
                size: SDDSCheckboxSize.medium,
                appearance: CheckboxAppearance.default,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return Group {
            SDDSCheckboxGroup(behaviour: .hierarchical(parent: parentData, child: childData), horizontalIndent: 24, verticalSpacing: 8)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("SDDSCheckboxGroup with Parent")
                .padding()
                .debug()
            
            SDDSCheckboxGroup(behaviour: .default(data: childData), horizontalIndent: 24, verticalSpacing: 8)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("SDDSCheckboxGroup without Parent")
                .padding()
                .debug()
        }
    }
}
