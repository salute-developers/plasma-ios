import SwiftUI

struct PopoverTailShape: Shape {
    let placement: PopoverPlacement
    let alignment: PopoverAlignment
    let size: CGSize
    let tailWidth: CGFloat
    let tailHeight: CGFloat
    let tailPadding: CGFloat

    func path(in rect: CGRect) -> Path {
        createTailPath(
            placement: placement,
            alignment: alignment,
            size: size,
            tailWidth: tailWidth,
            tailHeight: tailHeight,
            tailPadding: tailPadding
        )
    }
    
    func createTailPath(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        size: CGSize,
        tailWidth: CGFloat,
        tailHeight: CGFloat,
        tailPadding: CGFloat
    ) -> Path {
        var path = Path()
        
        let arc1Rect = CGRect(x: -tailWidth, y: -tailHeight * 2, width: tailWidth, height: tailHeight * 2)
        path.addArc(
            center: CGPoint(x: arc1Rect.midX, y: arc1Rect.midY),
            radius: tailWidth / 2,
            startAngle: .degrees(0),
            endAngle: .degrees(90),
            clockwise: false
        )

        path.addLine(to: CGPoint(x: 0, y: 2))

        let arc2Rect = CGRect(x: 0, y: -tailHeight * 2, width: tailWidth, height: tailHeight * 2)
        path.addArc(
            center: CGPoint(x: arc2Rect.midX, y: arc2Rect.midY),
            radius: tailWidth / 2,
            startAngle: .degrees(90),
            endAngle: .degrees(180),
            clockwise: false
        )
        
        path.closeSubpath()

        // Transform
        let tx = getTailTranslationX(
            placement: placement,
            alignment: alignment,
            size: size,
            tailWidth: tailWidth,
            tailPadding: tailPadding
        )
        let ty = getTailTranslationY(
            placement: placement,
            alignment: alignment,
            size: size,
            tailWidth: tailWidth,
            tailPadding: tailPadding
        )
        let rotation = getTailRotationAngle(placement)

        var transform = CGAffineTransform.identity
            .translatedBy(x: tx, y: ty)
            .rotated(by: rotation * .pi / 180)
            .scaledBy(x: 1.5, y: 1)

        return path.applying(transform)
    }
    
    func getTailTranslationX(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        size: CGSize,
        tailWidth: CGFloat,
        tailPadding: CGFloat
    ) -> CGFloat {
        let horizontalAlignment: CGFloat
        switch alignment {
        case .start:
            horizontalAlignment = tailPadding + tailWidth / 2
        case .end:
            horizontalAlignment = size.width - tailPadding - tailWidth / 2
        case .center:
            horizontalAlignment = size.width / 2
        }

        switch placement {
        case .start:
            return size.width
        case .end:
            return 0
        case .top, .bottom:
            return horizontalAlignment
        }
    }

    func getTailTranslationY(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        size: CGSize,
        tailWidth: CGFloat,
        tailPadding: CGFloat
    ) -> CGFloat {
        let verticalAlignment: CGFloat
        switch alignment {
        case .start:
            verticalAlignment = tailPadding + tailWidth / 2
        case .end:
            verticalAlignment = size.height - tailPadding - tailWidth / 2
        case .center:
            verticalAlignment = size.height / 2
        }

        switch placement {
        case .top:
            return size.height
        case .bottom:
            return 0
        case .start, .end:
            return verticalAlignment
        }
    }

    func getTailRotationAngle(_ placement: PopoverPlacement) -> CGFloat {
        switch placement {
        case .start: return 90
        case .top: return 180
        case .end: return 270
        case .bottom: return 0
        }
    }
}
