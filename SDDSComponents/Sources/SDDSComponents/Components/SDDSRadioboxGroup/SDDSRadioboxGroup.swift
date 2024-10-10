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
 `RadioboxGroupSizeConfiguration` задает конфигурацию размеров`.
 
 - Parameters:
    - verticalSpacing: Вертикальный отступ между элементами.
 */
public protocol RadioboxGroupSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var verticalSpacing: CGFloat { get }
}

/**
 `SDDSRadioboxGroup` представляет собой группу радиобоксов, настроенных с помощью `RadioboxData`.

 - Properties:
    - radioboxData: Массив данных для инициализации группы радиобоксов.
    - size: Конфигурация размеров
 */
public struct SDDSRadioboxGroup: View {
    let radioboxData: [RadioboxData]
    let size: RadioboxGroupSizeConfiguration

    public init(
        radioboxData: [RadioboxData],
        size: RadioboxGroupSizeConfiguration
    ) {
        self.radioboxData = radioboxData
        self.size = size
    }

    public var body: some View {
        VStack(spacing: size.verticalSpacing) {
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
