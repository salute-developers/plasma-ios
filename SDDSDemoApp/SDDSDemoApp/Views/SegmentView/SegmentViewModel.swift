import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

final class SegmentViewModel: ComponentViewModel<SegmentVariationProvider> {
    @Published var data: [SDDSSegmentItemData] = []
    
    // MARK: - Segment Element
    @Published var value: String = "Value"
    @Published var helperText: String = "Helper Text"
    
    // MARK: - Icon
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isIconVisible: Bool = false {
        didSet {
            self.updateIcon()
        }
    }
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading {
        didSet {
            self.updateIcon()
        }
    }
    
    // MARK: - Counter
    @Published var isCounterVisible: Bool = true
    @Published var counterText: String = "1"
    
    // MARK: - Segment
    @Published var isDisabled: Bool = false {
        didSet {
            updateItems()
        }
    }
    @Published var layoutOrientation: SegmentLayoutOrientation = .horizontal
    @Published var stretch: Bool = false
    @Published var hasBackground: Bool = true
    
    // MARK: - Other state
    @Published var selectedItemId: UUID?
    
    init() {
        super.init(variationProvider: SegmentVariationProvider())
    }
    
    // MARK: - Private
    private func selectSegmentItem(id: UUID) {
        self.selectedItemId = id
    }
        
    // MARK: - Updates
    
    private func updateIcon() {
        self.iconAttributes = isIconVisible ? .init(image: Image("buttonIcon"), alignment: self.alignment) : nil
    }
    
    var segmentHeight: CGFloat {
        switch layoutOrientation {
        case .horizontal:
            return appearance.size.horizontalHeight
        case .vertical:
            return appearance.segmentItemAppearance.size.height * CGFloat(data.count)
        }
    }
    
    private func updateItems() {
        self.data = data.map { item in
            var item = item
            item.isDisabled = isDisabled
            return item
        }
    }
    
    override func onUpdateAppearance() {
        self.selectedItemId = nil
        self.data = []
        self.addItem()
    }
}

extension SegmentViewModel {
    func addItem() {
        let counterApp = self.appearance.segmentItemAppearance.counterAppearance
        print(counterApp)
        let id = UUID()
        let item = SDDSSegmentItemData(
            id: id,
            title: value,
            subtitle: helperText,
            iconAttributes: iconAttributes,
            isDisabled: isDisabled,
            counterEnabled: isCounterVisible,
            appearance: appearance.segmentItemAppearance,
            counterViewProvider: .default(text: counterText),
            action: { [weak self] in
                self?.selectSegmentItem(id: id)
            }
        )
        if selectedItemId == nil {
            self.selectSegmentItem(id: id)
        }
        self.data += [item]
    }
    
    func removeItem(id: UUID) {
        self.data = data.filter { $0.id != id }
    }
}

#Preview {
    SegmentView()
}
