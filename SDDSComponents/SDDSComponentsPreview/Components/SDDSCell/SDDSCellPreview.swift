import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct SDDSCellPreview: PreviewProvider {
    static var previews: some View {
        SDDSCell(
            leftContent: CellContentLeft(
                data: [
                    avatar
                ]),
            centerContent: CellContentCenter(
                data: [/*some view*/],
                label: "Label",
                title: "Title",
                subtitle: "Subtitle"
            ),
            rightContent: CellContentRight(
                data: [
                    iconButton
                ],
                disclosure: .default(DefaultDisclosure(
                    text: "Disclosure",
                    icon: Image("BuildingsOutline16")
                )
            )
        ),
        alignment: .center
        )
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Cell with disclosure")
        
        SDDSCell(
            leftContent: CellContentLeft(
                data: [
                    avatar,
                    iconButton,
                    text
                ]),
            centerContent: CellContentCenter(
                label: "Label",
                title: "Title",
                subtitle: "Subtitle"
            ),
            rightContent: CellContentRight(
                data: [
                    avatar
                ],
                disclosure: nil
            ),
            alignment: .center
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
    }
}
