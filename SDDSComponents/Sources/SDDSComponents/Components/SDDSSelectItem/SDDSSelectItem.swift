import Foundation
import SwiftUI
import SDDSThemeCore

public struct SDDSSelectItem<LeftContent: View, RightContent: View>: View {
    public let label: String
    public let title: String
    public let subtitle: String
    public let isSelected: Bool
    public let isEnabled: Bool
    private let _appearance: SelectItemAppearance?
    public let onTap: (() -> Void)?
    public let leftContent: LeftContent
    public let rightContent: RightContent
    
    @Environment(\.selectItemAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    @State private var isHovered: Bool = false
    @State private var isHighlighted: Bool = false
    
    public init(
        label: String = "",
        title: String = "",
        subtitle: String = "",
        isSelected: Bool = false,
        isEnabled: Bool = true,
        appearance: SelectItemAppearance? = nil,
        onTap: (() -> Void)? = nil,
        @ViewBuilder leftContent: @escaping () -> LeftContent = { EmptyView() },
        @ViewBuilder rightContent: @escaping () -> RightContent = { EmptyView() }
    ) {
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
        self.isEnabled = isEnabled
        self._appearance = appearance
        self.onTap = onTap
        self.leftContent = leftContent()
        self.rightContent = rightContent()
    }
    
    public var body: some View {
        SDDSCell(
            appearance: appearance.cellAppearance,
            label: label,
            title: title,
            subtitle: subtitle,
            leftContent: {
                HStack(spacing: appearance.size.controlMargin) {
                    selectionControl
                    leftContent
                }
            },
            rightContent: {
                rightContent
            }
        )
        .padding(.leading, appearance.size.paddingStart)
        .padding(.trailing, appearance.size.paddingEnd)
        .padding(.top, appearance.size.paddingTop)
        .padding(.bottom, appearance.size.paddingBottom)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: resolvedHeight)
        .background(currentColor(for: appearance.backgroundColor))
        .shape(pathDrawer: appearance.size.shape)
        .opacity(isEnabled ? 1.0 : appearance.disabledAlpha)
        .contentShape(Rectangle())
        .onTapGesture {
            guard isEnabled else { return }
            onTap?()
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isHighlighted = true }
                .onEnded { _ in isHighlighted = false }
        )
        .onHover { hovering in
            isHovered = hovering
        }
    }
    
    private var appearance: SelectItemAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var resolvedHeight: CGFloat? {
        appearance.size.height > 0 ? appearance.size.height : nil
    }
    
    private func currentColor(for buttonColor: ButtonColor) -> Color {
        if isSelected {
            return buttonColor.selectedColor.color(for: colorScheme, subtheme: subtheme)
        } else if isHighlighted {
            return buttonColor.highlightedColor.color(for: colorScheme, subtheme: subtheme)
        } else if isHovered {
            return buttonColor.hoveredColor.color(for: colorScheme, subtheme: subtheme)
        } else {
            return buttonColor.defaultColor.color(for: colorScheme, subtheme: subtheme)
        }
    }
    
    @ViewBuilder
    private var selectionControl: some View {
        switch appearance.itemType {
        case .single:
            Group {
                if isSelected, let icon = appearance.icon {
                    icon
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(appearance.iconColor.color(for: colorScheme, subtheme: subtheme))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: appearance.size.controlSize, height: appearance.size.controlSize)
                } else {
                    Color.clear
                        .frame(width: appearance.size.controlSize, height: appearance.size.controlSize)
                }
            }
        case .multiple:
            SelectItemCheckboxControl(
                isSelected: isSelected,
                isEnabled: isEnabled,
                size: appearance.size.controlSize,
                appearance: appearance.checkboxAppearance ?? .defaultValue
            )
        }
    }
}

private struct SelectItemCheckboxControl: View {
    let isSelected: Bool
    let isEnabled: Bool
    let size: CGFloat
    let appearance: CheckboxAppearance
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    var body: some View {
        ZStack {
            if isSelected {
                togglePath
                    .fill(appearance.toggleColor.color(for: colorScheme, subtheme: subtheme))
                
                if let checkedIcon = appearance.checkedIcon {
                    checkedIcon.path(in: CGRect(x: 0, y: 0, width: iconWidth, height: iconHeight))
                        .frame(width: iconWidth, height: iconHeight)
                        .foregroundColor(appearance.toggleColorChecked.color(for: colorScheme, subtheme: subtheme))
                } else {
                    CheckmarkDrawer(lineWidth: appearance.size.lineWidth * sizeScale)
                        .path(in: CGRect(x: 0, y: 0, width: iconWidth, height: iconHeight))
                        .frame(width: iconWidth, height: iconHeight)
                        .foregroundColor(appearance.toggleColorChecked.color(for: colorScheme, subtheme: subtheme))
                }
            } else {
                togglePath
                    .stroke(appearance.borderColor.color(for: colorScheme, subtheme: subtheme), lineWidth: appearance.size.lineWidth)
            }
        }
        .frame(width: innerControlWidth, height: innerControlHeight)
        .frame(width: size, height: size)
        .opacity(isEnabled ? 1.0 : appearance.disabledAlpha)
    }
    
    private var sizeScale: CGFloat {
        guard appearance.size.width > 0 else { return 1.0 }
        return size / appearance.size.width
    }
    
    private var iconWidth: CGFloat {
        let width = appearance.size.toggleCheckedIconWidth * sizeScale
        return max(width, 0)
    }
    
    private var iconHeight: CGFloat {
        let height = appearance.size.toggleCheckedIconHeight * sizeScale
        return max(height, 0)
    }
    
    private var togglePath: Path {
        appearance.size.togglePathDrawer.path(
            in: CGRect(
                x: rectLocation,
                y: rectLocation,
                width: borderPathWidth,
                height: borderPathHeight
            )
        )
    }
    
    private var paddings: CGFloat {
        appearance.size.togglePaddings * sizeScale * 2
    }
    
    private var innerControlWidth: CGFloat {
        max(size - paddings, 0)
    }
    
    private var innerControlHeight: CGFloat {
        max(size - paddings, 0)
    }
    
    private var borderPathWidth: CGFloat {
        max(innerControlWidth - appearance.size.lineWidth, 0)
    }
    
    private var borderPathHeight: CGFloat {
        max(innerControlHeight - appearance.size.lineWidth, 0)
    }
    
    private var rectLocation: CGFloat {
        appearance.size.lineWidth / 2
    }
}

