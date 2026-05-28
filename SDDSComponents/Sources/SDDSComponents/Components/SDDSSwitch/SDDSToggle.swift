import SwiftUI
import SDDSThemeCore

struct SDDSToggle: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Binding var isOn: Bool
    var size: SwitchSizeConfiguration
    var onColor: FillStyle
    var offColor: FillStyle
    var thumbColor: FillStyle

    init(
        isOn: Binding<Bool>,
        size: SwitchSizeConfiguration,
        onColor: FillStyle,
        offColor: FillStyle,
        thumbColor: FillStyle
    ) {
        self._isOn = isOn
        self.size = size
        self.onColor = onColor
        self.offColor = offColor
        self.thumbColor = thumbColor
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            let trackShape = size.toggleTrackPathDrawer
                .path(in: CGRect(
                    x: 0,
                    y: 0,
                    width: size.toggleTrackWidth,
                    height: size.toggleTrackHeight
                ))
            shapeFill(trackShape, style: trackColor)

            let thumbShape = size.toggleThumbPathDrawer
                .path(in: CGRect(
                    x: 0,
                    y: 0,
                    width: size.toggleThumbWidth,
                    height: size.toggleThumbHeight
                ))
            shapeFill(thumbShape, style: thumbColor)
                .frame(
                    width: size.toggleThumbWidth,
                    height: size.toggleThumbHeight
                )
                .offset(x: isOn
                        ? size.toggleTrackWidth - size.toggleThumbWidth - size.toggleThumbPadding
                        : size.toggleThumbPadding
                )
        }
        .frame(
            width: size.toggleTrackWidth,
            height: size.toggleTrackHeight
        )
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isOn.toggle()
            }
        }
    }
    
    private var trackColor: FillStyle {
        isOn ? onColor : offColor
    }

    @ViewBuilder
    private func shapeFill(_ path: Path, style: FillStyle) -> some View {
        switch style {
        case .color(let colorToken):
            path.fill(colorToken.color(for: colorScheme, subtheme: subtheme))
        case .gradient(let gradientToken):
            Rectangle()
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .mask(path)
        }
    }
}

struct TogglePreviewWrapper: View {
    @State private var isOn = false

    var body: some View {
        SDDSToggle(
            isOn: $isOn,
            size: DefaultSwitchSize(),
            onColor: .color(Color.red.token),
            offColor: .color(Color.green.token),
            thumbColor: .color(Color.blue.token)
        )
        .padding()
    }
}

#Preview {
    TogglePreviewWrapper()
}
