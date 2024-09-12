import Foundation
import SwiftUI

// swiftlint:disable identifier_name
extension View {
    func padding(_ edges: Edge.Set = .all, _ length: CGFloat? = nil, debug: Bool) -> some View {
        self.padding(edges, length)
            .applyIf(debug, transform: { $0.debug() })
    }

    func padding(_ length: CGFloat? = nil, debug: Bool) -> some View {
        Group {
            if let length = length {
                self.padding(length)
            }
        }
        .applyIf(debug, transform: { $0.debug() })
    }

    func padding(_ insets: EdgeInsets, debug: Bool) -> some View {
        self.padding(insets)
            .applyIf(debug, transform: { $0.debug() })
    }
}

extension View {
    func offset(x: CGFloat = 0, y: CGFloat = 0, debug: Bool) -> some View {
        self.offset(x: x, y: y)
            .applyIf(debug, transform: { $0.debug() })
    }

    func offset(_ size: CGSize, debug: Bool) -> some View {
        self.offset(size)
            .applyIf(debug, transform: { $0.debug() })
    }
}

extension View {
    func frame(width: CGFloat? = nil, height: CGFloat? = nil, alignment: SwiftUI.Alignment = .center, debug: Bool) -> some View {
        self.frame(width: width, height: height, alignment: alignment)
            .applyIf(debug, transform: { $0.debug() })
    }

    func frame(minWidth: CGFloat? = nil, idealWidth: CGFloat? = nil, maxWidth: CGFloat? = nil,
               minHeight: CGFloat? = nil, idealHeight: CGFloat? = nil, maxHeight: CGFloat? = nil,
               alignment: SwiftUI.Alignment = .center, debug: Bool) -> some View {
        self.frame(minWidth: minWidth, idealWidth: idealWidth, maxWidth: maxWidth,
                   minHeight: minHeight, idealHeight: idealHeight, maxHeight: maxHeight,
                   alignment: alignment)
            .applyIf(debug, transform: { $0.debug() })
    }
}
// swiftlint:enable identifier_name
