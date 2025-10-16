import Foundation

struct WheelProps: MergeableConfiguration, Codable {
    typealias Props = WheelProps
    
    // Цвета текста
    var itemTextColor: ColorKeyValue?
    var itemTextAfterColor: ColorKeyValue?
    var descriptionColor: ColorKeyValue?
    
    // Цвета иконок управления
    var controlIconUpColor: ColorKeyValue?
    var controlIconDownColor: ColorKeyValue?
    
    // Цвет разделителя
    var separatorColor: ColorKeyValue?
    
    // Типографика
    var itemTextStyle: KeyValue<String>?
    var itemTextAfterStyle: KeyValue<String>?
    var descriptionStyle: KeyValue<String>?
    
    // Размеры и отступы
    var itemTextAfterPadding: KeyValue<Double>?
    var itemMinSpacing: KeyValue<Double>?
    var descriptionPadding: KeyValue<Double>?
    var separatorSpacing: KeyValue<Double>?
    
    // Выравнивание
    var itemAlignment: KeyValue<String>?
    
    // Иконки
    var controlIconUp: KeyValue<String>?
    var controlIconDown: KeyValue<String>?
    
    // Вложенный компонент
    var dividerStyle: ComponentStyleKeyValue<DividerProps>?
}
