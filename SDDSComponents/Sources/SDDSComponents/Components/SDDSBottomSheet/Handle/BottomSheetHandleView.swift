import SwiftUI

struct BottomSheetHandleView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    let appearance: BottomSheetAppearance
    
    var body: some View {
        Rectangle()
            .fill(appearance.handleColor.color(for: colorScheme, subtheme: subtheme))
            .frame(width: appearance.size.handleWidth, height: appearance.size.handleHeight)
            .shape(pathDrawer: appearance.size.handlePathDrawer)
    }
}
