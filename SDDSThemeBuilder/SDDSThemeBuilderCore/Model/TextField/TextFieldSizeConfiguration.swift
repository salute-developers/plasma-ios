import Foundation

struct TextFieldSizeConfiguration: Codable {
    struct Size: Codable {
        let width: Double
        let height: Double
    }

    struct SizeVariation: Codable {
        let titleBottomPadding: Double
        let titleInnerPadding: Double
        let textBeforeTrailingPadding: Double
        let textAfterLeadingPadding: Double
        let boxLeadingPadding: Double
        let boxTrailingPadding: Double
        let captionTopPadding: Double
        let optionalPadding: Double
        let shape: ShapeKeyValue
        let iconPadding: Double
        let iconActionPadding: Double
        let fieldHeight: Double
        let iconSize: Size
        let iconActionSize: Size
        let chipsPadding: Double
        let chipContainerHorizontalPadding: Double
        let chipGroupHeight: Double
        let chipGroupVerticalTopPadding: Double
        let chipGroupVerticalBottomPadding: Double
        let indicatorOffsets: [String: [String: Size]]
        let indicatorSizes: [String: [String: Size]]
    }
    
    let data: [String: SizeVariation]
}
