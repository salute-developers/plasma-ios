import Foundation

public enum NumberMask: Equatable, Hashable {
    case integer
    case decimal(fractionDigits: Int = 2, decimalSeparator: String = ",")
    
    public func format(input: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.usesGroupingSeparator = true
        
        let decimalSeparator: String
        switch self {
        case .integer:
            decimalSeparator = ","
        case .decimal(_, let separator):
            decimalSeparator = separator
        }
        
        numberFormatter.decimalSeparator = decimalSeparator
        
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
                
                if let integerNumber = Int(integerDigits) {
                    numberFormatter.maximumFractionDigits = 0
                    if let formattedInteger = numberFormatter.string(from: NSNumber(value: integerNumber)) {
                        return convertToMaskFormat(formattedInteger + decimalSeparator + finalFractionDigits)
                    }
                }
            } else {
                if let number = Int(integerDigits) {
                    numberFormatter.maximumFractionDigits = 0
                    if let formatted = numberFormatter.string(from: NSNumber(value: number)) {
                        return convertToMaskFormat(formatted)
                    }
                }
            }
        } else {
            if let number = Int(integerDigits) {
                numberFormatter.maximumFractionDigits = 0
                if let formatted = numberFormatter.string(from: NSNumber(value: number)) {
                    return convertToMaskFormat(formatted)
                }
            }
        }
        
        return ""
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

