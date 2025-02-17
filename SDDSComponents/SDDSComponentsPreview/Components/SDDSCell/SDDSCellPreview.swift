import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct CellPreview: PreviewProvider {
    static var previews: some View {
<<<<<<< HEAD
        HStack {
            SDDSCell(
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
=======
        Cell(
            appearance: Cell.l.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureText: "",
            leftContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.large.appearance)
            },
            centerContent: {},
            rightContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.medium.appearance)
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.medium.appearance)
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell without disclosure")
        
        Cell(
            appearance: Cell.l.appearance,
            alignment: .center,
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
>>>>>>> a7ec33d0 (feat: added selection appearance in avatar)
    }
}
