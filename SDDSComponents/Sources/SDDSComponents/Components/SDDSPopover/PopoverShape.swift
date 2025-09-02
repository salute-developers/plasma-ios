import SwiftUI
import SDDSThemeCore

struct PopoverShape: Shape {
    let pathDrawer: PathDrawer
    let tailWidth: CGFloat
    let tailHeight: CGFloat
    let tailPosition: PopoverPlacement
    let tailAlignment: PopoverAlignment
    
    func path(in rect: CGRect) -> Path {
        let cornerRadius = getCornerRadius()
        let mainRect = rect.insetBy(dx: 0, dy: tailHeight)
        if tailWidth > 0 && tailHeight > 0 && tailPosition == .bottom {
            return pathWithBottomTail(in: mainRect, fullRect: rect, cornerRadius: cornerRadius)
        } else {
            var path = Path()
            path.addPath(pathDrawer.path(in: mainRect))
            return path
        }
    }
    
    private func getCornerRadius() -> CGFloat {
        if let drawer = pathDrawer as? CornerRadiusDrawer {
            return drawer.cornerRadius
        } else {
            return 0
        }
    }
    
    // Только для bottom: строим Path с хвостиком как частью контура
    private func pathWithBottomTail(in mainRect: CGRect, fullRect: CGRect, cornerRadius: CGFloat) -> Path {
        let r1 = tailHeight / 2
        let r2 = tailWidth / 2
        let centerX: CGFloat
        switch tailAlignment {
        case .start:
            centerX = mainRect.minX + cornerRadius + tailWidth/2
        case .center:
            centerX = mainRect.midX
        case .end:
            centerX = mainRect.maxX - cornerRadius - tailWidth/2
        }
        let tailBaseY = mainRect.maxY
        let tailTipY = fullRect.maxY
        let tailLeftX = centerX - tailWidth/2
        let tailRightX = centerX + tailWidth/2
        var path = Path()
        // 1. Левый верхний угол
        path.move(to: CGPoint(x: mainRect.minX + cornerRadius, y: mainRect.minY))
        // 2. Верхняя сторона
        path.addLine(to: CGPoint(x: mainRect.maxX - cornerRadius, y: mainRect.minY))
        // 3. Правый верхний угол
        path.addArc(center: CGPoint(x: mainRect.maxX - cornerRadius, y: mainRect.minY + cornerRadius), radius: cornerRadius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        // 4. Правая сторона
        path.addLine(to: CGPoint(x: mainRect.maxX, y: mainRect.maxY - cornerRadius))
        // 5. Правый нижний угол
        path.addArc(center: CGPoint(x: mainRect.maxX - cornerRadius, y: mainRect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        // 6. До начала хвостика
        path.addLine(to: CGPoint(x: tailRightX, y: tailBaseY))
        // 7. Правая дуга хвостика (четверть эллипса)
        path.addArc(center: CGPoint(x: tailRightX, y: tailTipY), radius: r1, startAngle: .degrees(270), endAngle: .degrees(180), clockwise: true)
        // 8. Левый дуга хвостика (четверть эллипса)
        path.addArc(center: CGPoint(x: tailLeftX, y: tailTipY), radius: r1, startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
        // 9. До левого нижнего угла
        path.addLine(to: CGPoint(x: mainRect.minX + cornerRadius, y: mainRect.maxY))
        // 10. Левый нижний угол
        path.addArc(center: CGPoint(x: mainRect.minX + cornerRadius, y: mainRect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        // 11. Левая сторона
        path.addLine(to: CGPoint(x: mainRect.minX, y: mainRect.minY + cornerRadius))
        // 12. Левый верхний угол (замыкаем)
        path.addArc(center: CGPoint(x: mainRect.minX + cornerRadius, y: mainRect.minY + cornerRadius), radius: cornerRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.closeSubpath()
        return path
    }
}
 
