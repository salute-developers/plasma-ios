import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct CellPreview: PreviewProvider {
    static var previews: some View {
        HStack {
            SDDSCell(
                appearance: Cell.l.appearance,
                alignment: .center,
                label: "label",
                title: "title",
                subtitle: "subtitle",
                disclosureEnabled: true,
                disclosureImage: nil,
                disclosureText: "disclosure",
                leftContent: {
                    avatar
                },
                rightContent: {
                    `switch`
                }
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell")
    }
}
