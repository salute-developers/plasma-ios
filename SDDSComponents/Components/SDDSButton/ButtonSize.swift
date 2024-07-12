import Foundation
import SwiftUI

public protocol ButtonSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var paddings: EdgeInsets { get }
    var iconSize: CGSize { get }
    var spinnerSize: CGSize { get }
    var iconHorizontalGap: CGFloat { get }
    var titleHorizontalGap: CGFloat { get }
}
