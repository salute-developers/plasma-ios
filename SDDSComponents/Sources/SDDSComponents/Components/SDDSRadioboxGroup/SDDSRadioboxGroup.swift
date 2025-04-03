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
    - appearance: Параметры внешнего вида
 */
public struct SDDSRadioboxGroup: View {
    let radioboxData: [RadioboxData]
    @available(*, deprecated, message: "use 'appearance' instead")
    let size: RadioboxGroupSizeConfiguration
    private var _appearance: RadioboxGroupAppearance?
    @Environment(\.radioboxGroupAppearance) private var environmentAppearance

    public init(
        radioboxData: [RadioboxData],
        size: RadioboxGroupSizeConfiguration,
        appearance: RadioboxGroupAppearance? = nil
    ) {
        self.radioboxData = radioboxData
        self.size = size
        self._appearance = appearance
    }

    public var body: some View {
        VStack(spacing: appearance.size.verticalSpacing / 2) {
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
    
    var appearance: RadioboxGroupAppearance {
        _appearance ?? environmentAppearance
    }
}
