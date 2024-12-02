import Foundation
import SwiftUI
import Combine
import SDDSComponents
import SDDSComponentsPreview
import SDDSServTheme

final class CounterViewModel: ObservableObject {
    @Published var data: CounterData = CounterData(value: "1")
    @Published var appearance: CounterAppearance = SDDSCounter.black.appearance
    @Published var size: CounterSizeConfiguration = CounterSize.medium
    
    @Published var variationName: String = SDDSCounter.black.name
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        observeSizeChange()
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
}
