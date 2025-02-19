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
            disclosureIcon: nil,
            disclosureText: "disclosure",
            leftContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.large.appearance)
            },
            centerContent: {},
            rightContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.large.appearance)
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with disclosure")
    }
}
