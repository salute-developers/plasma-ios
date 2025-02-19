import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        Cell(
            appearance: Cell.l.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureEnabled: false,
            disclosureIcon: nil,
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
            appearance: Cell.xs.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureEnabled: true,
            disclosureIcon: nil,
            disclosureText: "disclosure",
            leftContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.small.appearance)
            },
            centerContent: {},
            rightContent: {
                iconButton
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with disclosure")
    }
}
