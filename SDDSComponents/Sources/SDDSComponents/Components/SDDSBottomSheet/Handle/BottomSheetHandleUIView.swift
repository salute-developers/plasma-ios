import UIKit
import SwiftUI

final class BottomSheetHandleUIView: UIView {
    
    private let hostingController: UIHostingController<BottomSheetHandleView>
    
    public init(appearance: BottomSheetAppearance) {
        hostingController = UIHostingController(rootView: BottomSheetHandleView(appearance: appearance))
        super.init(frame: .zero)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    private func setup() {
        backgroundColor = .clear
        
        let childView = hostingController.view
        childView?.translatesAutoresizingMaskIntoConstraints = false
        childView?.backgroundColor = .clear
        if let childView {
            addSubview(childView)
            
            NSLayoutConstraint.activate([
                childView.topAnchor.constraint(equalTo: topAnchor),
                childView.leadingAnchor.constraint(equalTo: leadingAnchor),
                childView.bottomAnchor.constraint(equalTo: bottomAnchor),
                childView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
    }
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return hostingController.sizeThatFits(in: size)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        hostingController.view.frame = bounds
    }
}
