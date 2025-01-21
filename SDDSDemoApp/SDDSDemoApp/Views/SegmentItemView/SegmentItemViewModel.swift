import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

public enum SegmentItemContentType: String, CaseIterable {
    case icon
    case counter
    case helpText
    case none
}

final class SegmentItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var size: SegmentItemSizeConfiguration = SegmentItemSize.medium
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var appearance: SegmentItemAppearance = SDDSSegmentItem.default.appearance
    @Published var variationName: String = SDDSSegmentItem.default.name
    @Published var isPilled: Bool = false
    
    @Published var contentType: SegmentItemContentType = .none
    
    @Published var isIconVisible: Bool = false
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading
    
    @Published var isCounterVisible: Bool = false
    @Published var counterText: String = ""
    @Published var counterAppearance: CounterAppearance? = nil
    @Published var counterVariationName: String = SDDSCounter.accent.name
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeIcon()
        observeSizeChange()
        observeCounter()
        observeContentType()
    }
    
    private func observeIcon() {
        $isIconVisible
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    self.setIconAttributes(alignment: self.alignment)
                } else {
                    self.iconAttributes = nil
                }
            }
            .store(in: &cancellables)
        
        $alignment
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                setIconAttributes(alignment: value)
            }
            .store(in: &cancellables)
        
        $isPilled
            .sink { [weak self] value in
                guard let self = self else {
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
    
    private func observeSizeChange() {
        $size
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if let counterAppearance = counterAppearance, let counterSize = setCounterSize(value) {
                    self.counterAppearance = counterAppearance.size(counterSize)
                }
                self.appearance = self.appearance.size(value)
            }
            .store(in: &cancellables)
    }
    
    private func observeCounter() {
        $isCounterVisible
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    setCounter()
                } else {
                    self.counterAppearance = nil
                }
            }
            .store(in: &cancellables)
    }
    
    private func observeContentType() {
        $contentType
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                switch value {
                case .icon:
                    title = "Label"
                    subtitle = ""
                    isIconVisible = true
                    isCounterVisible = false
                case .helpText:
                    title = "Label"
                    subtitle = "Help Text"
                    isIconVisible = true
                    isCounterVisible = false
                case .counter:
                    title = "Label"
                    subtitle = ""
                    isIconVisible = true
                    isCounterVisible = true
                    alignment = .leading
                case .none:
                    title = ""
                    subtitle = ""
                    iconAttributes = nil
                    counterAppearance = nil
                }
            }
            .store(in: &cancellables)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.ButtonAlignment) {
        iconAttributes = iconAttributes(with: alignment)
    }
    
    private func iconAttributes(with alignment: SDDSComponents.ButtonAlignment) -> ButtonIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
    
    func setCounterSize(_ size: SegmentItemSizeConfiguration) -> CounterSize? {
        guard let size = size as? SegmentItemSize else { return nil }
        
        switch size {
        case .large:
            return CounterSize.small
        case .medium:
            return CounterSize.extraSmall
        case .small:
            return CounterSize.extraSmall
        case .extraSmall:
            return CounterSize.extraExtraSmall
        }
    }
    
    private func setCounter() {
        let newCounterAppearance = SDDSCounter.accent.appearance
        guard let size = setCounterSize(size) else { return }
        self.counterAppearance = newCounterAppearance.size(size)
    }
}
