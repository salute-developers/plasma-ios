import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSThemeCore

enum TextSkeletonKind: String, CaseIterable {
    case `default`
    case body
    case display
    case header
    case text
    
    var title: String {
        switch self {
        case .default:
            "Default"
        case .body:
            "Body"
        case .display:
            "Display"
        case .header:
            "Header"
        case .text:
            "Text"
        }
    }
}

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
    let title: String = "TextSkeleton"
    @Published var selectedKind: TextSkeletonKind = .default {
        didSet {
            variationProvider.kind = selectedKind
            selectVariation(variations.first)
        }
    }
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
    let typography: TypographyToken = AdaptiveTypographyToken.bodyMNormal.typography
    @Published var text: String = "" {
        didSet {
            if text.isEmpty {
                lineCountText = "1"
            }
        }
    }
    @Published var textHidden = true
    
    init() {
        super.init(variationProvider: TextSkeletonVariationProvider(kind: .default))
    }
}
