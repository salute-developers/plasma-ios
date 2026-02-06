import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSList_Simple: View {
    var body: some View {
        SDDSList(
            items: [
                SDDSListItem(title: "Первый элемент"),
                SDDSListItem(title: "Второй элемент"),
                SDDSListItem(title: "Третий элемент")
            ],
            contentHeight: .constant(0),
            showDividers: false,
            appearance: ListNormal.m.appearance
        )
    }
}
