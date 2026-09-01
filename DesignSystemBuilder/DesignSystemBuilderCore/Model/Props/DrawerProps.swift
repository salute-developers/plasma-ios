import Foundation

struct DrawerProps: MergeableConfiguration, Codable {
    typealias Props = DrawerProps
    
    // Colors
    var backgroundColor: ColorKeyValue?
    var closeColor: ColorKeyValue?
    
    // Icon
    var closeIcon: KeyValue<String>?
    
    // Shadow
    var shadow: ShadowKeyValue?
    
    // Dimensions
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var closeIconHeaderPadding: KeyValue<Double>?
    var closeIconOffsetX: KeyValue<Double>?
    var closeIconOffsetY: KeyValue<Double>?
    
    // Enum values
    var closeIconPlacement: KeyValue<String>?
}
