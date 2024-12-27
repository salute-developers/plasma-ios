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
    @Published var alignment: SDDSComponents.SegmentElementAlignment = .leading

    var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
    }
    
    private func observeIcon() {
        $isIconVisible
            .sink { [weak self] value in
                guard let self = self else {
                    return
                }
                if value {
                    self.iconAttributes(with: self.alignment)
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
    
    private func iconAttributes(with alignment: SDDSComponents.SegmentElementAlignment) -> SegmentElementIconAttributes {
        .init(image: Image("buttonIcon"), alignment: alignment)
    }
}
