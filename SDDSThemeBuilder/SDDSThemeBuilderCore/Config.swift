import Foundation

public struct ThemeBuilderConfiguration: Codable {
    public enum Theme: String, Codable, CaseIterable {
        case `default` = "Default"
        case plasmaB2C = "PlasmaB2C"
        case plasmaGiga = "PlasmaGiga"
        case plasmaWeb = "PlasmaWeb"
        case plasmaHomeDS = "PlasmaHomeDS"
        case sberHealth = "SberHealth"
        case sbermarket = "Sbermarket"
        case sbermarketBusiness = "SbermarketBusiness"
        case sbermarketMetro = "SbermarketMetro"
        case sbermarketSelgros = "SbermarketSelgros"
        case sbermarketWlbusiness = "SbermarketWlbusiness"
        case sberonline = "Sberonline"
        case sberprime = "Sberprime"
        case sddsCs = "SDDSCS"
        case sddsDfa = "SDDSDFA"
        case sddsFinportal = "SDDSFinportal"
        case sddsInsol = "SDDSInsol"
        case sddsOs = "SDDSOS"
        case sddsServTheme = "SDDSServ"
        case stylesSalute = "StylesSalute"
    }
    
    public struct ThemeConfiguration: Codable {
        public let name: String
        public let url: URL
        
        public init(name: String, url: String) {
            self.name = name
            self.url = URL(string: url)!
        }
    }
    
    public var paletteURL: URL = URL(string: "https://raw.githubusercontent.com/salute-developers/plasma/dev/packages/plasma-colors/palette/general.json")!
    public var themes: [ThemeConfiguration] = [
        Theme.sddsServTheme,
        Theme.stylesSalute,
        Theme.plasmaB2C,
        Theme.plasmaHomeDS
    ].map { $0.themeConfiguration }
    
    public init() {}
}

public extension ThemeBuilderConfiguration.Theme {
    var themeConfiguration: ThemeBuilderConfiguration.ThemeConfiguration {
        switch self {
        case .sddsServTheme:
            .init(name: self.rawValue, url: themeURL(name: "sdds_serv"))
        case .plasmaB2C:
            .init(name: self.rawValue, url: themeURL(name: "plasma_b2c_ACTUAL_TYPOGRAPHY"))
        case .plasmaGiga:
            .init(name: self.rawValue, url: themeURL(name: "plasma_giga"))
        case .plasmaWeb:
            .init(name: self.rawValue, url: themeURL(name: "plasma_web"))
        case .plasmaHomeDS:
            .init(name: self.rawValue, url: themeURL(name: "plasma_homeds"))
        case .sberHealth:
            .init(name: self.rawValue, url: themeURL(name: "sberHealth"))
        case .sbermarket:
            .init(name: self.rawValue, url: themeURL(name: "sbermarket"))
        case .sbermarketBusiness:
            .init(name: self.rawValue, url: themeURL(name: "sbermarket_business"))
        case .sbermarketMetro:
            .init(name: self.rawValue, url: themeURL(name: "sbermarket_metro"))
        case .sbermarketSelgros:
            .init(name: self.rawValue, url: themeURL(name: "sbermarket_selgros"))
        case .sbermarketWlbusiness:
            .init(name: self.rawValue, url: themeURL(name: "sbermarket_wlbusiness"))
        case .sberonline:
            .init(name: self.rawValue, url: themeURL(name: "sberonline"))
        case .sberprime:
            .init(name: self.rawValue, url: themeURL(name: "sberprime"))
        case .sddsCs:
            .init(name: self.rawValue, url: themeURL(name: "sdds_cs"))
        case .sddsDfa:
            .init(name: self.rawValue, url: themeURL(name: "sdds_dfa"))
        case .sddsFinportal:
            .init(name: self.rawValue, url: themeURL(name: "sdds_finportal"))
        case .sddsInsol:
            .init(name: self.rawValue, url: themeURL(name: "sdds_insol"))
        case .sddsOs:
            .init(name: self.rawValue, url: themeURL(name: "sdds_os"))
        case .stylesSalute:
            .init(name: self.rawValue, url: themeURL(name: "stylesSalute"))
        case .default:
            .init(name: self.rawValue, url: themeURL(name: "default"))
        }
    }
    
    static var baseURL: String {
        "https://github.com/salute-developers/theme-converter/raw/refs/heads/main/themes"
    }
    private func themeURL(name: String) -> String {
        "\(ThemeBuilderConfiguration.Theme.baseURL)/\(name)/latest.zip"
    }
}
