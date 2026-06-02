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
        public let tenants: [Tenant]

        private enum CodingKeys: String, CodingKey {
            case name
            case url
            case tenants
        }

        public init(name: String, url: String, tenants: [Tenant] = []) {
            self.name = name
            self.url = URL(string: url)!
            self.tenants = tenants
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: .name)
            self.url = try container.decode(URL.self, forKey: .url)
            self.tenants = try container.decodeIfPresent([Tenant].self, forKey: .tenants) ?? []
        }
    }

    /// Описание тенанта на стороне ThemeBuilder: имя + URL дополнительной zip-схемы.
    /// В рантайме переключение тенанта идёт через `Tenant` из `SDDSThemeCore`,
    /// который опирается на это `name`.
    public struct Tenant: Codable {
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
        Theme.plasmaB2C,
        Theme.plasmaHomeDS,
        Theme.stylesSalute
    ].map { $0.themeConfiguration }
    
    public init() {}
}

public extension ThemeBuilderConfiguration.Theme {
    var themeConfiguration: ThemeBuilderConfiguration.ThemeConfiguration {
        switch self {
        case .sddsServTheme:
            .init(
                name: self.rawValue,
                url: themeURL(name: "sdds_serv"),
                tenants: [
                    .init(name: "Gold", url: themeURL(name: "sbermarket_business"))
                ]
            )
        case .plasmaB2C:
            //.init(name: self.rawValue, url: themeURL(name: "plasma_b2c_ACTUAL_TYPOGRAPHY"))
            .init(name: self.rawValue, url: themeURL(name: "plasma_b2c"))
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
    private func themeURL(name: String, file: String = "latest.zip") -> String {
        "\(ThemeBuilderConfiguration.Theme.baseURL)/\(name)/\(file)"
    }
}
