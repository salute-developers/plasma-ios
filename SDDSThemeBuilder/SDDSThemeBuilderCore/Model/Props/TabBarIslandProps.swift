import Foundation

struct TabBarIslandProps: MergeableConfiguration, Codable {
    typealias Props = TabBarIslandProps
    
    var topShape: ShapeKeyValue?
    var bottomShape: ShapeKeyValue?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var contentPaddingStart: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var contentPaddingTop: KeyValue<Double>?
    var contentPaddingBottom: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var shadow: ShadowKeyValue?
    var tabBarItemStyle: ComponentStyleKeyValue<TabBarItemProps>?
}
