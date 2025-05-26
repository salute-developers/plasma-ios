import SwiftUI

struct PopoverTailView: View {
    let placement: PopoverPlacement
    let alignment: PopoverAlignment
    let size: CGSize
    let tailWidth: CGFloat
    let tailHeight: CGFloat
    let tailPadding: CGFloat
    let color: Color
    
    var body: some View {
        Canvas { context, size in
            let path = createTailPath(
                placement: placement,
                alignment: alignment,
                tailWidth: tailWidth,
                tailHeight: tailHeight,
                tailPadding: tailPadding,
                size: size
            )
            context.fill(path, with: .color(color), style: .init(eoFill: true))
        }
    }
    
    private func createTailPath(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        tailWidth: CGFloat,
        tailHeight: CGFloat,
        tailPadding: CGFloat,
        size: CGSize
    ) -> Path {
        let w = tailWidth
        let h = tailHeight * 2

        // Прямоугольник-хвост
        var path = Path()
        path.addRect(CGRect(x: 0, y: 0, width: w, height: h))

        // Левая дырка (четверть эллипса)
        path.addEllipse(in: CGRect(
            x: 0 - w/2,
            y: h/2,
            width: w,
            height: h
        ))

        // Правая дырка (четверть эллипса)
        path.addEllipse(in: CGRect(
            x: w/2,
            y: h/2,
            width: w,
            height: h
        ))

        // Трансформации (как раньше)
        let translationX = getTailTranslationX(
            placement: placement,
            alignment: alignment,
            tailWidth: tailWidth,
            tailPadding: tailPadding,
            size: size
        )
        let translationY = getTailTranslationY(
            placement: placement,
            alignment: alignment,
            tailWidth: tailWidth,
            tailPadding: tailPadding,
            size: size
        )
        let rotation = getTailRotationAngle(placement: placement)

        return path
            .applying(CGAffineTransform(translationX: translationX, y: translationY))
            .applying(CGAffineTransform(rotationAngle: rotation))
    }
    
    private func getTailTranslationX(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        tailWidth: CGFloat,
        tailPadding: CGFloat,
        size: CGSize
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
    
    private func getTailTranslationY(
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        tailWidth: CGFloat,
        tailPadding: CGFloat,
        size: CGSize
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
    
    private func getTailRotationAngle(placement: PopoverPlacement) -> CGFloat {
        switch placement {
        case .start:
            return .pi / 2
        case .top:
            return .pi
        case .end:
            return .pi * 1.5
        case .bottom:
            return 0
        }
    }
} 
