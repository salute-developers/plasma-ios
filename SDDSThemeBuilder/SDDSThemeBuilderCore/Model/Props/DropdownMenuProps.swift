import Foundation

struct DropdownMenuProps: MergeableConfiguration, Codable {
    typealias Props = DropdownMenuProps
    
    var listStyle: KeyValue<String>?
    var shape: ShapeKeyValue?
    var width: KeyValue<Double>?
    var dividerStyle: KeyValue<String>?
    var backgroundColor: ColorKeyValue?
    var offset: KeyValue<Double>?
    var shadow: ShadowKeyValue?
} 
