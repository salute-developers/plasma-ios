import SwiftUI

/**
 `RadioboxData` представляет собой данные для одного радиобокса.

 - Properties:
    - id: Уникальный идентификатор радиобокса.
    - title: Название радиобокса, отображаемое пользователю.
    - subtitle: Подзаголовок радиобокса, отображаемый под названием (опционально).
    - isSelected: Состояние выбранности радиобокса, привязанное к Binding.
    - isEnabled: Указывает, включен ли радиобокс.
    - images: Изображения для состояния выбранности и невыбранности радиобокса.
    - size: Конфигурация размера радиобокса.
    - appearance: Внешний вид радиобокса, определяемый `RadioboxAppearance`.
    - accessibility: Параметры доступности для радиобокса.
 */
public struct RadioboxData: Identifiable {
    public let id: UUID
    public let title: String
    public let subtitle: String?
    public let isSelected: Binding<Bool>
    public let isEnabled: Bool
    public let images: RadioboxImages
    public let size: SelectionControlSizeConfiguration
    public let appearance: RadioboxAppearance
    public let accessibility: SelectionControlAccessibility

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String? = nil,
        isSelected: Binding<Bool>,
        isEnabled: Bool = true,
        images: RadioboxImages,
        size: SelectionControlSizeConfiguration,
        appearance: RadioboxAppearance,
        accessibility: SelectionControlAccessibility
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
        self.isEnabled = isEnabled
        self.images = images
        self.size = size
        self.appearance = appearance
        self.accessibility = accessibility
    }
}

/**
 `SDDSRadioboxGroup` представляет собой группу радиобоксов, настроенных с помощью `RadioboxData`.

 - Properties:
    - radioboxData: Массив данных для инициализации группы радиобоксов.
    - verticalSpacing: Вертикальный отступ между радиобоксами в группе.
 */
public struct SDDSRadioboxGroup: View {
    let radioboxData: [RadioboxData]
    let verticalSpacing: CGFloat

    public init(
        radioboxData: [RadioboxData],
        verticalSpacing: CGFloat
    ) {
        self.radioboxData = radioboxData
        self.verticalSpacing = verticalSpacing
    }

    public var body: some View {
        VStack(spacing: verticalSpacing) {
            ForEach(radioboxData) { data in
                SDDSRadiobox(
                    isSelected: data.isSelected,
                    title: data.title,
                    subtitle: data.subtitle,
                    isEnabled: data.isEnabled,
                    images: data.images,
                    size: data.size,
                    appearance: data.appearance,
                    accessibility: data.accessibility
                )
            }
        }
    }
}

/**
 Пример для предварительного просмотра `SDDSRadioboxGroup`.
 */
struct SDDSRadioboxGroupPreview: PreviewProvider {
    static var previews: some View {
        let radioboxData = (0..<5).map { index in
            RadioboxData(
                title: "Option \(index + 1)",
                subtitle: "Description \(index + 1)",
                isSelected: .constant(index == 0),
                images: RadioboxImages.defaultImages,
                size: SDDSRadioboxSize(),
                appearance: RadioboxAppearance.defaultExample,
                accessibility: SelectionControlAccessibility()
            )
        }
        
        return SDDSRadioboxGroup(radioboxData: radioboxData, verticalSpacing: 8)
         
            .previewLayout(.sizeThatFits)
            .previewDisplayName("SDDSRadioboxGroup Preview")
    }
}
