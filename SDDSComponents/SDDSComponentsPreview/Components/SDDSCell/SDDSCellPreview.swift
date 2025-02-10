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
                    avatar,
                    iconButton,
                    text
                ]),
            
            centerContent: CellContentCenter(
                label: "Label",
                title: "Title",
                subtitle: "Subtitle"
            )
            //
            //            rightContent: CellContentRight(
            //                disclosureEnabled: true,
            //                buttonIcon: iconButton
            //            )
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
