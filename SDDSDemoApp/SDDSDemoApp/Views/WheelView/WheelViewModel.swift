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
    @Published var wheelLabels: [String] = ["", "", "", "", ""] {
        didSet {
            updateWheels()
        }
    }
    @Published var wheelTextAfter: [String] = ["", "", "", "", ""] {
        didSet {
            updateWheels()
        }
    }
    @Published var dividerStyle: WheelDividerStyle = .divider {
        didSet {
            if var wheelAppearance = appearance as? WheelAppearance {
                wheelAppearance.dividerStyle = dividerStyle
                appearance = wheelAppearance
            }
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
        let previousSelection = selection
        
        wheels = (0..<count).map { index in
            let customLabel = index < wheelLabels.count ? wheelLabels[index] : ""
            let afterText = index < wheelTextAfter.count && !wheelTextAfter[index].isEmpty ? wheelTextAfter[index] : nil
            let items: [WheelItem]
            
            if !customLabel.isEmpty {
                items = sampleData[index].map { _ in WheelItem(text: customLabel, textAfter: afterText) }
            } else {
                items = sampleData[index].map { WheelItem(text: $0, textAfter: afterText) }
            }
            
            return WheelData(
                items: items,
                description: index < wheelDescriptions.count ? wheelDescriptions[index] : nil
            )
        }
        
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
    
    func updateWheelLabel(at index: Int, label: String) {
        guard index < wheelLabels.count else { return }
        wheelLabels[index] = label
    }
    
    func updateWheelTextAfter(at index: Int, textAfter: String) {
        guard index < wheelTextAfter.count else { return }
        wheelTextAfter[index] = textAfter
    }
}
