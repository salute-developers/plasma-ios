import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct CellPreview: PreviewProvider {
    static var previews: some View {
        HStack {
            Cell(
                appearance: Cell.s.appearance,
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
