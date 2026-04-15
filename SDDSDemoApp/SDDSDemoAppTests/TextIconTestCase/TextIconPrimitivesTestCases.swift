import SDDSComponents
import SDDSServTheme
import SwiftUI

struct TextPrimitiveSolidColor: View {
    var body: some View {
        SDDSText(
            "Primary text",
            fillStyle: .color(ColorToken.textDefaultPrimary)
        )
    }
}

struct TextPrimitiveGradient: View {
    var body: some View {
        SDDSText(
            "Accent gradient",
            fillStyle: .gradient(GradientToken.textDefaultAccentGradient)
        )
    }
}

struct TextPrimitiveLineLimitFromEnv: View {
    var body: some View {
        SDDSText("This line is truncated with environment line limit")
            .environment(
                \.sddsTextEnvironment,
                SDDSTextEnvironment(
                    fillStyle: .color(ColorToken.textDefaultPrimary),
                    lineLimit: 1,
                    minimumScaleFactor: 1,
                    multilineTextAlignment: .leading,
                    truncationMode: .tail
                )
            )
            .frame(width: 180, alignment: .leading)
    }
}

struct IconPrimitiveSolidColor: View {
    var body: some View {
        SDDSIcon(
            Image(systemName: "heart.fill"),
            fillStyle: .color(ColorToken.textDefaultAccent),
            sideLength: 36
        )
    }
}

struct IconPrimitiveGradient: View {
    var body: some View {
        SDDSIcon(
            Image(systemName: "star.fill"),
            fillStyle: .gradient(GradientToken.surfaceDefaultAccentGradient),
            sideLength: 36
        )
    }
}

struct IconPrimitiveEnvSizeVsOverride: View {
    var body: some View {
        HStack(spacing: 24) {
            SDDSIcon(Image(systemName: "circle.fill"))
            SDDSIcon(Image(systemName: "circle.fill"), sideLength: 14)
        }
        .environment(
            \.sddsIconEnvironment,
            SDDSIconEnvironment(
                fillStyle: .color(ColorToken.textDefaultSecondary),
                defaultSize: 28
            )
        )
    }
}
