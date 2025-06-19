import Foundation
import SwiftUI
import SDDSComponents

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
    @Published var lineCountText: String = "3" {
        didSet {
            if let count = Int(lineCountText), count > 0 {
                lineCount = count
            }
        }
    }
    @Published private(set) var lineCount: Int = 3
    @Published var lineWidthProviderType: TextSkeletonLineProviderType = .varied
    
    init() {
        super.init(variationProvider: TextSkeletonVariationProvider())
    }
}
