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
            guard let size = size as? T.Size 
            else { 
                print("Can't cast size \(size)")
                return nil
            }
            
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
