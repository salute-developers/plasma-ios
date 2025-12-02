import Foundation

/// Display mode for mask placeholder
///
/// Controls how the mask placeholder is displayed during text input
public enum MaskDisplayMode: String, CaseIterable {
    /// Placeholder hides when user starts typing (default behavior)
    case onInput
    
    /// Placeholder always visible, typed characters replace placeholder characters
    /// at the same positions, creating an overlay effect
    case always
}

