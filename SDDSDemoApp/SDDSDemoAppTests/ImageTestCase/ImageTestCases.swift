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
        .frame(width: 160, height: 160 * 9 / 16)
        .background(Color.gray)
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
        .frame(width: 96, height: 96)
        .background(Color.gray)
    }
}

struct ImageRatio1x2Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill36.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(width: 80, height: 160)
        .background(Color.gray)
    }
}

struct ImageRatio3x4Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(width: 160, height: 160 * 4 / 3)
        .background(Color.gray)
    }
}

struct ImageRatio4x3Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(width: 160, height: 160 * 3 / 4)
        .background(Color.gray)
    }
}

struct ImageRatio9x16Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(width: 160, height: 160 * 16 / 9)
        .background(Color.gray)
    }
}

struct ImageRatio2x1Photo: View {
    var appearance: ImageAppearance

    var body: some View {
        SDDSImage(
            image: Image(
                uiImage: Asset.cameraPhotoFill24.uiImage
                    .withRenderingMode(.alwaysOriginal)
            ),
            appearance: appearance
        )
        .frame(width: 160, height: 80)
        .background(Color.gray)
    }
}
