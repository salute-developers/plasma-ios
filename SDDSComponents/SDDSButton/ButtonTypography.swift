import Foundation
@_exported import SDDSThemeCore

public protocol ButtonTypographyConfiguration {
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken?
}
