import Foundation

struct TextFieldSizeConfiguration: Codable {
    struct Size: Codable {
        let width: Double
        let height: Double
    }

    struct SizeClass: Codable {
        let titleBottomPadding: Double
        let titleInnerPadding: Double
        let textBeforeLeadingPadding: Double
        let textBeforeTrailingPadding: Double
        let textAfterLeadingPadding: Double
        let textAfterTrailingPadding: Double
        let boxLeadingPadding: Double
        let boxTrailingPadding: Double
        let captionTopPadding: Double
        let optionalPadding: Double
        let cornerRadius: Double
        let borderWidth: Double
        let iconPadding: Double
        let iconActionPadding: Double
        let indicatorSize: Size
        let fieldHeight: Double
        let iconSize: Size
        let iconActionSize: Size
        let chipsPadding: Double
        let multipleValueHorizontalPadding: Double
        let dividerHeight: Double
        let chipContainerHorizontalPadding: Double
        let chipGroupHeight: Double
        let chipGroupVerticalTopPadding: Double
        let chipGroupVerticalBottomPadding: Double
    }

    let extraLarge: SizeClass
    let large: SizeClass
    let medium: SizeClass
    let small: SizeClass
    let extraSmall: SizeClass
}
