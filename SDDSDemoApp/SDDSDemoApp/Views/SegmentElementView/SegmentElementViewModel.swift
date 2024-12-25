import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

public enum SegmentElementContentType: String, CaseIterable {
    case icon
    case counter
    case helpText
    case none
}

final class SegmentElementViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var size: SegmentElementSizeConfiguration = SegmentElementSize.medium
    @Published var iconAttributes: ButtonIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var appearance: SegmentElementAppearance = SDDSSegmentElement.default.appearance
    @Published var variationName: String = SDDSSegmentElement.default.name
    @Published var isPilled: Bool = false
    
    @Published var contentType: SegmentElementContentType = .none
    
    @Published var isIconVisible: Bool = false
    @Published var alignment: SDDSComponents.ButtonAlignment = .leading
    
    @Published var isCounterVisible: Bool = false
    @Published var counter: SDDSCounter? = nil
    @Published var counterData: CounterData = CounterData(value: "")
    @Published var counterSize: CounterSizeConfiguration = CounterSize.medium
    @Published var counterAppearance: CounterAppearance = SDDSCounter.accent.appearance
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
                self.appearance = self.appearance.size(value)
                self.counterAppearance = self.counterAppearance.size(value.counterSize)
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
                    self.counter = nil
                }
            }
            .store(in: &cancellables)
        
        $counterData
            .sink { [weak self] _ in
                guard let self = self else {
                    return
                }
                    setCounter()
            }
            .store(in: &cancellables)
        
        $counterVariationName
            .sink { [weak self] _ in
                guard let self = self else {
                    return
                }
                if self.isCounterVisible {
                    setCounter()
                }
            }
            .store(in: &cancellables)
        
        $counterSize
            .sink { [weak self] _ in
                guard let self = self else {
                    return
                }
                if self.isCounterVisible {
                    setCounter()
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
                    counter = nil
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
    
    private func setCounter() {
        self.counter = SDDSCounter(
            data: self.counterData,
            appearance: self.counterAppearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false
        )
    }
}
