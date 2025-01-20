import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class SegmentViewModel: ObservableObject {
    @Published var data: [SegmentElementData] = []
    @Published var size: SegmentSizeConfiguration = SegmentDefaultSize()
    @Published var layoutMode: SegmentLayoutMode = .horizontal
    
    @Published var segmentElementAppearance: SegmentElementAppearance = SDDSSegmentElement.default.appearance
    @Published var segmentElementSize: SegmentElementSizeConfiguration = SegmentElementSize.medium
    
    @Published var variationName: String = ""
    @Published var maxElementsString: String = ""
    @Published var maxElements: Int = 0
    @Published var title: String = ""
    
    private var cancellabels: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
        observeMaxElements()
    }
    
    func observeSizeChange() {
        //        $segmentElementSize
        //            .sink { [weak self] value in
        //                guard let self else { return }
        //
        //            }
        //            .store(in: &cancellabels)
    }
    
    func observeMaxElements() {
        $maxElementsString
            .sink { [weak self] value in
                guard let self else { return }
                
                guard !value.isEmpty else {
                    data = []
                    return
                }
                
                guard let value = Int(value), value < 20 else { return }
                
                if value > maxElements {
                    maxElements = value
                    addElements()
                } else if value == maxElements {
                    return
                } else {
                    maxElements = 0
                    data = []
                }
                
                
            }
            .store(in: &cancellabels)
    }
    
    func addElements() {
        for _ in 0..<maxElements {
            data.append(
                SegmentElementData(
                    title: title,
                    subtitle: "",
                    iconAttributes: nil,
                    isDisabled: false,
                    appearance: segmentElementAppearance,
                    accessibility: SegmentElementAccessibility(),
                    counter: nil,
                    action: {}
                )
            )
        }
    }
    
    func addSegment() {
        data.append(
            SegmentElementData(
                title: title,
                subtitle: "",
                iconAttributes: nil,
                isDisabled: false,
                appearance: segmentElementAppearance,
                accessibility: SegmentElementAccessibility(),
                counter: nil,
                action: {}
            )
        )
    }
    
    func updateSegment(at index: Int, title: String) {
        guard data.indices.contains(index) else { return }
        var segment = data[index]
        
        segment = SegmentElementData(
            title: title,
            subtitle: "",
            iconAttributes: nil,
            isDisabled: false,
            appearance: segment.appearance,
            accessibility: SegmentElementAccessibility(),
            counter: nil,
            action: {}
        )
        
        data[index] = segment
    }
    
    
    func removeElement(at index: Int) {
        guard data.indices.contains(index) else {
            return
        }
        data.remove(at: index)
    }
}
