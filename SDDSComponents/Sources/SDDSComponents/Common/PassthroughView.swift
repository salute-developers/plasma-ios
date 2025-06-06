import UIKit

class PassthroughView: UIView {
    weak var hostingView: UIView?

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha >= 0.01 else {
            return nil
        }

        if let hostingView = hostingView {
            let convertedPoint = convert(point, to: hostingView)
            for subview in hostingView.subviews {
                let subviewPoint = hostingView.convert(convertedPoint, to: subview)
                if let hitView = subview.hitTest(subviewPoint, with: event) {
                    return hostingView
                }
            }
        }

        return nil
    }
}
