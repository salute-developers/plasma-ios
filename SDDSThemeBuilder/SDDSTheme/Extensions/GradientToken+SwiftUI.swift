import Foundation
import SwiftUI

public extension LinearGradient {
    var gradient: SwiftUI.LinearGradient {
        let colors = colors
        let locations = locations.map { NSNumber(value: $0) }
        
        let gradient = Gradient(stops: zip(colors, locations).map { Gradient.Stop(color: $0.0, location: CGFloat(truncating: $0.1)) })
        
        let angle = angle
        let angleInRadians = angle * .pi / 180.0
        let x = cos(angleInRadians)
        let y = sin(angleInRadians)
        
        return SwiftUI.LinearGradient(
            gradient: gradient,
            startPoint: UnitPoint(x: (x + 1.0) / 2.0, y: (y + 1.0) / 2.0),
            endPoint: UnitPoint(x: (1.0 - x) / 2.0, y: (1.0 - y) / 2.0)
        )
    }
}

public extension RadialGradient {
    var gradient: SwiftUI.RadialGradient {
        let colors = colors
        let locations = locations.map { NSNumber(value: $0) }
        
        let gradient = Gradient(stops: zip(colors, locations).map { Gradient.Stop(color: $0.0, location: CGFloat(truncating: $0.1)) })
        
        let startUnitPoint = UnitPoint(x: startPoint.x, y: startPoint.y)
        let endUnitPoint = UnitPoint(x: endPoint.x, y: endPoint.y)
        
        return SwiftUI.RadialGradient(
            gradient: gradient,
            center: startUnitPoint,
            startRadius: 0,
            endRadius: hypot(endUnitPoint.x - startUnitPoint.x, endUnitPoint.y - startUnitPoint.y) * sqrt(2)
        )
    }
}

public extension AngularGradient {
    var gradient: SwiftUI.AngularGradient {
        let colors = colors
        let stops = zip(colors, locations).map { Gradient.Stop(color: $0.0, location: $0.1) }
        
        return SwiftUI.AngularGradient(
            gradient: Gradient(stops: stops),
            center: UnitPoint(x: center.x, y: center.y),
            startAngle: Angle(degrees: Double(startAngle)),
            endAngle: Angle(degrees: Double(endAngle))
        )
    }
}
