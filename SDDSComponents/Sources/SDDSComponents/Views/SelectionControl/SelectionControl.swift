import Foundation
import SwiftUI
@_exported import SDDSThemeCore

enum SelectionControlType {
    case checkbox
    case radiobox
}

public enum SelectionControlState: String, CaseIterable {
    case selected
    case deselected
    case indeterminate
}

public protocol SelectionControlSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var imageSize: CGSize { get }
    var horizontalGap: CGFloat { get }
    var verticalGap: CGFloat { get }
}

public struct ZeroSelectionControlSize: SelectionControlSizeConfiguration {
    public var debugDescription: String { "ZeroSelectionControlSize "}
    public var imageSize: CGSize { .zero }
    public var horizontalGap: CGFloat { 0 }
    public var verticalGap: CGFloat { 0 }
    public init() {}
}

public struct SelectionControlStateImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    public let indeterminateImage: Image?
    
    public init(selectedImage: Image, deselectedImage: Image, indeterminateImage: Image?) {
        self.selectedImage = selectedImage
        self.deselectedImage = deselectedImage
        self.indeterminateImage = indeterminateImage
    }
}

public struct SelectionControlAccessibility {
    public var titleLabel: String
    public var subtitleLabel: String
    public var controlLabel: String
    public var controlHint: String
    public var controlEnabledValue: String
    public var controlDisabledValue: String

    public init(
        titleLabel: String = "Title",
        subtitleLabel: String = "Subtitle",
        controlLabel: String = "Control",
        controlHint: String = "Double-tap to toggle the control.",
        controlEnabledValue: String = "Enabled",
        controlDisabledValue: String = "Disabled"
    ) {
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
        self.controlLabel = controlLabel
        self.controlHint = controlHint
        self.controlEnabledValue = controlEnabledValue
        self.controlDisabledValue = controlDisabledValue
    }
}

struct SelectionControl<AppearanceType: SelectionControlAppearance>: View {
    @Binding var state: SelectionControlState
    let type: SelectionControlType
    let title: String
    let subtitle: String?
    let isEnabled: Bool
    let appearance: AppearanceType
    let images: SelectionControlStateImages
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
                Spacer().frame(width: appearance.size.imageSize.width)
                
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
            .typography(appearance.titleTypography.typography(with: appearance.size) ?? .undefined)
            .foregroundColor(appearance.titleColor(for: isEnabled).color(for: colorScheme))
            .accessibilityLabel(Text(accessibility.titleLabel))
            .accessibilityValue(Text(title))
    }
    
    @ViewBuilder
    private var subtitleText: some View {
        if let subtitle = subtitle {
            Text(subtitle)
                .typography(appearance.subtitleTypography.typography(with: appearance.size) ?? .undefined)
                .foregroundColor(appearance.subtitleColor(for: isEnabled).color(for: colorScheme))
                .accessibilityLabel(Text(accessibility.subtitleLabel))
                .accessibilityValue(Text(subtitle))
        } else {
            EmptyView()
        }
    }
    
    private var image: Image? {
        switch state {
        case .selected:
            return images.selectedImage
        case .deselected:
            return images.deselectedImage
        case .indeterminate:
            return images.indeterminateImage
        }
    }
    
    @ViewBuilder
    private func tintImage(image: Image) -> some View {
        if let tintColor = appearance.imageTintColor {
            image
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(tintColor.color(for: colorScheme))
        } else {
            image
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
        }
    }
    
    @ViewBuilder
    private var controlView: some View {
        if let image = image {
            tintImage(image: image)
                .frame(width: appearance.size.imageSize.width, height: appearance.size.imageSize.height)
                .applyIf(!isEnabled) { $0.opacity(appearance.disabledAlpha) }
        } else {
            EmptyView()
        }
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
