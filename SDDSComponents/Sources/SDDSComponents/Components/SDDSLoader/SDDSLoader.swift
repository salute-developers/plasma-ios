import SwiftUI

/**
 `SDDSLoader` - компонент, который отображает либо Spinner, либо CircularProgressBar в зависимости от переданного appearance.
 
 Это обертка, которая позволяет легко переключаться между различными типами индикаторов загрузки.
 */
public struct SDDSLoader: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.loaderAppearance) private var loaderAppearance
    @Environment(\.spinnerData) private var spinnerData
    @Environment(\.circularProgressBarData) private var circularProgressBarData
    
    private let _appearance: LoaderAppearance?
    
    public init(appearance: LoaderAppearance) {
        self._appearance = appearance
    }
        
    public var body: some View {
        if let spinnerData = spinnerData {
            SDDSSpinner(
                data: .init(
                    isAnimating: spinnerData.isAnimating,
                    appearance: spinnerData.appearance ?? appearance.spinnerAppearance
                )
            )
        } else if let circularProgressBarData = circularProgressBarData {
            SDDSCircularProgressBar(
                data: .init(
                    progress: circularProgressBarData.progress,
                    suffix: circularProgressBarData.suffix,
                    hasTrack: circularProgressBarData.hasTrack,
                    content: circularProgressBarData.content,
                    appearance: circularProgressBarData.appearance ?? appearance.circularProgressAppearance
                )
            )
        } else {
            // Fallback
            SDDSSpinner(appearance: SpinnerAppearance.defaultValue)
        }
    }
    
    var appearance: LoaderAppearance {
        _appearance ?? loaderAppearance
    }
}
