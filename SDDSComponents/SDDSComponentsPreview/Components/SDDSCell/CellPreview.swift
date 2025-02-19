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
            disclosureIcon: Image("DisclosureRightOutline", bundle: Bundle(for: SDDSIcons.Icons.self)),
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
            appearance: Cell.s.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureIcon: Asset.disclosureRightOutline.image,
            disclosureText: "disclosure",
            leftContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.small.appearance)
            },
            centerContent: {},
            rightContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.small.appearance)
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with disclosure")
    }
}
