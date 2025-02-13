import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
//import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        Cell(
            leftContent: CellContentLeft(
                contentView: [
                    avatar
                ]),
            centerContent: CellContentCenter(
                contentView: [/*some view*/],
                label: "Label",
                title: "Title",
                subtitle: "Subtitle"
            ),
            rightContent: CellContentRight(
                contentView: [
                    iconButton
                ]
            ),
            appearance: Cell.l.appearance,
            disclosure: .default(DefaultDisclosure(
                text: "Disclosure",
                icon: .image(Image("BuildingsOutline16"))
            )
            ),
        alignment: .center
        )
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Cell with disclosure")
        
        Cell(
            leftContent: CellContentLeft(
                contentView: [
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
                contentView: [
                    avatar
                ]
            ),
            appearance: Cell.l.appearance,
            disclosure: nil,
            alignment: .center
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
    }
}
