import Foundation
import SwiftUI

/**
 `SDDSCheckboxGroup` представляет собой группу чекбоксов, настроенных с помощью `CheckboxData`.
 
 - Parameters:
    - data: Массив данных для чекбоксов.
    - horizontalIndent: Горизонтальный отступ для всех элементов, начиная со второго.
    - verticalSpacing: Вертикальный отступ между элементами.
 */
public struct SDDSCheckboxGroup: View {
    let data: [CheckboxData]
    let horizontalIndent: CGFloat
    let verticalSpacing: CGFloat
    
    public var body: some View {
        HierarchicalList(data: data, horizontalIndent: horizontalIndent, verticalSpacing: verticalSpacing) { item in
            SDDSCheckbox(data: item)
        }
    }
}

// Пример данных и конфигурации для предварительного просмотра
struct SDDSCheckboxGroupPreview: PreviewProvider {
    static var previews: some View {
        let sampleData = (0..<5).map { index in
            CheckboxData(
                state: .constant(.deselected),
                title: "Label",
                subtitle: "Description",
                isEnabled: true,
                images: SelectionControlStateImages.checkbox,
                size: SDDSCheckboxSize(),
                appearance: CheckboxAppearance.defaultExample,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSCheckboxGroup(data: sampleData, horizontalIndent: 64, verticalSpacing: 8)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("SDDSCheckboxGroup")
            .padding()
            .debug()
    }
}
