import SwiftUI

struct BottomSheetHandleView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let appearance: BottomSheetAppearance
    
    var body: some View {
        Rectangle()
            .fill(appearance.handleColor.color(for: colorScheme))
            .frame(width: appearance.size.handleWidth, height: appearance.size.handleHeight)
            .shape(pathDrawer: appearance.size.handlePathDrawer)
    }
}
