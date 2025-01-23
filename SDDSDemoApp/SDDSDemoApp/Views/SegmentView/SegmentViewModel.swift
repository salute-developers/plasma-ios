import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentViewModel: ObservableObject {
    @Published var title: String = "Label"
    @Published var data: [SDDSSegmentItemData] = []
    @Published var size: SegmentSizeConfiguration = SegmentSize.medium
    @Published var layoutMode: SegmentLayoutMode = .horizontal
    @Published var appearance: SegmentAppearance = SDDSSegment.default.appearance
    @Published var shapeStyle: ComponentShapeStyle = .cornered
    
    @Published var segmentItemAppearance: SegmentItemAppearance = SDDSSegmentItem.default.appearance
    @Published var segmentItemSize: SegmentItemSizeConfiguration = SegmentItemSize.medium
    
    @Published var variationName: String = SDDSSegmentItem.default.name
    @Published var maxItemsString: String = ""
    @Published var maxItems: Int = 0
    
    @Published var counterAppearance: CounterAppearance = CounterAppearance()
    @Published var counterText: String = ""
    
    @Published var isSelected: Bool = false
    @Published var selectedItem: UUID = UUID()
    
    @Published var isPilled: Bool = false
    
    @Published var itemSize: ItemSize = .fixed
    @Published var backgroundColor: Color = .black
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
        observeMaxItems()
        observeShapeStyle()
    }
    
    func observeSizeChange() {
        $size
            .sink { [weak self] value in
                guard let self else { return }
                self.appearance = self.appearance.size(value)
            }
            .store(in: &cancellables)
        
        $segmentItemSize
            .sink { [weak self] value in
                guard let self else { return }
                self.segmentItemAppearance = self.segmentItemAppearance.size(value)
            }
            .store(in: &cancellables)
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
            .store(in: &cancellables)
    }
    
    func observeShapeStyle() {
        $isPilled
            .sink { [weak self] value in
                guard let self else {
                    return
                }
                if value {
                    self.appearance = self.appearance.shapeStyle(.pilled)
                } else {
                    self.appearance = self.appearance.shapeStyle(.cornered)
                }
            }
            .store(in: &cancellables)
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
                isSelected: false,
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
            isSelected: segment.isSelected,
            action: {}
        )
        
        data[index] = segment
    }
    
    
    func removeItem(at index: Int) {
        guard data.indices.contains(index) else { return }
        data.remove(at: index)
    }
    
//    func selectItem(with id: UUID) {
//        for index in data.indices {
//            data[index].isSelected = data[index].id == id
//        }
//        selectedItem = id
//    }
}
