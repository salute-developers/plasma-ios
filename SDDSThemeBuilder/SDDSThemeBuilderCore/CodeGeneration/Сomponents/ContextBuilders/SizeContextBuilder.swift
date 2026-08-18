import Foundation

final class SizeContextBuilder: CodeGenerationContextBuilder {
    enum Style: String {
        case point
        case size
    }
    
    let x: Double?
    let y: Double?
    let style: SizeContextBuilder.Style
    let nullify: Bool
    
    init(x: Double?, y: Double?, style: SizeContextBuilder.Style = SizeContextBuilder.Style.point, nullify: Bool = false) {
        self.x = x
        self.y = y
        self.style = style
        self.nullify = nullify
    }
    
    var context: String? {
        // Конфиг задаёт координаты по отдельности и вторую часто опускает (у формы
        // `indicatorOffsetX: 4` без `Y`). Раньше это теряло и заданную координату —
        // смещение пропадало целиком. У смещения пропущенная координата = 0, а у
        // размера отсутствие измерения значит «контента нет» — там нужны оба.
        let hasEnough = style == .point ? (x != nil || y != nil) : (x != nil && y != nil)
        guard hasEnough else {
            if nullify {
                return nil
            }
            switch style {
            case .point:
                return "CGPoint.zero"
            case .size:
                return "CGSize.zero"
            }
        }
        let x = self.x ?? 0
        let y = self.y ?? 0

        switch style {
        case .point:
            return "CGPoint(x:\(x), y:\(y))"
        case .size:
            return "CGSize(width:\(x), height:\(y))"
        }
    }
}
