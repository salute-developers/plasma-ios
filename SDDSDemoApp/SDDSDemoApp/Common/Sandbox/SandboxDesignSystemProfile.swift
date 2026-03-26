import Foundation

/// Launch profile for sandbox DS isolation.
/// Value is read from `SANDBOX_DS_PROFILE` environment variable in app schemes.
enum SandboxDesignSystemProfile: Equatable {
    case all
    case sddsServ
    case plasmaB2C
    case plasmaHomeDS
    case stylesSalute

    static let environmentKey = "SANDBOX_DS_PROFILE"

    static var current: SandboxDesignSystemProfile {
        from(environmentValue: ProcessInfo.processInfo.environment[environmentKey])
    }

    static func from(environmentValue: String?) -> SandboxDesignSystemProfile {
        guard let value = environmentValue?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased(),
              !value.isEmpty
        else {
            return .all
        }

        switch value {
        case "sddsserv", "sdds_serv", "serv":
            return .sddsServ
        case "plasmab2c", "plasma_b2c", "b2c":
            return .plasmaB2C
        case "plasmahomeds", "plasma_home_ds", "homeds", "home":
            return .plasmaHomeDS
        case "stylessalute", "styles_salute", "salute":
            return .stylesSalute
        default:
            return .all
        }
    }

    var title: String {
        switch self {
        case .all:
            return "Components"
        case .sddsServ:
            return "Components - SDDS Serv"
        case .plasmaB2C:
            return "Components - Plasma B2C"
        case .plasmaHomeDS:
            return "Components - Plasma HomeDS"
        case .stylesSalute:
            return "Components - Styles Salute"
        }
    }

    var supportedThemes: Set<Theme> {
        switch self {
        case .all:
            return Set(Theme.allCases)
        case .sddsServ:
            return [.sdddsServTheme]
        case .plasmaB2C:
            return [.plasmaB2CTheme]
        case .plasmaHomeDS:
            return [.plasmaHomeDSTheme]
        case .stylesSalute:
            return [.stylesSalute]
        }
    }
}
