import Foundation
import SwiftUI
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentViewModel: ObservableObject {
    @Published var data: [SDDSSegmentItemData] = []
    
    // MARK: - Segment Element
    @Published var value: String = ""
    @Published var helperText: String = ""
    
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
    @Published var isCounterVisible: Bool = false {
        didSet {
            self.updateCounter()
        }
    }
    @Published var counterText: String = ""
    @Published var counterAppearance: CounterAppearance? = nil {
        didSet {
            self.updateCounterSize()
        }
    }
    @Published var counterSize: CounterSize = .large
    @Published var counterVariationName: String = SDDSCounter.accent.name
    @Published var segmentItemAppearance: SegmentItemAppearance = SDDSSegmentItem.primary.medium.appearance
    
    // MARK: - Segment
    @Published var isDisabled: Bool = false {
        didSet {
            self.updateItems()
        }
    }
    @Published var layoutOrientation: SegmentLayoutOrientation = .horizontal
    @Published var segmentSize: SegmentSize = .medium {
        didSet {
            self.updateSegmentAppearance()
            self.updateSegmentItemAppearance()
        }
    }
    @Published var stretch: Bool = false {
        didSet {
            self.updateSegmentAppearance()
        }
    }
    @Published var appearance: SegmentAppearance = SDDSSegment.default.medium.appearance
    @Published var hasBackground: Bool = true {
        didSet {
            self.updateSegmentAppearance()
        }
    }
    @Published var variationName: String = SDDSSegmentItem.primary.name
    @Published var isPilled: Bool = false {
        didSet {
            self.updateSegmentAppearance()
            self.updateSegmentItemAppearance()
        }
    }
    
    var segmentItemSize: SegmentItemSize = .medium
    
    // MARK: - Other state
    @Published var selectedItemId: UUID?
    
    init() {}
    
    // MARK: - Private
    private var shapeStyle: ComponentShapeStyle {
        isPilled ? .pilled : .cornered
    }
    
    private func selectSegmentItem(id: UUID) {
        self.selectedItemId = id
    }
    
    private func segmentItemSize(with segmentSize: SegmentSize) -> SegmentItemSize {
        switch segmentSize {
        case .large:
            return .large
        case .medium:
            return .medium
        case .small:
            return .small
        case .extraSmall:
            return .extraSmall
        }
    }
    
    private func counterSize(with segmentItemSize: SegmentItemSize) -> CounterSize {
        switch segmentItemSize {
        case .large:
            return .small
        case .medium:
            return .extraSmall
        case .small:
            return .extraSmall
        case .extraSmall:
            return .extraExtraSmall
        }
    }
    
    // MARK: - Updates
    
    private func updateSegmentItemSize() {
        self.segmentItemSize = segmentItemSize(with: segmentSize)
    }
    
    private func updateItems() {
        self.updateSegmentItemSize()
        self.updateCounterSize()
        self.data = data.map { item in
            let appearance = item
                .appearance
                .shapeStyle(shapeStyle)
                .size(segmentItemSize)
            
            return .init(
                id: item.id,
                title: item.title,
                subtitle: item.subtitle,
                iconAttributes: item.iconAttributes,
                isDisabled: item.isDisabled,
                appearance: appearance,
                counterViewProvider: item.counterViewProvider,
                counterAppearance: item.counterAppearance?.size(counterSize),
                action: item.action
            )
        }
    }
    
    private func updateSegmentAppearance() {
        appearance = appearance
            .size(segmentSize)
            .stretch(stretch)
            .hasBackground(hasBackground)
            .segmentItemAppearance(segmentItemAppearance.shapeStyle(shapeStyle))
        
        self.updateItems()
    }
    
    private func updateSegmentItemAppearance() {
        segmentItemAppearance = segmentItemAppearance
            .shapeStyle(shapeStyle)
            .size(segmentItemSize)
    }
    
    private func updateIcon() {
        self.iconAttributes = isIconVisible ? .init(image: Image("buttonIcon"), alignment: self.alignment) : nil
    }
    
    private func updateCounterSize() {
        self.counterSize = counterSize(with: segmentItemSize)
    }
    
    private func updateCounterAppearance() {
        counterAppearance = counterAppearance?.size(counterSize)
    }
    
    private func updateCounter() {
        if isCounterVisible {
            let counterApperance = SDDSCounter.accent.medium.appearance
            self.counterAppearance = counterApperance.size(counterSize(with: segmentItemSize))
        } else {
            self.counterAppearance = nil
        }
    }
    
    var segmentHeight: CGFloat {
        switch layoutOrientation {
        case .horizontal:
            return segmentSize.horizontalHeight
        case .vertical:
            return segmentItemSize.height * CGFloat(data.count)
        }
    }
}

extension SegmentViewModel {
    func addItem() {
        updateCounterSize()
        updateCounterAppearance()
        let id = UUID()
        let item = SDDSSegmentItemData(
            id: id,
            title: value,
            subtitle: helperText,
            iconAttributes: iconAttributes,
            isDisabled: isDisabled,
            appearance: segmentItemAppearance,
            counterViewProvider: .default(text: counterText),
            counterAppearance: counterAppearance,
            action: { [weak self] in
                self?.selectSegmentItem(id: id)
            }
        )
        self.data += [item]
    }
    
    func removeItem(id: UUID) {
        self.data = data.filter { $0.id != id }
    }
}
