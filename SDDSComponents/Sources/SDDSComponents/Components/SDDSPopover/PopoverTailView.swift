import SwiftUI

struct PopoverTailView: View {
    let width: CGFloat
    let height: CGFloat
    let color: Color

    var body: some View {
        Canvas { context, size in
            let r1 = height / 2
            let r2 = width / 2
            var path = Path()
            // Прямоугольник
            path.addRect(CGRect(origin: .zero, size: size))
            // Левая дырка
            path.addEllipse(in: CGRect(
                x: 0 - r2,
                y: size.height - r1,
                width: 2 * r2,
                height: 2 * r1
            ))
            // Правая дырка
            path.addEllipse(in: CGRect(
                x: size.width - r2,
                y: size.height - r1,
                width: 2 * r2,
                height: 2 * r1
            ))
            context.fill(path, with: .color(color), style: .init(eoFill: true, antialiased: false))
        }
        .frame(width: width, height: height)
    }
} 
