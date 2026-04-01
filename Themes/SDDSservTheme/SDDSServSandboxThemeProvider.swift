import Foundation
import SandboxCore

public struct SDDSServSandboxThemeProvider: SandboxThemeProvider {
    public typealias VariantResolver = @Sendable (ComponentKey) -> [String]
    public typealias AppearanceResolver = @Sendable (ComponentKey, String) -> [String]

    private let variantResolver: VariantResolver?
    private let appearanceResolver: AppearanceResolver?

    public init(
        variantResolver: VariantResolver? = nil,
        appearanceResolver: AppearanceResolver? = nil
    ) {
        self.variantResolver = variantResolver
        self.appearanceResolver = appearanceResolver
    }

    public let id: String = "sdddsServTheme"
    public let title: String = "SDDS Serv"

    public func variantNames(for component: ComponentKey) -> [String] {
        if let variantResolver {
            return variantResolver(component)
        }

        return component.rawValue.isEmpty ? [] : [defaultVariant]
    }

    public func appearanceNames(for component: ComponentKey, variant: String) -> [String] {
        if let appearanceResolver {
            return appearanceResolver(component, variant)
        }

        return component.rawValue.isEmpty ? [] : [defaultAppearance]
    }

    private var defaultVariant: String { "default" }
    private var defaultAppearance: String { "default" }
}
