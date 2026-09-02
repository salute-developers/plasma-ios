import Foundation

struct AccordionItemProps: MergeableConfiguration, Codable {
    typealias Props = AccordionItemProps
    
    var shape: ShapeKeyValue?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var contentPaddingStart: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var contentPaddingBottom: KeyValue<Double>?
    var titleStyle: KeyValue<String>?
    var contentTextStyle: KeyValue<String>?
    var closedIcon: KeyValue<String>?
    var openedIcon: KeyValue<String>?
    var iconPadding: KeyValue<Double>?
    var titleColor: ColorKeyValue?
    var contentTextColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var iconPlacement: KeyValue<String>?
    var iconRotation: KeyValue<Double>?
} 