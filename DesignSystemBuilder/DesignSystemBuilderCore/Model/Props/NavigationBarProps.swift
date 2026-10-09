import Foundation

struct NavigationBarProps: MergeableConfiguration, Codable {
    typealias Props = NavigationBarProps
    
    // Цвета
    var backIconColor: ColorKeyValue?
    var actionStartColor: ColorKeyValue?
    var actionEndColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    
    // Шрифты
    var textStyle: KeyValue<String>?
    
    // Иконка
    var backIcon: KeyValue<String>?
    
    // Размеры и отступы
    var backIconMargin: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var horizontalSpacing: KeyValue<Double>?
    var textBlockTopMargin: KeyValue<Double>?
    
    // Форма и тень
    var bottomShape: ShapeKeyValue?
    var shadow: ShadowKeyValue?
}

