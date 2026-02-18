import UIKit

class OverlayContainerView: UIView {
    weak var contentView: UIView?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha >= 0.01 else {
            return nil
        }
        
        guard bounds.contains(point) else {
            return nil
        }
        
        guard let contentView = contentView, contentView.superview == self else {
            return self
        }
        
        let convertedPoint = convert(point, to: contentView)
        
        if let hitView = contentView.hitTest(convertedPoint, with: event) {
            return hitView
        }
        
        for subview in contentView.subviews {
            let subviewPoint = contentView.convert(convertedPoint, to: subview)
            if let subviewHit = subview.hitTest(subviewPoint, with: event) {
                return subviewHit
            }
        }
        
        return self
    }
}

