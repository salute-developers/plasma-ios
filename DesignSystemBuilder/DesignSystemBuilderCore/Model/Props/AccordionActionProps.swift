import Foundation

struct AccordionActionProps: MergeableConfiguration, Codable {
    typealias Props = AccordionActionProps
    
    var accordionItemStyle: KeyValue<String>?
    var itemSpacing: KeyValue<Double>?
    var dividerStyle: KeyValue<String>?
} 