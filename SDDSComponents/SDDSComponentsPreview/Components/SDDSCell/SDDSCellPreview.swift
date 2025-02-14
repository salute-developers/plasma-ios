import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
//import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        Cell(
            appearance: Cell.l.appearance,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureText: "disclosure",
            leftContent: {
                avatar
//                iconButton
            },
            centerContent: {
                avatar
            },
            rightContent: {
                avatar
                text
            }
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
    }
}
