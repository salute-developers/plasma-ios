import Foundation

struct CodeInputProps: MergeableConfiguration, Codable {
    typealias Props = CodeInputProps
    
    // Цвета с состояниями
    var codeColor: ColorKeyValue?
    var captionColor: ColorKeyValue?
    var strokeColor: ColorKeyValue?
    var fillColor: ColorKeyValue?
    var fillColorError: ColorKeyValue?
    
    // Размеры
    var itemHeight: KeyValue<Double>?
    var itemWidth: KeyValue<Double>?
    var dotSize: KeyValue<Double>?
    var strokeWidth: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var groupSpacing: KeyValue<Double>?
    var captionPadding: KeyValue<Double>?
    
    // Типографика
    var codeStyle: KeyValue<String>?
    var captionStyle: KeyValue<String>?
}
