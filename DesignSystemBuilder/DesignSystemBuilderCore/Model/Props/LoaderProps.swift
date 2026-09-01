import Foundation

struct LoaderProps: MergeableConfiguration, Codable {
    typealias Props = LoaderProps
    
    var spinnerStyle: ComponentStyleKeyValue<SpinnerProps>?
    var circularProgressStyle: ComponentStyleKeyValue<CircularProgressBarProps>?
}
