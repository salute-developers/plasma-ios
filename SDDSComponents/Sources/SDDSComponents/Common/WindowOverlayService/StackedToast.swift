import Foundation
import SwiftUI

public typealias ToastID = UUID

struct StackedToast: Identifiable {
    let id: ToastID
    let view: AnyView
    let position: ToastPosition
    let duration: TimeInterval
    let onClose: (() -> Void)?
}
