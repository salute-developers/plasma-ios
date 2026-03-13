import Foundation

struct SelectItemProps: MergeableConfiguration, Codable {
    typealias Props = SelectItemProps
    
    var itemType: KeyValue<String>?
    var iconColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?
    var disableAlpha: KeyValue<Double>?
    
    var shape: ShapeKeyValue?
    var height: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var controlMargin: KeyValue<Double>?
    var controlSize: KeyValue<Double>?
    
    var cellStyle: ComponentStyleKeyValue<CellProps>?
    var checkboxStyle: ComponentStyleKeyValue<CheckboxProps>?
    var icon: KeyValue<String>?
}

