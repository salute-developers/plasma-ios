import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class ProgressBarViewModel: ObservableObject {
    // MARK: - Progress Bar Properties
    @Published var progress: Double = 0.5 {
        didSet {
            if !isUpdatingProgress {
                isUpdatingProgressString = true
                progressString = String(format: "%.0f", progress * 100)
                isUpdatingProgressString = false
            }
        }
    }
    
    @Published var progressString: String = "50" {
        didSet {
            if !isUpdatingProgressString {
                isUpdatingProgress = true
                if let value = Double(progressString), value >= 0, value <= 100 {
                    progress = value / 100
                }
                isUpdatingProgress = false
            }
        }
    }
    @Published var isEnabled: Bool = true
    @Published var appearance: ProgressBarAppearance = .defaultExample
    @Published var size: ProgressBarSizeConfiguration = DefaultProgressBarSize()
    
    // MARK: - Screen properties
    @Published var tintColor: ColorStyle = .green
    @Published var trackColor: ColorStyle = .gray
    @Published var height: CGFloat = 4.0
    @Published var indicatorHeight: CGFloat = 6.0
    @Published var cornerRadius: CGFloat = 2.0
    @Published var indicatorCornerRadius: CGFloat = 6.0
    
    private var cancellables: Set<AnyCancellable> = []
    private var isUpdatingProgress = false
    private var isUpdatingProgressString = false

    init() {
        observeColors()
        observeSize()
    }
    
    private func observeColors() {
        $tintColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTintColor(style.color.equalToken) ?? .defaultExample
            }
            .store(in: &cancellables)
        
        $trackColor
            .sink { [weak self] style in
                self?.appearance = self?.appearance.withTrackColor(style.color.equalToken) ?? .defaultExample
            }
            .store(in: &cancellables)
    }
    
    private func observeSize() {
        Publishers.CombineLatest4($height, $indicatorHeight, $cornerRadius, $indicatorCornerRadius)
            .sink { [weak self] (height, indicatorHeight, cornerRadius, indicatorCornerRadius) in
                self?.size = CustomProgressBarSize(
                    height: height,
                    indicatorHeight: indicatorHeight,
                    cornerRadius: cornerRadius,
                    indicatorCornerRadius: indicatorCornerRadius
                )
            }
            .store(in: &cancellables)
    }
}

// Custom Size Configuration
struct CustomProgressBarSize: ProgressBarSizeConfiguration {
    var height: CGFloat
    var indicatorHeight: CGFloat
    var cornerRadius: CGFloat
    var indicatorCornerRadius: CGFloat
    
    var debugDescription: String {
        String(reflecting: self)
    }
}

extension ProgressBarAppearance {
    func withTintColor(_ color: ColorToken) -> ProgressBarAppearance {
        .init(
            tintColor: color,
            trackColor: trackColor
        )
    }
    
    func withTrackColor(_ color: ColorToken) -> ProgressBarAppearance {
        .init(
            tintColor: tintColor,
            trackColor: color
        )
    }
}
