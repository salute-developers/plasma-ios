import SwiftUI

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
                    appearance: data.appearance,
                    accessibility: data.accessibility
                )
            }
        }
    }
}
