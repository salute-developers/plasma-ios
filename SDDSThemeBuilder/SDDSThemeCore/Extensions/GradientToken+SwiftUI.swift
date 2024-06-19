import Foundation
import SwiftUI

public extension LinearGradient {
    var gradient: SwiftUI.LinearGradient {
        let angleInRadians = angle * .pi / 180
        let startX = cos(angleInRadians + .pi) * 0.5 + 0.5
        let startY = sin(angleInRadians + .pi) * 0.5 + 0.5
        let endX = cos(angleInRadians) * 0.5 + 0.5
        let endY = sin(angleInRadians) * 0.5 + 0.5
        
        let stops = zip(colors, locations).map { color, location in
            Gradient.Stop(color: color, location: location)
        }
        
        return SwiftUI.LinearGradient(
            gradient: Gradient(stops: stops),
            startPoint: UnitPoint(x: startX, y: startY),
            endPoint: UnitPoint(x: endX, y: endY)
        )
    }
}

public extension RadialGradient {
    var gradient: SwiftUI.RadialGradient {
        let center = UnitPoint(x: center.x, y: center.y)
        let stops = zip(colors, locations).map { color, location in
            Gradient.Stop(color: color, location: location)
        }

        return SwiftUI.RadialGradient(
            gradient: Gradient(stops: stops),
            center: center,
            startRadius: startRadius,
            endRadius: endRadius
        )
    }
}


public extension AngularGradient {
    var gradient: SwiftUI.AngularGradient {
        let stops = zip(colors, locations).map { color, location in
            Gradient.Stop(color: color, location: location)
        }

        return SwiftUI.AngularGradient(
            gradient: Gradient(stops: stops),
            center: UnitPoint(x: center.x, y: center.y),
            startAngle: Angle(degrees: Double(startAngle)),
            endAngle: Angle(degrees: Double(endAngle))
        )
    }
}
