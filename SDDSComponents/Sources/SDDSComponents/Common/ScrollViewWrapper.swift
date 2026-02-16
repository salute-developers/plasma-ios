import Foundation
import SwiftUI
import UIKit

public struct ScrollViewWrapper<Content: View>: UIViewRepresentable {
    @Binding var contentOffset: CGPoint
    @Binding var scrollViewHeight: CGFloat
    @Binding var visibleHeight: CGFloat
    
    let content: () -> Content
    var scrollIndicatorInsetTop: CGFloat
    var contentInsetTop: CGFloat
    var backgroundColor: Color

    public init(
        contentOffset: Binding<CGPoint> = .constant(.zero),
        scrollViewHeight: Binding<CGFloat> = .constant(0),
        visibleHeight: Binding<CGFloat> = .constant(0),
        scrollIndicatorInsetTop: CGFloat = 0,
        contentInsetTop: CGFloat = 0,
        backgroundColor: Color = Color(uiColor: .systemBackground),
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self._contentOffset = contentOffset
        self._scrollViewHeight = scrollViewHeight
        self._visibleHeight = visibleHeight
        self.scrollIndicatorInsetTop = scrollIndicatorInsetTop
        self.contentInsetTop = contentInsetTop
        self.backgroundColor = backgroundColor
        self.content = content
    }

    public func makeUIView(context: UIViewRepresentableContext<ScrollViewWrapper>) -> UIScrollView {
        let view = UIScrollView()
        view.backgroundColor = UIColor(backgroundColor)
        view.contentInset = UIEdgeInsets(top: contentInsetTop, left: 0, bottom: 0, right: 0)
        view.scrollIndicatorInsets = UIEdgeInsets(top: scrollIndicatorInsetTop, left: 0, bottom: 0, right: 0)
        view.delegate = context.coordinator
        
        if contentInsetTop > 0 {
            view.contentOffset = CGPoint(x: 0, y: -contentInsetTop)
            context.coordinator.contentOffset.wrappedValue = CGPoint(x: 0, y: -contentInsetTop)
        }
        
        let controller = UIHostingController(rootView: AnyView(content()))
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        view.addSubview(controller.view)
        context.coordinator.hostingController = controller
        
        let heightConstraint = controller.view.heightAnchor.constraint(equalToConstant: 0)
        context.coordinator.contentHeightConstraint = heightConstraint
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            heightConstraint
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<ScrollViewWrapper>) {
        uiView.backgroundColor = UIColor(backgroundColor)
        uiView.contentInset = UIEdgeInsets(top: contentInsetTop, left: 0, bottom: 0, right: 0)
        uiView.contentOffset = self.contentOffset
        uiView.scrollIndicatorInsets = UIEdgeInsets(top: scrollIndicatorInsetTop, left: 0, bottom: 0, right: 0)
        context.coordinator.hostingController?.rootView = AnyView(content())
        
        DispatchQueue.main.async {
            self.visibleHeight = uiView.frame.size.height
            
            guard let hostedView = context.coordinator.hostingController?.view else { return }
            let width = uiView.bounds.width
            let fittingSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
            let measuredSize = hostedView.sizeThatFits(fittingSize)
            let contentHeight = max(measuredSize.height, uiView.frame.size.height)
            
            uiView.contentSize = CGSize(width: width, height: contentHeight)
            context.coordinator.contentHeightConstraint?.constant = contentHeight
            hostedView.setNeedsLayout()
            hostedView.layoutIfNeeded()
            
            self.scrollViewHeight = uiView.contentSize.height
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(contentOffset: self._contentOffset, scrollViewHeight: self._scrollViewHeight)
    }
    
    public class Coordinator: NSObject, UIScrollViewDelegate {
        let contentOffset: Binding<CGPoint>
        let scrollViewHeight: Binding<CGFloat>
        var hostingController: UIHostingController<AnyView>?
        var contentHeightConstraint: NSLayoutConstraint?
        
        init(contentOffset: Binding<CGPoint>, scrollViewHeight: Binding<CGFloat>) {
            self.contentOffset = contentOffset
            self.scrollViewHeight = scrollViewHeight
        }
        
        public func scrollViewDidScroll(_ scrollView: UIScrollView) {
            contentOffset.wrappedValue = scrollView.contentOffset
        }
    }
}
