import SwiftUI
import SDDSThemeCore

struct SDDSToggle: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var isOn: Bool
    var size: SwitchSizeConfiguration
    var onColor: ColorToken
    var offColor: ColorToken
    var thumbColor: ColorToken

    init(
        isOn: Binding<Bool>,
        size: SwitchSizeConfiguration,
        onColor: ColorToken,
        offColor: ColorToken,
        thumbColor: ColorToken
    ) {
        self._isOn = isOn
        self.size = size
        self.onColor = onColor
        self.offColor = offColor
        self.thumbColor = thumbColor
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            size.toggleTrackPathDrawer
                .path(in: CGRect(
                    x: 0,
                    y: 0,
                    width: size.toggleTrackWidth,
                    height: size.toggleTrackHeight
                ))
                .fill(trackColor)

            size.toggleThumbPathDrawer
                .path(in: CGRect(
                    x: 0,
                    y: 0,
                    width: size.toggleThumbWidth,
                    height: size.toggleThumbHeight
                ))
                .fill(thumbColor.color(for: colorScheme))
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
    
    private var trackColor: Color {
        isOn ? onColor.color(for: colorScheme) : offColor.color(for: colorScheme)
    }
}

struct TogglePreviewWrapper: View {
    @State private var isOn = false

    var body: some View {
        SDDSToggle(
            isOn: $isOn,
            size: DefaultSwitchSize(),
            onColor: Color.red.token,
            offColor: Color.green.token,
            thumbColor: Color.blue.token
        )
        .padding()
    }
}

#Preview {
    TogglePreviewWrapper()
}
