import Foundation

protocol PopoverSizeCalculator {
    func offset(placement: PopoverPlacement) -> CGSize
    var position: CGPoint { get }
    var frame: CGRect { get }
}

final class PopoverSizeCalculatorImpl: PopoverSizeCalculator {
    let frame: CGRect
    
    init(frame: CGRect) {
        self.frame = frame
    }
    
    var position: CGPoint {
        return frame.origin
    }
    
    func offset(placement: PopoverPlacement) -> CGSize {
        switch placement {
        case .end:
            return CGSize(width: frame.size.width, height: frame.size.height / 2)
        case .start:
            return CGSize(width: 0, height: frame.size.height / 2)
        case .top:
            return CGSize(width: frame.size.width / 2, height: 0)
        case .bottom:
            return CGSize(width: frame.size.width / 2, height: frame.size.height)
        }
    }
}
