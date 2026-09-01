import Foundation

extension Formatter {
    static let twoDecimals: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

extension Double {
    var twoDecimalsFormatted: String {
        return Formatter.twoDecimals.string(for: self) ?? ""
    }
}
