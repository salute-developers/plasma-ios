import Foundation

struct ToolbarProps: MergeableConfiguration, Codable {
    typealias Props = ToolbarProps
    
    var backgroundColor: ColorKeyValue?
    var dividerStyle: KeyValue<String>?
    var orientation: KeyValue<String>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var shape: ShapeKeyValue?
    var slotPadding: KeyValue<Double>?
    var dividerMargin: KeyValue<Double>?
    var shadow: ShadowKeyValue?
}
