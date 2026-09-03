import SDDSThemeCore
import Foundation

struct OneSizeTypography<SizeConfiguration>: GeneralTypographyConfiguration {
    var token: TypographyToken?

    func typography(with size: SizeConfiguration) -> TypographyToken? {
        return token
    }
}
