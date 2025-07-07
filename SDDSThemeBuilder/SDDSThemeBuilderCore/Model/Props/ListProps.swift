import Foundation

struct ListProps: MergeableConfiguration, Codable {
    typealias Props = ListProps
    
    var listItemStyle: KeyValue<String>?
    var dividerStyle: KeyValue<String>?
    var scrollBarStyle: KeyValue<String>?
}
