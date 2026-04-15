import SDDSComponents
import SDDSIcons
import SDDSServTheme
import SwiftUI
import UIKit

struct ImageRatio16x9Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(maxWidth: 160, maxHeight: 100)
    }
}

struct ImageRatio1x1Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(maxWidth: 96, maxHeight: 96)
    }
}

struct ImageRatio1x2Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(maxWidth: 80, maxHeight: 120)
    }
}
