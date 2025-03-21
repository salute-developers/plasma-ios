import Foundation

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
