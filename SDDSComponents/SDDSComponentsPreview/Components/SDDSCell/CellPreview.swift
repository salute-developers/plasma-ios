import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct CellPreview: PreviewProvider {
    static var previews: some View {
        HStack {
            Cell(
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
                        .environment(\.avatarAppearance, SDDSAvatar.default.large.appearance)
                },
                rightContent: {
                    iconButton
                        .environment(\.buttonAppearance, IconButton.l.black.appearance)
                },
                disclosure: {}
            )
        }
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell")
        
        Cell(
            appearance: Cell.s.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureEnabled: false,
            disclosureImage: Image(systemName: "pencil.circle.fill"),
            disclosureText: "disclosure",
            leftContent: {
                avatar
                    .environment(\.avatarAppearance, SDDSAvatar.default.medium.appearance)
            },
            rightContent: {
                iconButton
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with custom disclosure image")
        
        Cell(
            appearance: Cell.l.appearance,
            alignment: .center,
            label: "",
            title: "",
            subtitle: "",
            disclosureEnabled: true,
            disclosureText: "disclosure",
            leftContent: {
                SDDSAvatar(
                    text: "",
                    image: .image(Image.image("checker")),
                    placeholderImage: nil,
                    status: .online,
                    appearance: Cell.l.appearance.avatarAppearance,
                    accessibility: AvatarAccessibility()
                )
            },
            rightContent: {
                IconButton(
                    iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                    isDisabled: false,
                    isLoading: false,
                    spinnerImage: Image.image("spinner"),
                    appearance: Cell.l.appearance.iconButtonAppearance,
                    layoutMode: .fixedWidth(.packed),
                    action: {}
                )
            },
            disclosure: {}
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Cell with custom appearance")
    }
}
