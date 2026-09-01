import Foundation

struct CarouselProps: MergeableConfiguration, Codable {
    typealias Props = CarouselProps

    var indicatorStyle: ComponentStyleKeyValue<PaginationDotsProps>?
    var nextButtonStyle: ComponentStyleKeyValue<ButtonProps>?
    var prevButtonStyle: ComponentStyleKeyValue<ButtonProps>?
    var nextButtonIcon: KeyValue<String>?
    var prevButtonIcon: KeyValue<String>?
    var buttonsPlacement: KeyValue<String>?
    var indicatorPadding: KeyValue<Double>?
    var nextButtonPadding: KeyValue<Double>?
    var prevButtonPadding: KeyValue<Double>?
    var gap: KeyValue<Double>?
}
