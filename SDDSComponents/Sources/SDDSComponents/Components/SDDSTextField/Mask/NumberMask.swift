import Foundation

public enum NumberMask: Equatable, Hashable {
    case integer
    case decimal(fractionDigits: Int = 2, decimalSeparator: String = ",")
    
    public func format(input: String) -> String {
        let decimalSeparator: String
        switch self {
        case .integer:
            decimalSeparator = ","
        case .decimal(_, let separator):
            decimalSeparator = separator
        }
        
        let hasDecimalSeparator = input.contains(",") || input.contains(".")
        var integerDigits = ""
        var fractionDigits = ""
        
        if hasDecimalSeparator {
            let separatorChar = input.contains(",") ? "," : "."
            let parts = input.components(separatedBy: separatorChar)
            integerDigits = parts[0].filter { $0.isNumber }
            if parts.count > 1 {
                fractionDigits = parts[1].filter { $0.isNumber }
            }
        } else {
            let allDigits = input.filter { $0.isNumber }
            integerDigits = allDigits
        }
        
        guard !integerDigits.isEmpty || !fractionDigits.isEmpty else {
            return ""
        }
        
        if case .decimal(let fractionDigitsCount, _) = self, fractionDigitsCount > 0 {
            if hasDecimalSeparator {
                let trimmedFractionDigits = String(fractionDigits.prefix(fractionDigitsCount))
                let paddingCount = max(0, fractionDigitsCount - trimmedFractionDigits.count)
                let finalFractionDigits = trimmedFractionDigits + String(repeating: "0", count: paddingCount)
                
                if integerDigits.isEmpty {
                    return convertToMaskFormat("0" + decimalSeparator + finalFractionDigits)
                }
                
                let formattedInteger = Self.groupIntegerDigitsWithSpaces(integerDigits)
                return convertToMaskFormat(formattedInteger + decimalSeparator + finalFractionDigits)
            } else {
                let formattedInteger = Self.groupIntegerDigitsWithSpaces(integerDigits)
                return convertToMaskFormat(formattedInteger)
            }
        } else {
            let formattedInteger = Self.groupIntegerDigitsWithSpaces(integerDigits)
            return convertToMaskFormat(formattedInteger)
        }
    }
    
    /// Thousands grouping with spaces; works for arbitrarily long digit strings (no `Int` overflow).
    private static func groupIntegerDigitsWithSpaces(_ digits: String) -> String {
        let onlyDigits = digits.filter { $0.isNumber }
        guard !onlyDigits.isEmpty else { return "" }
        var chars: [Character] = []
        var count = 0
        for ch in onlyDigits.reversed() {
            if count > 0 && count % 3 == 0 {
                chars.append(" ")
            }
            chars.append(ch)
            count += 1
        }
        return String(chars.reversed())
    }
    
    private func convertToMaskFormat(_ formattedString: String) -> String {
        var result = ""
        var currentGroup = ""
        
        for char in formattedString {
            if char.isNumber {
                currentGroup.append(char)
            } else {
                if !currentGroup.isEmpty {
                    if currentGroup.count == 1 {
                        result += "[0]"
                    } else {
                        result += "[\(String(repeating: "0", count: currentGroup.count))]"
                    }
                    currentGroup = ""
                }
                result.append(char)
            }
        }
        
        if !currentGroup.isEmpty {
            if currentGroup.count == 1 {
                result += "[0]"
            } else {
                result += "[\(String(repeating: "0", count: currentGroup.count))]"
            }
        }
        
        return result
    }
    
    public var placeholder: String {
        switch self {
        case .integer:
            return "0"
        case .decimal(let fractionDigits, let decimalSeparator):
            let fractionPart = String(repeating: "0", count: fractionDigits)
            return "0\(decimalSeparator)\(fractionPart)"
        }
    }
}

