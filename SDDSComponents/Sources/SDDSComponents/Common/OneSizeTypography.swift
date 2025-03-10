import SDDSThemeCore
import Foundation

struct OneSizeTypography<SizeConfiguration>: GeneralTypographyConfiguration {
    var token: TypographyToken?
    
    init(token: TypographyToken?) {
        self.token = token
    }
    
    func typography(with size: SizeConfiguration) -> TypographyToken? {
        return token
    }
}
