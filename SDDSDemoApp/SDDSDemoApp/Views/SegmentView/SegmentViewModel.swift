import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var data: [SDDSSegmentItemData] = []
    @Published var size: SegmentSizeConfiguration = SegmentDefaultSize()
    @Published var layoutMode: SegmentLayoutMode = .horizontal

    @Published var segmentItemAppearance: SegmentItemAppearance = SDDSSegmentItem.default.appearance
    @Published var segmentItemSize: SegmentItemSizeConfiguration = SegmentItemSize.medium
    
    @Published var variationName: String = ""
    @Published var maxItemsString: String = ""
    @Published var maxItems: Int = 0
    
    @Published var counterAppearance: CounterAppearance = CounterAppearance()
    @Published var counterText: String = ""
    
    @Published var isSelected: Bool = false
    @Published var selectedItem: UUID = UUID()
    
    @Published var isPilled: Bool
    
    private var cancellabels: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
        observeMaxItems()
        observeShapeStyle()
    }
    
    func observeSizeChange() {
        $segmentItemSize
            .sink { [weak self] value in
                guard let self else { return }
                self.segmentItemAppearance = self.segmentItemAppearance.size(value)
            }
            .store(in: &cancellabels)
    }
    
    func observeMaxItems() {
        $maxItemsString
            .sink { [weak self] value in
                guard let self else { return }
                
                guard !value.isEmpty else {
                    data = []
                    return
                }
                
                guard let value = Int(value), value < 20 else { return }
                
                if value > maxItems {
                    maxItems = value
                    addItems()
                } else if value == maxItems {
                    return
                } else {
                    maxItems = 0
                    data = []
                }
                
                
            }
            .store(in: &cancellabels)
    }
    
    func observeShapeStyle() {
        $isPilled
            .sink { [weak self] value in
                guard let self else {
                    return
                }
                if value {
                    self.segmentItemAppearance = self.segmentItemAppearance.shapeStyle(.pilled)
                } else {
                    self.segmentItemAppearance = self.segmentItemAppearance.shapeStyle(.cornered)
                }
            }
            .store(in: &cancellabels)
    }
    
    func addItems() {
        for _ in 0..<maxItems {
            data.append(
                SDDSSegmentItemData(
                    title: title,
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    appearance: segmentItemAppearance,
                    accessibility: SegmentItemAccessibility(),
                    counterAppearance: counterAppearance,
                    counterText: counterText,
                    isSelected: isSelected,
                    action: {}
                )
            )
        }
    }
    
    func addSegment() {
        data.append(
            SDDSSegmentItemData(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: false,
                appearance: segmentItemAppearance,
                accessibility: SegmentItemAccessibility(),
                counterAppearance: counterAppearance,
                counterText: counterText,
                isSelected: isSelected,
                action: {}
            )
        )
    }
    
    func updateSegmentItem(at index: Int, title: String) {
        guard data.indices.contains(index) else { return }
        var segment = data[index]
        
        segment = SDDSSegmentItemData(
            title: title,
            subtitle: "",
            iconAttributes: nil,
            isDisabled: false,
            appearance: segment.appearance,
            accessibility: SegmentItemAccessibility(),
            counterAppearance: counterAppearance,
            counterText: counterText,
            isSelected: isSelected,
            action: {}
        )
        
        data[index] = segment
    }
    
    
    func removeItem(at index: Int) {
        guard data.indices.contains(index) else { return }
        data.remove(at: index)
    }
}
