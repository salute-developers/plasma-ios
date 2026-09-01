import Foundation

struct TabsDefaultProps: MergeableConfiguration, Codable {
    typealias Props = TabsDefaultProps
    
    var dividerEnabled: KeyValue<Bool>?
    var indicatorEnabled: KeyValue<Bool>?
    var indicatorThickness: KeyValue<Double>?
    var disclosureColor: ColorKeyValue?
    var indicatorColor: ColorKeyValue?
    var dividerStyle: ComponentStyleKeyValue<DividerProps>?
    var overflowNextIcon: KeyValue<String>?
    var overflowNextIconColor: ColorKeyValue?
    var overflowPrevIcon: KeyValue<String>?
    var overflowPrevIconColor: ColorKeyValue?
    var tabItemStyle: ComponentStyleKeyValue<TabBarItemProps>?
    var disclosureTextStyle: KeyValue<String>?
    var dropdownMenuStyle: ComponentStyleKeyValue<DropdownMenuProps>?
    var minSpacing: KeyValue<Double>?
    var orientation: KeyValue<String>?
    var disclosureIcon: KeyValue<String>?
    var overflowIconSize: KeyValue<Double>?
    var disclosureIconSize: KeyValue<Double>?
}
