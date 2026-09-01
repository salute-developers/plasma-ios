import Foundation

struct NavigationBarMainPageProps: MergeableConfiguration, Codable {
    typealias Props = NavigationBarMainPageProps
    
    // Цвета
    var actionStartColor: ColorKeyValue?
    var actionEndColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    
    // Шрифты
    var textStyle: KeyValue<String>?
    
    // Размеры и отступы
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

