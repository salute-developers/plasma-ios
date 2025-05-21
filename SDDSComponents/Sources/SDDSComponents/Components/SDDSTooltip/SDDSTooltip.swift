import SwiftUI
import SDDSThemeCore

struct SDDSTooltip<ContentStart: View>: View {
    let width: CGFloat?
    let appearance: TooltipAppearance
    let text: String
    let contentStart: () -> ContentStart
    
    @Environment(\.colorScheme) private var colorScheme
    @State private var textSize: CGSize = .zero
    @State private var tooltipSize: CGSize = .zero
    
    var body: some View {
        ZStack {
            if !text.isEmpty {
                Text(text)
                    .typography(textTypography)
                    .lineLimit(nil)
                    .fixedSize(horizontal: true, vertical: true)
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear { textSize = geo.size }
                                .onChange(of: geo.size) { textSize = $0 }
                        }
                    )
                    .hidden()
            }

            
            HStack(spacing: appearance.size.contentStartPadding) {
                contentStart()
                    .tint(appearance.contentStartColor.color(for: colorScheme))
                    .frame(width: appearance.size.contentStartSize, height: appearance.size.contentStartSize)
                
                if !text.isEmpty {
                    Text(text)
                        .typography(textTypography)
                        .lineLimit(nil)
                        .foregroundColor(appearance.textColor.color(for: colorScheme))
                }
            }
            .padding(.leading, appearance.size.paddingStart)
            .padding(.trailing, appearance.size.paddingEnd)
            .padding(.top, appearance.size.paddingTop)
            .padding(.bottom, appearance.size.paddingBottom)
            .background(appearance.backgroundColor.color(for: colorScheme))
            .frame(width: calculatedWidth, height: height + appearance.size.paddingTop + appearance.size.paddingBottom)
        }
        .frame(width: calculatedWidth, height: height + appearance.size.paddingTop + appearance.size.paddingBottom)
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear { tooltipSize = geo.size }
                    .onChange(of: geo.size) { newSize in tooltipSize = newSize }
            }
        )
        .onPreferenceChange(PopoverSizeKey.self) { size in
            self.tooltipSize = size
        }
    }
    
    private var calculatedWidth: CGFloat {
        if let width = width {
            return width
        } else {
            let paddings = [
                textSize.width,
                appearance.size.paddingStart,
                appearance.size.paddingEnd,
                appearance.size.contentStartSize,
                appearance.size.contentStartPadding
            ]
            
            return paddings.reduce(0, +)
        }
    }
    
    private var height: CGFloat {
        let result = max(textSize.height, textTypography.lineHeight)
        return result
    }
    
    private var textTypography: TypographyToken {
        guard let typography = appearance.textTypography?.typography(with: appearance.size) else {
            fatalError("Undefined Text Typography for appearance.size \(appearance.size).")
        }
        return typography
    }
}
