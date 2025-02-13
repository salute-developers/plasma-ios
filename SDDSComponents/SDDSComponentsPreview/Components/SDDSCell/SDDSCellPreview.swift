import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
//import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        Cell(
            leftContent: [.avatar(avatar)],
            centerContent: [],
            rightContent: [.iconButton(iconButton)],
            appearance: Cell.l.appearance,
            disclosure: .default(DefaultDisclosure(
                text: "Disclosure",
                icon: .image(Image("BuildingsOutline16"))
            )
            ),
        alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle"
        )
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Cell with disclosure")
        
        Cell(
            leftContent: [.avatar(avatar)],
            centerContent: [],
            rightContent: [.iconButton(iconButton)],
            appearance: Cell.l.appearance,
            disclosure: nil,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle"
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
    }
}
