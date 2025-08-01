import Foundation

struct CodeFieldProps: MergeableConfiguration, Codable {
    typealias Props = CodeFieldProps
    
    var itemSpacing: KeyValue<Double>?
    var groupSpacing: KeyValue<Double>?
    var valueColor: ColorKeyValue?
    var cursorColor: ColorKeyValue?
    var captionColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var itemShape: ShapeKeyValue?
    var groupShape: ShapeKeyValue?
    var captionSpacing: KeyValue<Double>?
    var width: KeyValue<Double>?
    var height: KeyValue<Double>?
    var captionStyle: KeyValue<String>?
    var valueStyle: KeyValue<String>?
} 
