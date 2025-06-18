import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSTextSkeleton: View {
    @Environment(\.skeletonAppearance) private var environmentAppearance
    private let lineCount: Int
    private let textTypography: TypographyToken
    private let lineWidthProvider: SkeletonLineWidthProvider
    private var _appearance: SkeletonAppearance?
    
    public init(
        appearance: SkeletonAppearance? = nil,
        lineCount: Int = 3,
        textTypography: TypographyToken = .semibold14,
        lineWidthProvider: SkeletonLineWidthProvider = FullWidthLineProvider()
    ) {
        self._appearance = appearance
        self.lineCount = lineCount
        self.textTypography = textTypography
        self.lineWidthProvider = lineWidthProvider
    }
    
    private var appearance: SkeletonAppearance {
        _appearance ?? environmentAppearance
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<lineCount, id: \.self) { index in
                GeometryReader { geometry in
                    let geometryWidth = geometry.size.width
                    let width = geometryWidth * lineWidthProvider.widthFactor(lineIndex: index, lineCount: lineCount)
                    
                    SDDSRectSkeleton(appearance: appearance)
                        .frame(width: width, height: textTypography.lineHeight)
                        .clipped()
                }
                .frame(height: textTypography.lineHeight)
            }
        }
    }
}
