import UIKit

class PassthroughView: UIView {
    weak var hostingView: UIView?

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha >= 0.01 else {
            return nil
        }

        if let hostingView = hostingView {
            let convertedPoint = convert(point, to: hostingView)
            
            if let hitView = hostingView.hitTest(convertedPoint, with: event) {
                return hostingView
            }
        }

        return nil
    }
}
