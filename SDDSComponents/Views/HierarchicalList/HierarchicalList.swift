import Foundation
import SwiftUI

/**
 `HierarchicalList` представляет собой контейнер для отображения иерархической структуры с элементами, которые могут быть любыми вью.
 
 - Parameters:
 - items: Массив элементов, содержащих данные и представление.
 - horizontalIndent: Отступ слева для каждого уровня иерархии, начиная со второго элемента.
 - verticalSpacing: Вертикальное расстояние между элементами.
 */
struct HierarchicalList<Data: Hashable, Content: View>: View {
    let data: [Data]
    let horizontalIndent: CGFloat
    let verticalSpacing: CGFloat
    let content: (Data) -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: verticalSpacing) {
            ForEach(Array(data.enumerated()), id: \.element) { index, item in
                content(item)
                    .padding(.leading, index == 0 ? 0 : horizontalIndent)
            }
        }
    }
}

/**
 `HierarchicalListItem` представляет собой элемент иерархической структуры, содержащий данные и представление.
 
 - Properties:
 - view: Вью, которое будет отображаться в списке.
 */
struct HierarchicalListItem<ItemView: View> {
    public let view: ItemView
    
    public init(view: ItemView) {
        self.view = view
    }
}
