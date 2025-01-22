import Foundation

import SwiftUI

public protocol SegmentWidthCalculator {
    func width(with data: SDDSSegmentItemData) -> CGFloat
}
