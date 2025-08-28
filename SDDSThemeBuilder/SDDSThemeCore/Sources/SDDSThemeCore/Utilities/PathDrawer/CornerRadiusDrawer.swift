import Foundation
import SwiftUI



public final class CornerRadiusDrawer: PathDrawer {
    public let cornerRadius: CGFloat
    public let cornerType: CornerRadiusDrawerType
    
    public init(cornerRadius: CGFloat, cornerType: CornerRadiusDrawerType = .all) {
        self.cornerRadius = cornerRadius
        self.cornerType = cornerType
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        switch cornerType {
        case .all:
            // Дефолтное поведение - все углы скруглены
            path.addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
            
        case .specific(let corners):
            // Выборочное применение cornerRadius к определенным углам
            let bezierPath = UIBezierPath()
            
            // Начинаем с левого верхнего угла
            if corners.contains(.topLeft) {
                bezierPath.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
            } else {
                bezierPath.move(to: CGPoint(x: rect.minX, y: rect.minY))
            }
            
            // Верхняя линия
            if corners.contains(.topRight) {
                bezierPath.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
            } else {
                bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            }
            
            // Правый верхний угол
            if corners.contains(.topRight) {
                bezierPath.addArc(withCenter: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                                radius: cornerRadius,
                                startAngle: -CGFloat.pi / 2,
                                endAngle: 0,
                                clockwise: true)
            }
            
            // Правая линия
            if corners.contains(.bottomRight) {
                bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            } else {
                bezierPath.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            }
            
            // Правый нижний угол
            if corners.contains(.bottomRight) {
                bezierPath.addArc(withCenter: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                                radius: cornerRadius,
                                startAngle: 0,
                                endAngle: CGFloat.pi / 2,
                                clockwise: true)
            }
            
            // Нижняя линия
            if corners.contains(.bottomLeft) {
                bezierPath.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
            } else {
                bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            }
            
            // Левый нижний угол
            if corners.contains(.bottomLeft) {
                bezierPath.addArc(withCenter: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                                radius: cornerRadius,
                                startAngle: CGFloat.pi / 2,
                                endAngle: CGFloat.pi,
                                clockwise: true)
            }
            
            // Левая линия
            if corners.contains(.topLeft) {
                bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
            } else {
                bezierPath.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            }
            
            // Левый верхний угол
            if corners.contains(.topLeft) {
                bezierPath.addArc(withCenter: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                                radius: cornerRadius,
                                startAngle: CGFloat.pi,
                                endAngle: -CGFloat.pi / 2,
                                clockwise: true)
            }
            
            bezierPath.close()
            
            // Конвертируем UIBezierPath в SwiftUI Path
            path = Path(bezierPath.cgPath)
        }
        
        return path
    }
}