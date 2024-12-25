import Foundation
import SwiftUI
import Combine
@_exported import SDDSThemeCore

public struct SDDSButton: View {
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image?
    public let buttonStyle: SDDSComponents.ButtonStyle
    public let appearance: ButtonAppearance
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public let counterView: SDDSCounter?
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isAnimating: Bool = false
    @State private var isHighlighted: Bool = false
    @State private var isHovered: Bool = false
    
    public var action: () -> Void
    
    public init(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image? = Image("spinner", bundle: Bundle(for: Components.self)),
        buttonStyle: SDDSComponents.ButtonStyle = .basic,
        appearance: ButtonAppearance,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        counterView: SDDSCounter? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.buttonStyle = buttonStyle
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.counterView = counterView
        self.action = action
    }
    
    public var body: some View {
        ZStack {
            Button {
                action()
            } label: {
                switch buttonStyle {
                case .basic:
                    basicButton
                case .icon:
                    equilateralButton
                }
            }
            .buttonStyle(NoHighlightButtonStyle())
            .opacity(contentOpacity)
            .background(currentColor(for: appearance.backgroundColor).opacity(backgroundOpacity))
            .cornerRadius(cornerRadius)
            .frame(height: appearance.size.height)
            .disabled(isDisabled)
            .accessibility(label: Text(accessibility.label))
            .accessibility(hint: Text(accessibility.hint))
            .accessibility(value: Text(accessibility.value))
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in isHighlighted = true }
                    .onEnded { _ in isHighlighted = false }
            )
            .onHover { hovering in
                isHovered = hovering
            }
            
            if isLoading {
                spinner
                    .frame(width: appearance.size.spinnerSize.width, height: appearance.size.spinnerSize.height)
            }
        }
    }
    
    @ViewBuilder
    private var basicButton: some View {
        HStack {
            if isCentered {
                Spacer()
            }
            if shouldShowLeftAlignedIcon() {
                icon
                if !title.isEmpty {
                    Spacer().frame(width: appearance.size.iconHorizontalGap)
                }
            }
            if !title.isEmpty {
                Text(title)
                    .lineLimit(1)
                    .typography(titleTypography)
                    .foregroundColor(currentColor(for: appearance.titleColor))
            }
            if isSideBySide {
                Spacer()
            }
            if !subtitle.isEmpty && counterView == nil {
                if !title.isEmpty {
                    Spacer().frame(width: appearance.size.titleHorizontalGap)
                }
                Text(subtitle)
                    .lineLimit(1)
                    .typography(subtitleTypography)
                    .foregroundColor(currentColor(for: appearance.subtitleColor))
            }
            if shouldShowRightAlignedIcon() {
                if hasTitleOrSubtitle() {
                    Spacer().frame(width: appearance.size.titleHorizontalGap)
                }
                icon
            }
            counter
            if isCentered {
                Spacer()
            }
        }
        .frame(height: appearance.size.height)
        .padding(.leading, appearance.size.paddings(style: appearance.shapeStyle).leading)
        .padding(.trailing, appearance.size.paddings(style: appearance.shapeStyle).trailing)
    }
    
    @ViewBuilder
    private var equilateralButton: some View {
        Group {
            if hasIconAttributes() {
                icon
            } else {
                Spacer()
            }
        }
        .frame(width: appearance.size.height, height: appearance.size.height)
    }
    
    @ViewBuilder
    private var icon: some View {
        if let iconAttributes = iconAttributes {
            iconAttributes.image
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: appearance.size.iconSize.width,
                    height: appearance.size.iconSize.height
                )
                .foregroundColor(currentColor(for: appearance.iconColor))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var spinner: some View {
        if let spinnerImage = spinnerImage, isLoading {
            SpinnerView(
                image: spinnerImage,
                foregroundColor: currentColor(for: appearance.spinnerColor)
            )
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var counter: some View {
        if let counter = counterView {
            SDDSCounter(
                data: counter.data,
                appearance: counter.appearance,
                isAnimating: isAnimating,
                isHighlighted: isHighlighted,
                isHovered: isHovered
                )
        } else {
            EmptyView()
        }
    }
}

private extension SDDSButton {
    var cornerRadius: CGFloat {
        return appearance.size.cornerRadius(style: appearance.shapeStyle)
    }
    
    func currentColor(for buttonColor: ButtonColor) -> Color {
        if isHighlighted {
            return buttonColor.highlightedColor.color(for: colorScheme)
        } else if isHovered {
            return buttonColor.hoveredColor.color(for: colorScheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme)
        }
    }
    
    func hasIconAttributes() -> Bool {
        return iconAttributes != nil
    }
    
    var backgroundOpacity: Double {
        isDisabled ? Opacity.fourty : 1.0
    }
    
    var contentOpacity: Double {
        if isDisabled {
            return appearance.disabledAlpha
        }
        if isLoading {
            return appearance.loadingAlpha
        } else {
            return 1.0
        }
    }
        
    var isCentered: Bool {
        layoutMode.isCentered
    }
    
    var isSideBySide: Bool {
        layoutMode.isSideBySide && (!subtitle.isEmpty || iconAttributes != nil)
    }
    
    var isEquilateral: Bool {
        switch buttonStyle {
        case .icon:
            return true
        case .basic:
            return false
        }
    }
    
    var isCircle: Bool {
        switch buttonStyle {
        case .icon:
            return appearance.shapeStyle == .pilled
        default:
            return false
        }
    }
    
    func shouldShowRightAlignedIcon() -> Bool {
        return isIconRightAligned && hasIconAttributes()
    }

    func shouldShowLeftAlignedIcon() -> Bool {
        return !shouldShowRightAlignedIcon() && hasIconAttributes()
    }
        
    func hasTitleOrSubtitle() -> Bool {
        return !title.isEmpty || !subtitle.isEmpty
    }
    
    var isOnlyTitleAndImage: Bool {
        layoutMode.isSideBySide && !title.isEmpty && subtitle.isEmpty && iconAttributes != nil
    }
    
    var isIconRightAligned: Bool {
        iconAttributes?.alignment == .trailing || (iconAttributes?.alignment == .leading && isOnlyTitleAndImage)
    }

    var titleTypography: TypographyToken {
        if let typography = appearance.titleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription).")
        }
    }
    
    var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription). Using a default value.")
        }
    }
}

private struct NoHighlightButtonStyle: SwiftUI.ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.0 : 1.0)
            .animation(.none, value: configuration.isPressed)
    }
}
