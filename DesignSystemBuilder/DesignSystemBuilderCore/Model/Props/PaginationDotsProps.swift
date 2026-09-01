import Foundation

struct PaginationDotsProps: MergeableConfiguration, Codable {
    typealias Props = PaginationDotsProps
    
    var orientation: KeyValue<String>?
    var gap: KeyValue<Double>?
    var edgeShrinkFactor: KeyValue<Double>?
    var dotBackgroundColor: ColorKeyValue?
    var dotWidth: KeyValue<Double>?
    var dotHeight: KeyValue<Double>?
    var edgeCount: KeyValue<String>?
}
