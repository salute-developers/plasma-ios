import Foundation

struct OverlayProps: MergeableConfiguration, Codable {
    typealias Props = OverlayProps
    
    var backgroundColor: ColorKeyValue?
    var blurRadius: KeyValue<Double>?
}
