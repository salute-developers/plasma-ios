import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

enum MaskType: String, CaseIterable {
    case none = "None"
    case phone = "Phone"
    case date = "Date"
    case time = "Time"
    case number = "Number"
    
    var defaultFormat: String {
        switch self {
        case .none:
            return ""
        case .phone:
            return "+7 [000] [000]-[00]-[00]"
        case .date:
            return "[00].[00].[00]"
        case .time:
            return "[00]:[00]"
        case .number:
            return "[0] [000] [000]"
        }
    }
    
    var placeholder: String {
        switch self {
        case .none:
            return "Placeholder"
        case .phone:
            return "+7 000 000-00-00"
        case .date:
            return "ДД.ММ.ГГ"
        case .time:
            return "00:00"
        case .number:
            return "0"
        }
    }
}

final class MaskViewModel: ComponentViewModel<TextFieldVariationProvider> {
    @Published var value: TextFieldValue = .single("")
    @Published var textValue: String = ""
    @Published var title: String = "Title"
    @Published var optionalTitle: String = "Optional"
    @Published var placeholder: String = "Placeholder" {
        didSet {
            // Обновляем маску с кастомным плейсхолдером, если выбрана маска даты
            // и это изменение не из updatePlaceholder
            if !isUpdatingPlaceholder && selectedMaskType == .date && !placeholder.isEmpty && !customFormat.isEmpty {
                updateCurrentMask()
            }
        }
    }
    private var isUpdatingPlaceholder = false
    @Published var caption: String = "Caption"
    @Published var textBefore: String = ""
    @Published var textAfter: String = ""
    @Published var disabled: Bool = false
    @Published var readOnly: Bool = false
    @Published var iconViewEnabled: Bool = true
    @Published var iconActionViewEnabled: Bool = true
    @Published var layout: TextFieldLayout = .default {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    // Mask specific
    @Published var selectedMaskType: MaskType = .none {
        didSet {
            updateMaskFormat()
            updateCurrentMask()
            updatePlaceholder()
        }
    }
    @Published var customFormat: String = "" {
        didSet {
            updateCurrentMask()
            updatePlaceholder()
        }
    }
    @Published var numberFractionDigits: Int = 2 {
        didSet {
            updateCurrentMask()
        }
    }
    @Published var numberDecimalSeparator: String = "," {
        didSet {
            updateCurrentMask()
        }
    }
    @Published var currentMask: TextFieldMask? = nil
    @Published var maskDisplayMode: MaskDisplayMode = .onInput
    
    private func updateCurrentMask() {
        guard selectedMaskType != .none else {
            currentMask = nil
            return
        }
        
        let format = customFormat.isEmpty ? selectedMaskType.defaultFormat : customFormat
        
        switch selectedMaskType {
        case .none:
            currentMask = nil
        case .phone:
            if customFormat.isEmpty {
                currentMask = .phone(.russia)
            } else {
                currentMask = .phone(.custom(format: format))
            }
        case .date:
            if customFormat.isEmpty {
                currentMask = .date(.short)
            } else {
                // Используем кастомный плейсхолдер, если он отличается от стандартного
                let defaultPlaceholder = DateMask.custom(format: format).placeholder
                let customPlaceholder = (placeholder != defaultPlaceholder && !placeholder.isEmpty) ? placeholder : nil
                currentMask = .date(.custom(format: format, placeholder: customPlaceholder))
            }
        case .time:
            if customFormat.isEmpty {
                currentMask = .time(.short)
            } else {
                currentMask = .time(.custom(format: format))
            }
        case .number:
            if numberFractionDigits == 0 {
                currentMask = .number(.integer)
            } else {
                currentMask = .number(.decimal(fractionDigits: numberFractionDigits, decimalSeparator: numberDecimalSeparator))
            }
        }
    }
    
    private func updatePlaceholder() {
        isUpdatingPlaceholder = true
        defer { isUpdatingPlaceholder = false }
        
        switch selectedMaskType {
        case .none:
            placeholder = "Placeholder"
        case .phone:
            placeholder = selectedMaskType.placeholder
        case .date:
            if customFormat.isEmpty {
                placeholder = selectedMaskType.placeholder
            } else {
                // Всегда обновляем placeholder из маски при изменении формата
                // Если пользователь хочет кастомный placeholder, он может задать его после изменения формата
                placeholder = DateMask.custom(format: customFormat).placeholder
            }
        case .time:
            placeholder = selectedMaskType.placeholder
        case .number:
            placeholder = selectedMaskType.placeholder
        }
    }
    
    init() {
        super.init(variationProvider: TextFieldVariationProvider(layout: .default))
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
        
        updateCurrentMask()
        updatePlaceholder()
    }
    
    func updateMaskFormat() {
        if selectedMaskType != .none {
            if selectedMaskType != .number {
                customFormat = selectedMaskType.defaultFormat
            }
            updatePlaceholder()
        }
    }
    
    func updateValueText(_ newText: String) {
        value = .single(newText)
    }
    
    override func onUpdateAppearance() {
        value = .single(textValue)
    }
}
