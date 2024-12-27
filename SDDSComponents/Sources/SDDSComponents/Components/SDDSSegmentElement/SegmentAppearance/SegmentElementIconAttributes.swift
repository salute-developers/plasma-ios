import Foundation
import SwiftUI

public struct SegmentElementIconAttributes {
    public let image: Image
    
    public let alignment: SegmentElementAlignment
    
    public init(
        image: Image,
         alignment: SegmentElementAlignment
    ) {
        self.image = image
        self.alignment = alignment
    }
}
