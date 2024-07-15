import Foundation
import SwiftUI
@_exported import SDDSThemeCore

enum SelectionControlType {
    case checkbox
    case radiobox
}

public enum SelectionControlState {
    case selected
    case deselected
    case indeterminate
}

public protocol SelectionControlSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var imageSize: CGSize { get }
    var horizontalGap: CGFloat { get }
    var verticalGap: CGFloat { get }
}

public struct SelectionControlStateImages {
    public let selectedImage: Image
    public let deselectedImage: Image
    public let indeterminateImage: Image?
    
    init(selectedImage: Image, deselectedImage: Image, indeterminateImage: Image?) {
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
    let size: SelectionControlSizeConfiguration
    let appearance: AppearanceType
    let images: SelectionControlStateImages
    let accessibility: SelectionControlAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: size.verticalGap) {
            HStack(spacing: size.horizontalGap) {
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
            HStack(spacing: size.horizontalGap) {
                Spacer().frame(width: size.imageSize.width)
                
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
            .typography(appearance.titleTypography)
            .foregroundColor(appearance.titleColor(for: isEnabled).color(for: colorScheme))
            .accessibilityLabel(Text(accessibility.titleLabel))
            .accessibilityValue(Text(title))
    }
    
    @ViewBuilder
    private var subtitleText: some View {
        if let subtitle = subtitle {
            Text(subtitle)
                .typography(appearance.subtitleTypography)
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
                .aspectRatio(contentMode: .fit)
                .foregroundColor(tintColor.color(for: colorScheme))
        } else {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    @ViewBuilder
    private var controlView: some View {
        if let image = image {
            image
                .frame(width: size.imageSize.width, height: size.imageSize.height)
                .applyIf(!isEnabled) { $0.opacity(appearance.disabledImageAlpha) }
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
