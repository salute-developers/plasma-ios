import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class WheelViewModel: ComponentViewModel<WheelVariationProvider> {
    @Published var wheelsCount: Int = 2 {
        didSet {
            updateWheels()
        }
    }
    @Published var visibleItemsCount: Int = 5
    @Published var selection: [Int] = [0, 0, 0]
    @Published var wheels: [WheelData] = []
    @Published var wheelDescriptions: [String] = ["День", "Месяц", "Год", "Час", "Минута"]
    @Published var textAfter: String = "" {
        didSet {
            updateWheels()
        }
    }
    
    private let sampleData: [[String]] = [
        (1...31).map { String(format: "%02d", $0) },
        ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
        (2020...2030).map { "\($0)" },
        (0...23).map { String(format: "%02d", $0) },
        (0...59).map { String(format: "%02d", $0) }
    ]
    
    init() {
        super.init(variationProvider: WheelVariationProvider())
        
        updateWheels()
        
        if let firstVariation = variations.first {
            selectVariation(firstVariation)
        }
    }
    
    private func updateWheels() {
        let count = min(wheelsCount, sampleData.count)
        let afterText = textAfter.isEmpty ? nil : textAfter
        
        // Сохраняем текущий selection
        let previousSelection = selection
        
        wheels = (0..<count).map { index in
            WheelData(
                items: sampleData[index].map { WheelItem(text: $0, textAfter: afterText) },
                description: index < wheelDescriptions.count ? wheelDescriptions[index] : nil
            )
        }
        
        // Восстанавливаем selection или инициализируем новый
        if count == previousSelection.count {
            selection = previousSelection
        } else {
            selection = Array(repeating: 0, count: count)
        }
    }
    
    func updateWheelDescription(at index: Int, description: String) {
        guard index < wheelDescriptions.count else { return }
        wheelDescriptions[index] = description
        updateWheels()
    }
}

