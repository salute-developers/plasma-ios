import Foundation

struct ImageProps: MergeableConfiguration, Codable {
    typealias Props = ImageProps

    var width: KeyValue<Double>?
    var height: KeyValue<Double>?
}
