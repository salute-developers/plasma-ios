import Foundation

struct NoteProps: MergeableConfiguration, Codable {
    typealias Props = NoteProps
    
    // Colors
    var backgroundColor: ColorKeyValue?
    var iconColor: ColorKeyValue?
    var closeColor: ColorKeyValue?
    var titleColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    
    // Typography
    var titleStyle: KeyValue<String>?
    var textStyle: KeyValue<String>?
    
    // Dimensions
    var shape: ShapeKeyValue?
    var titlePaddingEnd: KeyValue<Double>?
    var iconSize: KeyValue<Double>?
    var contentBeforeEndMargin: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var textTopMargin: KeyValue<Double>?
    var actionTopMargin: KeyValue<Double>?
    var closeTopMargin: KeyValue<Double>?
    var closeEndMargin: KeyValue<Double>?
    var closeSize: KeyValue<Double>?
    
    // Enum values
    var contentBeforeArrangement: KeyValue<String>?
    
    // Icon
    var closeIcon: KeyValue<String>?
    
    // Nested component styles
    var linkButtonStyle: ComponentStyleKeyValue<ButtonProps>?
}


