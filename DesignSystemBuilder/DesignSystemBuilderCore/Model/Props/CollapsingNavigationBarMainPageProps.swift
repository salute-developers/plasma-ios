import Foundation

struct CollapsingNavigationBarMainPageProps: MergeableConfiguration, Codable {
    typealias Props = CollapsingNavigationBarMainPageProps

    // Стиль кнопки действия
    var actionButtonStyle: ComponentStyleKeyValue<ButtonProps>?

    // Типографика
    var textStyle: KeyValue<String>?
    var titleStyle: KeyValue<String>?
    var descriptionStyle: KeyValue<String>?

    // Цвета
    var actionStartColor: ColorKeyValue?
    var actionEndColor: ColorKeyValue?
    var textColor: ColorKeyValue?
    var titleColor: ColorKeyValue?
    var descriptionColor: ColorKeyValue?
    var backgroundColor: ColorKeyValue?

    // Размеры и отступы
    var descriptionPadding: KeyValue<Double>?
    var paddingStart: KeyValue<Double>?
    var paddingEnd: KeyValue<Double>?
    var paddingTop: KeyValue<Double>?
    var paddingBottom: KeyValue<Double>?
    var horizontalSpacing: KeyValue<Double>?
    var textBlockTopMargin: KeyValue<Double>?
}
