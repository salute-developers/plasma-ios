import Foundation

struct CollapsingNavigationBarInternalPageProps: MergeableConfiguration, Codable {
    typealias Props = CollapsingNavigationBarInternalPageProps

    // Иконка назад
    var backIcon: KeyValue<String>?
    var backIconMargin: KeyValue<Double>?
    var backIconColor: ColorKeyValue?

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
