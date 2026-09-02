import Foundation

struct FormItemProps: MergeableConfiguration, Codable {
    typealias Props = FormItemProps

    var formItemType: KeyValue<String>?
    var disableAlpha: KeyValue<Double>?

    var hintIcon: KeyValue<String>?
    var hintColor: ColorKeyValue?
    var hintWidth: KeyValue<Double>?
    var hintHeight: KeyValue<Double>?

    var optionalStyle: KeyValue<String>?
    var optionalColor: ColorKeyValue?

    var titleBlockWidth: KeyValue<Double>?
    var titleBlockPadding: KeyValue<Double>?
    var titleStyle: KeyValue<String>?
    var titleColor: ColorKeyValue?
    var titlePlacement: KeyValue<String>?
    var titleBlockSpacing: KeyValue<Double>?

    var titleCaptionPadding: KeyValue<Double>?
    var titleCaptionStyle: KeyValue<String>?
    var titleCaptionColor: ColorKeyValue?

    var captionPadding: KeyValue<Double>?
    var captionStyle: KeyValue<String>?
    var captionColor: ColorKeyValue?

    var counterStyle: KeyValue<String>?
    var counterColor: ColorKeyValue?
    var counterPadding: KeyValue<Double>?

    var topTextAlignment: KeyValue<String>?
    var bottomTextAlignment: KeyValue<String>?

    var indicatorOffsetX: KeyValue<Double>?
    var indicatorOffsetY: KeyValue<Double>?
    var indicatorAlignmentMode: KeyValue<String>?
    var indicatorAlignment: KeyValue<String>?
    var indicatorStyle: ComponentStyleKeyValue<IndicatorProps>?
}
