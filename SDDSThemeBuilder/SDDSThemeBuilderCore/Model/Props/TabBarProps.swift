import Foundation

struct TabBarProps: MergeableConfiguration, Codable {
    typealias Props = TabBarProps
    
    var contentPaddingStart: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var contentPaddingTop: KeyValue<Double>?
    var contentPaddingBottom: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var topShape: ShapeKeyValue?
    var shadow: ShadowKeyValue?
    var dividerThickness: KeyValue<Double>?
    var dividerColor: ColorKeyValue?
    var tabBarItemStyle: ComponentStyleKeyValue<TabBarItemProps>?
}
