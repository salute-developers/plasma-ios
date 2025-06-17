import Foundation
import SwiftUI
import SDDSComponents

class TextSkeletonViewModel: ComponentViewModel<TextSkeletonVariationProvider>  {
    @Published var lineCountText: String = "3" {
        didSet {
            if let count = Int(lineCountText), count > 0 {
                lineCount = count
            }
        }
    }
    @Published private(set) var lineCount: Int = 3
    
    init() {
        super.init(variationProvider: TextSkeletonVariationProvider())
    }
}
