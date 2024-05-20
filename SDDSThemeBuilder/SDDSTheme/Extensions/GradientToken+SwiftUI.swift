import Foundation
import SwiftUI

public extension LinearGradient {
    var gradient: SwiftUI.LinearGradient {
        let angleInRadians = angle * .pi / 180
        let startX = cos(angleInRadians + .pi) * 0.5 + 0.5
        let startY = sin(angleInRadians + .pi) * 0.5 + 0.5
        let endX = cos(angleInRadians) * 0.5 + 0.5
        let endY = sin(angleInRadians) * 0.5 + 0.5
        
        return SwiftUI.LinearGradient(
            colors: colors,
            startPoint: UnitPoint(x: startX, y: startY),
            endPoint: UnitPoint(x: endX, y: endY)
        )
    }
}

public extension RadialGradient {
    var gradient: SwiftUI.RadialGradient {
        let center = UnitPoint(x: startPoint.x, y: startPoint.y)
        let endPoint = UnitPoint(x: endPoint.x, y: endPoint.y)
        let startRadius: CGFloat = 0
        let endRadius: CGFloat = hypot(endPoint.x - center.x, endPoint.y - center.y) * 2
        
        return SwiftUI.RadialGradient(
            colors: colors,
            center: center,
            startRadius: startRadius,
            endRadius: endRadius
        )
    }
}

public extension AngularGradient {
    var gradient: SwiftUI.AngularGradient {
        return SwiftUI.AngularGradient(
            colors: colors,
            center: UnitPoint(x: center.x, y: center.y),
            startAngle: Angle(degrees: Double(startAngle)),
            endAngle: Angle(degrees: Double(endAngle))
        )
    }
}
