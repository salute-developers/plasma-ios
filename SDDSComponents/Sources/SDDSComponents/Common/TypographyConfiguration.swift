import Foundation
@_exported import SDDSThemeCore

public protocol SizeConfiguration {}

public protocol GeneralTypographyConfiguration {
    associatedtype Size = SizeConfiguration
    func typography(with size: Size) -> TypographyToken?
}

public struct TypographyConfiguration {
    let applyTypography: (Any) -> TypographyToken?

    public init<T: GeneralTypographyConfiguration>(_ configuration: T) {
        applyTypography = { size in
            guard let size = size as? T.Size else { return nil }
            return configuration.typography(with: size)
        }
    }

    public func typography(with size: Any) -> TypographyToken? {
        return applyTypography(size)
    }
}

public extension GeneralTypographyConfiguration {
    var asContainer: TypographyConfiguration {
        TypographyConfiguration(self)
    }
}

public extension TypographyConfiguration {
    static var `default`: TypographyConfiguration {
        return DefaultTypography().asContainer
    }
}

public struct DefaultTypography: GeneralTypographyConfiguration {
    public func typography(with size: SizeConfiguration) -> TypographyToken? {
        return .undefined
    }
}
