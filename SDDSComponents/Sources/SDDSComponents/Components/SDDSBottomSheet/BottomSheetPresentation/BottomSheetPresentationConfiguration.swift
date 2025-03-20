import Foundation

public struct BottomSheetPresentationConfiguration {
    public var dimmingAlpha: CGFloat
    public var dimmingAlphaWhenFull: CGFloat
    public var dimmingAlphaWhenInitial: CGFloat
    public var isDimmingEnabled: Bool
    public var detents: [BottomSheetDetent]
    
    public init(
        dimmingAlpha: CGFloat = 0.5,
        dimmingAlphaWhenFull: CGFloat = 1.0,
        dimmingAlphaWhenInitial: CGFloat = 0.0,
        isDimmingEnabled: Bool = true,
        detents: [BottomSheetDetent] = [.fullScreen, .fitContent]
    ) {
        self.dimmingAlpha = dimmingAlpha
        self.dimmingAlphaWhenFull = dimmingAlphaWhenFull
        self.dimmingAlphaWhenInitial = dimmingAlphaWhenInitial
        self.isDimmingEnabled = isDimmingEnabled
        self.detents = detents
    }
}
