import SwiftUI

private struct BottomSheetScrollProgressKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

extension EnvironmentValues {
    var bottomSheetScrollProgress: CGFloat {
        get { self[BottomSheetScrollProgressKey.self] }
        set { self[BottomSheetScrollProgressKey.self] = newValue }
    }
}
