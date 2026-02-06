import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSDropdownMenu_Simple: View {
    var body: some View {
        SDDSDropdownMenu(appearance: DropdownMenuNormal.l.appearance) {
            Text("Выпадающий контент")
        }
    }
}
