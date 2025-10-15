import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class WheelViewModel: ComponentViewModel<WheelVariationProvider> {
    @Published var description: String = "Выберите значение"
    @Published var descriptionVisible: Bool = true
    @Published var wheelsCount: Int = 2 {
        didSet {
            updateWheels()
        }
    }
    @Published var visibleItemsCount: Int = 5
    @Published var selection: [Int] = [0, 0, 0]
    @Published var wheels: [WheelData] = []
    
    private let sampleData = [
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
        wheels = (0..<count).map { index in
            WheelData(items: sampleData[index].map { WheelItem(text: $0) })
        }
        selection = Array(repeating: 0, count: count)
    }
}

