import Foundation

struct ListItemProps: MergeableConfiguration, Codable {
    typealias Props = ListItemProps
    
    var shape: ShapeKeyValue?
    var height: KeyValue<Double>?
    var disableAlpha: KeyValue<Double>?
    var labelStyle: KeyValue<String>?
    var subtitleStyle: KeyValue<String>?
    var contentPaddingEnd: KeyValue<Double>?
    var contentPaddingStart: KeyValue<Double>?
    var titleStyle: KeyValue<String>?
    var disclosureIcon: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var labelColor: ColorKeyValue?
    var titleColor: ColorKeyValue?
    var subtitleColor: ColorKeyValue?
    var disclosureIconColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var counterStyle: ComponentStyleKeyValue<CounterProps>?
} 