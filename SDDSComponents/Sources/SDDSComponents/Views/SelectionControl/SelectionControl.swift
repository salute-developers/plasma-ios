import Foundation
import SwiftUI
@_exported import SDDSThemeCore

struct SelectionControl<AppearanceType: SelectionControlAppearance>: View {
    @Binding var state: SelectionControlState
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let selectionControlToggle: SelectionControlToggle
    let appearance: AppearanceType
    let accessibility: SelectionControlAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: appearance.size.verticalGap) {
            HStack(spacing: appearance.size.horizontalGap) {
                controlView
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text(accessibility.controlLabel))
                    .accessibilityValue(Text(accessibilityValue))
                    .accessibilityHint(Text(accessibility.controlHint))
                    .accessibilityAddTraits(.isButton)
                
                if title.isEmpty {
                    subtitleText
                } else {
                    titleText
                }
            }
            HStack(spacing: appearance.size.horizontalGap) {
                Spacer().frame(width: appearance.size.toggleWidth)
                
                if !title.isEmpty {
                    subtitleText
                }
            }
        }
        .onTapGesture {
            if isEnabled {
                state = state.nextState()
            }
        }
        .disabled(!isEnabled)
    }
    
    @ViewBuilder
    private var titleText: some View {
        Text(title)
            .typography(titleTypography)
            .frame(height: titleTypography.lineHeight)
            .foregroundColor(appearance.titleColor(for: isEnabled).color(for: colorScheme))
            .accessibilityLabel(Text(accessibility.titleLabel))
            .accessibilityValue(Text(title))
    }
    
    @ViewBuilder
    private var subtitleText: some View {
        if let subtitle = subtitle {
            Text(subtitle)
                .typography(subtitleTypography)
                .frame(height: subtitleTypography.lineHeight)
                .foregroundColor(appearance.subtitleColor(for: isEnabled).color(for: colorScheme))
                .accessibilityLabel(Text(accessibility.subtitleLabel))
                .accessibilityValue(Text(subtitle))
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func toggleImage(image: Image) -> some View {
        image
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
    }
    
    private var image: Image? {
        guard case .images(let selectionControlStateImages) = selectionControlToggle else {
            return nil
        }
        switch state {
        case .selected:
            return selectionControlStateImages.selectedImage
        case .deselected:
            return selectionControlStateImages.deselectedImage
        case .indeterminate:
            return selectionControlStateImages.indeterminateImage
        }
    }
    
    @ViewBuilder
    private var controlView: some View {
        ZStack {
            switch selectionControlToggle {
            case .images(let selectionControlStateImages):
                if let image = image {
                    toggleImage(image: image)
                } else {
                    EmptyView()
                }
            case .pathDrawer:
                pathDrawerView
            }
        }
        .padding(appearance.size.togglePaddings)
        .frame(width: appearance.size.toggleWidth, height: appearance.size.toggleHeight)
        .applyIf(!isEnabled) { $0.opacity(appearance.disabledAlpha) }
    }
    
    @ViewBuilder
    private var pathDrawerView: some View {
        switch state {
        case .selected:
            fillView
            icon(
                icon: appearance.size.pathDrawer,
                iconColor: appearance.checkedIconColor,
                width: appearance.size.toggleCheckedIconWidth,
                height: appearance.size.toggleCheckedIconHeight
            )
        case .deselected:
            borderView
        case .indeterminate:
            fillView
            icon(
                icon: appearance.size.pathDrawer,
                iconColor: appearance.toggleIndeterminateIconColor,
                width: appearance.size.toggleIndeterminateIconWidth,
                height: appearance.size.toggleIndeterminateIconHeight
            )
        }
    }
    
    @ViewBuilder
    private func icon(icon: PathDrawer?, iconColor: ColorToken, width: CGFloat, height: CGFloat) -> some View {
        if let icon = icon {
            icon.path(in: CGRect(x: 0, y: 0, width: width, height: height))
                    .foregroundColor(iconColor.color(for: colorScheme))
                    .frame(width: width, height: height)
        } else {
            EmptyView()
        }
    }
    
    private var borderView: some View {
        appearance.size.pathDrawer
            .path(
                in: CGRect(
                    x: rectLocation,
                    y: rectLocation,
                    width: toggleWidth,
                    height: toggleHeight)
            )
            .stroke(appearance.toggleBorderColor.color(for: colorScheme), lineWidth: appearance.size.lineWidth)
    }
    
    private var fillView: some View {
        appearance.size.pathDrawer
            .path(
                in: CGRect(
                    x: 0,
                    y: 0,
                    width: appearance.size.toggleWidth - paddings,
                    height: appearance.size.toggleHeight - paddings)
            )
            .fill(currentColorForToggleFill(for: appearance.toggleColor))
    }
    
    // MARK: - Accessibility
    private var accessibilityValue: String {
        switch state {
        case .selected:
            return accessibility.controlEnabledValue
        case .deselected, .indeterminate:
            return accessibility.controlDisabledValue
        }
    }
    
    private var titleTypography: TypographyToken {
        appearance.titleTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var subtitleTypography: TypographyToken {
        appearance.subtitleTypography.typography(with: appearance.size) ?? .undefined
    }
    
    private var paddings: CGFloat {
        appearance.size.togglePaddings + appearance.size.togglePaddings
    }
    
    private var toggleWidth: CGFloat {
        appearance.size.toggleWidth - paddings - appearance.size.lineWidth
    }
    
    private var toggleHeight: CGFloat {
        appearance.size.toggleHeight - paddings - appearance.size.lineWidth
    }
    
    private var rectLocation: CGFloat {
        appearance.size.lineWidth / 2
    }
    
    private func currentColorForToggleFill(for selectionControlColor: SelectionControlColor) -> Color {
        if state == .selected {
            return selectionControlColor.checkedColor.color(for: colorScheme)
        } else if state == .indeterminate {
            return selectionControlColor.checkedColor.color(for: colorScheme)
        } else {
            return selectionControlColor.defaultColor.color(for: colorScheme)
        }
    }
}

extension SelectionControlState {
    var isSelected: Bool {
        switch self {
        case .selected:
            true
        case .deselected, .indeterminate:
            false
        }
    }
    
    var isIndeterminate: Bool {
        switch self {
        case .indeterminate:
            true
        case .deselected, .selected:
            false
        }
    }
    
    func nextState() -> SelectionControlState {
        if isSelected {
            return .deselected
        }
        if isIndeterminate {
            return .selected
        }
        
        return .selected
    }
}
