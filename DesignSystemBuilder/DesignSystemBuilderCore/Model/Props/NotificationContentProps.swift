import Foundation

struct NotificationContentProps: MergeableConfiguration, Codable {
    typealias Props = NotificationContentProps
    
    // Цвета для разных состояний
    var iconColor: ColorKeyValue?
    var titleColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    
    // Размеры и отступы
    var iconSize: KeyValue<Double>?
    var buttonGroupTopPadding: KeyValue<Double>?
    var textPadding: KeyValue<Double>?
    var textBoxBottomPadding: KeyValue<Double>?
    var contentTopPadding: KeyValue<Double>?
    var contentStartPadding: KeyValue<Double>?
    var contentEndPadding: KeyValue<Double>?
    var iconMargin: KeyValue<Double>?
    var textBoxStartPadding: KeyValue<Double>?
    var textBoxTopPadding: KeyValue<Double>?
    var buttonGroupStartPadding: KeyValue<Double>?
    
    // Типографика
    var titleStyle: KeyValue<String>?
    var textStyle: KeyValue<String>?
    
    // Enum значения
    var buttonLayout: KeyValue<String>?
    var iconPlacement: KeyValue<String>?
    
    // Стили вложенных компонентов
    var buttonGroupStyle: ComponentStyleKeyValue<ButtonGroupProps>?
}
