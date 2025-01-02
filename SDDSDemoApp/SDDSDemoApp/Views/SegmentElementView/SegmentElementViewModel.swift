import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentElementViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var size: SegmentElementSizeConfiguration = SegmentElementSize.medium
    @Published var contentType: SegmentElementContent = .none
    @Published var contentStyle: SegmentElementContentType = .none
    @Published var iconAttributes: SegmentElementIconAttributes? = nil
    @Published var isDisabled: Bool = false
    @Published var appearance: SegmentElementAppearance = SDDSSegmentElement.default.appearance
    @Published var variationName: String = SDDSSegmentElement.clear.name
    
    @Published var isIconVisible: Bool = false
    @Published var contentRight: SegmentElementContentRight = .subtitle("", nil)
    @Published var alignment: SDDSComponents.SegmentElementAlignment = .leading
    
    @Published var isCounterVisible: Bool = false
    @Published var counter: SDDSCounter? = SDDSCounter(data: CounterData(value: ""), appearance: CounterAppearance())
    @Published var counterData: CounterData = CounterData(value: "")
    @Published var counterAppearance: CounterAppearance = CounterAppearance()
    @Published var counterSize: CounterSizeConfiguration = CounterSize.medium
    @Published var counterVariationName: String = ""
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeIcon()
        observeSizeChange()
        observeContentTypeChange()
        //        observeSubtitle()
        observeCounter()
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
                    self.setSegmentType(contentType: .none)
                    self.iconAttributes = nil
                }
            }
            .store(in: &cancellables)
        
        $alignment
            .sink { [weak self] value in
                guard let self = self, isIconVisible else {
                    return
                }
                self.setIconAttributes(alignment: value)
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
            }
            .store(in: &cancellables)
    }
    
    private func observeContentTypeChange() {
        $contentStyle
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                setSegmentType(contentType: value)
            }
            .store(in: &cancellables)
    }
    
    private func observeSubtitle() {
        $subtitle
            .sink { [weak self] value  in
                guard let self = self else {
                    return
                }
                
                if let iconAttributes = iconAttributes {
                    contentRight = .subtitle(value, iconAttributes.image)
                } else {
                    contentRight = .subtitle(value, nil)
                }
                setSegmentType(contentType: .right)
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
                    setSegmentType(contentType: .right)
                } else {
                    counter = nil
                }
            }
            .store(in: &cancellables)
        
        $counterSize
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                self.counterAppearance = self.counterAppearance.size(value)
            }
            .store(in: &cancellables)
    }
    
    private func setIconAttributes(alignment: SDDSComponents.SegmentElementAlignment) {
        iconAttributes = iconAttributes(with: alignment)
        
        switch alignment {
        case .leading:
            setSegmentType(contentType: .left)
        case .trailing:
            contentRight = .icon(iconAttributes!.image)
            setSegmentType(contentType: .right)
        }
    }
    
    private func iconAttributes(with alignment: SDDSComponents.SegmentElementAlignment) -> SegmentElementIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
    
    private func setCounter() {
        self.counter = SDDSCounter(
            data: self.counterData,
            appearance: self.counterAppearance
        )
        
        guard let counter = counter else { return }
        
        self.contentRight = .counter(counter)
    }
    
    private func setSegmentType(contentType: SegmentElementContentType) {
        switch contentType {
        case .left:
            guard let iconImage = iconAttributes?.image else { return }
            self.contentType = .left(iconImage)
        case .right:
            switch contentRight {
            case .icon(let image):
                self.contentType = .right(.icon(image))
            case .subtitle(let subtitle, let image):
                self.contentType = .right(.subtitle(subtitle, image))
            case .counter(let counter):
                self.contentType = .right(.counter(counter))
            }
        case .none:
            self.contentType = .none
        }
    }
}
