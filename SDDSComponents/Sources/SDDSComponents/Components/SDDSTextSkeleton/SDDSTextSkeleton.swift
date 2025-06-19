import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSTextSkeleton` представляет собой компонент для отображения текстового скелетона с несколькими строками.

 Компонент создает эффект загрузки текста, отображая несколько строк прямоугольных скелетонов,
 которые имитируют загружаемый текст. Каждая строка может иметь разную ширину в зависимости от провайдера.

 - Parameters:
    - appearance: Параметры внешнего вида скелетона (опционально).
    - lineCount: Количество строк текста (по умолчанию 3).
    - textTypography: Типографика для определения высоты строк (по умолчанию .semibold14).
    - lineWidthProvider: Провайдер ширины строк (по умолчанию FullWidthLineProvider()).

 ## Окружение
 
 - `skeletonAppearance`: Стандартные настройки внешнего вида скелетона

 ## Пример использования

 ```swift
 SDDSTextSkeleton(
     appearance: SkeletonAppearance(
         shape: CornerRadiusDrawer(cornerRadius: 4),
         gradient: .skeletonGradient,
         duration: 2000
     ),
     lineCount: 3,
     textTypography: .semibold14,
     lineWidthProvider: FullWidthLineProvider()
 )
 ```
 */
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
