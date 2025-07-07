import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

enum TextSkeletonLineProviderType: String, CaseIterable {
    case fullWidth
    case varied
    
    var provider: SkeletonLineWidthProvider {
        switch self {
        case .fullWidth:
            return FullWidthLineProvider()
        case .varied:
            return VariedWidthLineProvider()
        }
    }
}

final class TextSkeletonViewModel: ComponentViewModel<TextSkeletonVariationProvider>  {
    let lineSpacing: CGFloat = 1.0
    let typography = Typographies.bodyMNormal.typographyToken(for: .medium)
    @Published var lineCountText: String = "1" {
        didSet {
            if let count = Int(lineCountText), count > 0 {
                lineCount = count
            } else if lineCountText.isEmpty {
                lineCount = 1
            }
        }
    }
    @Published private(set) var lineCount: Int = 1
    @Published var lineWidthProviderType: TextSkeletonLineProviderType = .varied
    @Published var text: String = "" {
        didSet {
            if text.isEmpty {
                lineCountText = "1"
            }
        }
    }
    @Published var textHidden = true
    
    init() {
        super.init(variationProvider: TextSkeletonVariationProvider())
    }
}
