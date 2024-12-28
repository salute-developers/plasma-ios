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
    @Published var contentRight: SegmentElementContentRight = .subtitle("")
    @Published var alignment: SDDSComponents.SegmentElementAlignment = .leading
    
    @Published var counter: SDDSCounter? = SDDSCounter(data: CounterData(value: ""), appearance: CounterAppearance())
    @Published var counterData: String = ""

    var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeIcon()
        observeSizeChange()
//        observeContentTypeChange()
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
    
//    private func observeContentTypeChange() {
//        $contentStyle
//            .sink { [weak self] value in
//                guard let self = self else {
//                    return
//                }
//                setSegmentType(content: value)
//            }
//            .store(in: &cancellables)
//    }
    
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
    
    private func setSegmentType(contentType: SegmentElementContentType) {
        switch contentType {
        case .left:
            guard let iconImage = iconAttributes?.image else { return }
            self.contentType = .left(iconImage)
        case .right:
            switch contentRight {
            case .icon(let image):
                self.contentType = .right(.icon(image))
            case .subtitle(let subtitle):
                self.subtitle = subtitle
            case .counter(let SDDSCounter):
                guard let counter = counter else { return }
                self.contentType = .right(.counter(counter))
            }
        case .none:
            self.contentType = .none
        }
    }
}
