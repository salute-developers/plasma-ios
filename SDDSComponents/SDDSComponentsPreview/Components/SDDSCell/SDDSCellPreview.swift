import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
//import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        Cell(
            appearance: Cell.l.appearance,
            contentAlignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureText: "",
            leftContent: {
                avatar
            },
            centerContent: {
                avatar
            },
            rightContent: {
                avatar
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
        
        Cell(
            appearance: Cell.l.appearance,
            contentAlignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureText: "disclosure",
            leftContent: {
                avatar
            },
            centerContent: {
                avatar
            },
            rightContent: {
                avatar
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with disclosure")
    }
}
