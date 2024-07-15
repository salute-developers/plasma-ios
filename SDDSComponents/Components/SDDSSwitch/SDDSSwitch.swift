import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SwitchSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var width: CGFloat? { get }
    var verticalGap: CGFloat { get }
}

public struct SwitchAppearance {
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let enabledTitleColor: ColorToken
    public let enabledSubtitleColor: ColorToken
    public let enabledTintColor: ColorToken
    public let disabledTitleColor: ColorToken
    public let disabledSubtitleColor: ColorToken
    public let disabledTintColor: ColorToken
}

public extension SwitchAppearance {
    func tintColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledTintColor : disabledTintColor
    }

    func titleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledTitleColor : disabledTitleColor
    }

    func subtitleColor(for isEnabled: Bool) -> ColorToken {
        return isEnabled ? enabledSubtitleColor : disabledSubtitleColor
    }
}

public struct SwitchAccessibility {
    public var titleLabel: String
    public var subtitleLabel: String
    public var toggleLabel: String
    public var toggleHint: String
    public var switchLabel: String
    public var switchEnabledValue: String
    public var switchDisabledValue: String
    
    public init(
        titleLabel: String = "Title",
        subtitleLabel: String = "Subtitle",
        toggleLabel: String = "Toggle",
        toggleHint: String = "Double-tap to toggle the switch.",
        switchLabel: String = "Switch",
        switchEnabledValue: String = "Enabled",
        switchDisabledValue: String = "Disabled"
    ) {
        self.titleLabel = titleLabel
        self.subtitleLabel = subtitleLabel
        self.toggleLabel = toggleLabel
        self.toggleHint = toggleHint
        self.switchLabel = switchLabel
        self.switchEnabledValue = switchEnabledValue
        self.switchDisabledValue = switchDisabledValue
    }
}

public struct SDDSSwitch: View {
    public let title: String
    public let subtitle: String
    @Binding public var isOn: Bool
    public let isEnabled: Bool
    public let size: SwitchSizeConfiguration
    public let appearance: SwitchAppearance
    public let switchAccessibility: SwitchAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    
    public init(
        title: String = "",
        subtitle: String = "",
        isOn: Binding<Bool> = .constant(true),
        isEnabled: Bool = true,
        size: SwitchSizeConfiguration,
        appearance: SwitchAppearance,
        switchAccessibility: SwitchAccessibility
    ) {
        self.title = title
        self.subtitle = subtitle
        self._isOn = isOn
        self.isEnabled = isEnabled
        self.size = size
        self.appearance = appearance
        self.switchAccessibility = switchAccessibility
    }
    
    public var body: some View {
        if let width = size.width {
            content
                .frame(width: width)
        } else {
            content
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: size.verticalGap) {
            HStack {
                if !title.isEmpty {
                    Text(title)
                        .typography(titleTypography)
                        .foregroundColor(appearance.titleColor(for: isEnabled).color(for: colorScheme))
                        .accessibilityLabel(Text(switchAccessibility.titleLabel))
                        .accessibilityValue(Text(title))
                }
                if title.isEmpty && subtitle.isEmpty {
                    Spacer(minLength: 0)
                }
                Toggle("", isOn: $isOn)
                    .toggleStyle(SwitchToggleStyle(tint: appearance.tintColor(for: isEnabled).color(for: colorScheme)))
                    .padding(.leading, -10.0)
                    .accessibilityLabel(Text(switchAccessibility.toggleLabel))
                    .accessibilityValue(Text(isOn ? "On" : "Off"))
                    .accessibilityHint(Text(switchAccessibility.toggleHint))
            }
            if !subtitle.isEmpty {
                Text(subtitle)
                    .typography(subtitleTypography)
                    .foregroundColor(appearance.subtitleColor(for: isEnabled).color(for: colorScheme))
                    .accessibilityLabel(Text(switchAccessibility.subtitleLabel))
                    .accessibilityValue(Text(subtitle))
            }
        }
        .disabled(!isEnabled)
        .padding([.leading, .trailing], 1.0)
        .accessibilityElement(children: .combine) // Ensures that the entire switch view is treated as a single element
        .accessibilityLabel(Text(switchAccessibility.switchLabel))
        .accessibilityValue(Text(isEnabled ? switchAccessibility.switchEnabledValue : switchAccessibility.switchDisabledValue))
    }
    
    var titleTypography: TypographyToken {
        if let typography = appearance.titleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(size.debugDescription).")
        }
    }
    
    var subtitleTypography: TypographyToken {
        if let typography = appearance.subtitleTypography.typography(with: size) {
            return typography
        } else {
            fatalError("Undefined Switch Typography for size \(size.debugDescription). Using a default value.")
        }
    }
}

// MARK: - Preview
struct SDDSSwitchPreview: PreviewProvider {
    static var previews: some View {
        SDDSSwitch.defaultExample
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default")
            .debug()
        
        SDDSSwitch.emptyDescription
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Empty Description")
            .debug()
        
        SDDSSwitch.onlyToggle
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Only Toggle")
            .debug()
    }
}

struct SwitchSize: SwitchSizeConfiguration {
    var debugDescription: String {
        String(reflecting: self)
    }

    var width: CGFloat?
    var verticalGap: CGFloat
    
    init(width: CGFloat? = 170, verticalGap: CGFloat = 0) {
        self.width = width
        self.verticalGap = verticalGap
    }
}

extension SDDSSwitch {
    static var defaultExample: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "Description",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var emptyDescription: SDDSSwitch {
        SDDSSwitch(
            title: "Title",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
    
    static var onlyToggle: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(true),
            isEnabled: true,
            size: SwitchSize(width: nil),
            appearance: SwitchAppearance.defaultAppearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}

struct SwitchTypography: GeneralTypographyConfiguration {
    let token: TypographyToken
    
    func typography(with size: SizeConfiguration) -> TypographyToken? {
        return token
    }
}

extension SwitchTypography {
    static func typography(_ token: TypographyToken) -> TypographyConfiguration {
        SwitchTypography(token: token).asContainer
    }
}

extension SwitchAppearance {
    static var defaultAppearance: SwitchAppearance {
        .init(
            titleTypography: SwitchTypography.typography(.semibold14),
            subtitleTypography: SwitchTypography.typography(.semibold12),
            enabledTitleColor: .blackTitleColor,
            enabledSubtitleColor: .subtitleColor,
            enabledTintColor: .greenColor,
            disabledTitleColor: .blackTitleColor.withOpacity(0.3),
            disabledSubtitleColor: .subtitleColor.withOpacity(0.3),
            disabledTintColor: .greenColor.withOpacity(0.3)
        )
    }
}
