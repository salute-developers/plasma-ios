import Foundation

struct TabBarProps: MergeableConfiguration, Codable {
    typealias Props = TabBarProps
    
    var contentPaddingStart: KeyValue<Double>?
    var contentPaddingEnd: KeyValue<Double>?
    var contentPaddingTop: KeyValue<Double>?
    var contentPaddingBottom: KeyValue<Double>?
    var itemSpacing: KeyValue<Double>?
    var backgroundColor: ColorKeyValue?
    var backgroundBlurColor: ColorKeyValue?
    var backgroundBlurRadius: KeyValue<Double>?
    var topShape: ShapeKeyValue?
    // Островной вариант: своя нижняя форма и отступы от краёв экрана.
    var bottomShape: ShapeKeyValue?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var shadow: ShadowKeyValue?
    var dividerThickness: KeyValue<Double>?
    var dividerColor: ColorKeyValue?
    var tabBarItemStyle: ComponentStyleKeyValue<TabBarItemProps>?
}
