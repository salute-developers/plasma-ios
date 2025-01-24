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
    @Published var layoutOrientation: SegmentLayoutOrientation = .horizontal
    @Published var appearance: SegmentAppearance = SDDSSegment.default.appearance
    @Published var backgroundColor: Bool = true
    
    @Published var segmentItemAppearance: SegmentItemAppearance = SDDSSegmentItem.default.appearance
    @Published var segmentItemSize: SegmentItemSizeConfiguration = SegmentItemSize.medium
    @Published var variationName: String = SDDSSegmentItem.default.name
    @Published var counterAppearance: CounterAppearance? = nil
    @Published var counterText: String = ""
    @Published var isSelected: Bool = false
    @Published var isPilled: Bool = false
    
    @Published var maxItemsString: String = ""
    @Published var maxItems: Int = 0
    
    @Published var strechMode: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
        observeMaxItems()
        observeShapeStyle()
        observeOrientation()
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
        
        $strechMode
            .sink { [weak self] value in
                guard let self, value else { return }
                self.appearance = self.appearance.strechMode(.flexible)
            }
            .store(in: &cancellables)
    }
    
    //TODO: Подумать над оптимизацией
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
                    self.segmentItemAppearance = segmentItemAppearance.shapeStyle(.pilled)
                    self.appearance = self.appearance.segmentItemAppearance(self.segmentItemAppearance)
                } else {
                    self.segmentItemAppearance = segmentItemAppearance.shapeStyle(.cornered)
                    self.appearance = self.appearance.segmentItemAppearance(self.segmentItemAppearance)
                }
            }
            .store(in: &cancellables)
    }
    
    func observeOrientation() {
        $layoutOrientation
            .sink { [weak self] value in
                guard let self else {
                    return
                }
                self.appearance = self.appearance.layoutOrientation(value)
            }
            .store(in: &cancellables)
    }
    
    func addItems() {
        for i in 0..<maxItems {
            //TODO: Подумать над оптимизацией
            isSelected = i == 0 ? true : false
            data.append(
                SDDSSegmentItemData(
                    title: title,
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    appearance: segmentItemAppearance,
                    counterAppearance: counterAppearance,
                    counterText: counterText,
                    //TODO: Проверить что состояние передано (Нужно ли это делать?)
                    isSelected: Binding(
                        get: { self.isSelected },
                        set: { newValue in
                            self.isSelected = newValue
                        }
                    ),
                    action: {}
                )
            )
        }
    }
    
    func updateSegmentItem(id: UUID, title: String) {
        if let index = data.firstIndex(where: { $0.id == id }) {
            var segment = data[index]
            segment = SDDSSegmentItemData(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: false,
                appearance: segment.appearance,
                counterAppearance: counterAppearance,
                counterText: counterText,
                //TODO: Проверить что состояние передано (Нужно ли это делать?)
                isSelected: Binding(
                    get: { self.isSelected },
                    set: { self.isSelected = $0 }
                ),
                action: {}
            )
            data[index] = segment
        }
    }
    
    func removeItem(id: UUID) {
        if let index = data.firstIndex(where: { $0.id == id }) {
            data.remove(at: index)
        }
    }
}

