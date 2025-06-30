import Foundation

struct ListItemProps: MergeableConfiguration, Codable {
    typealias Props = ListItemProps
    
    var shape: ShapeKeyValue?
    var height: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var titleStyle: KeyValue<String>?
    var disclosureIcon: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var titleColor: ColorKeyValue?
    var disclosureIconColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
} 