import Foundation
import SwiftUI
import UIKit

public struct ScrollViewWrapper<Content: View>: UIViewRepresentable {
    @Binding var contentOffset: CGPoint
    @Binding var scrollViewHeight: CGFloat
    @Binding var visibleHeight: CGFloat
    
    let content: () -> Content
    
    public init(
        contentOffset: Binding<CGPoint> = .constant(.zero),
        scrollViewHeight: Binding<CGFloat> = .constant(0),
        visibleHeight: Binding<CGFloat> = .constant(0),
        @ViewBuilder _ content: @escaping () -> Content) {
            self._contentOffset = contentOffset
            self._scrollViewHeight = scrollViewHeight
            self._visibleHeight = visibleHeight
            self.content = content
        }
    
    public func makeUIView(context: UIViewRepresentableContext<ScrollViewWrapper>) -> UIScrollView {
        let view = UIScrollView()
        view.delegate = context.coordinator
        
        let controller = UIHostingController(rootView: content())
        controller.view.backgroundColor = .clear
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: view.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    public func updateUIView(_ uiView: UIScrollView, context: UIViewRepresentableContext<ScrollViewWrapper>) {
        uiView.contentOffset = self.contentOffset
        
//        uiView.setNeedsLayout()
//        uiView.layoutIfNeeded()
        
        DispatchQueue.main.async {
            self.scrollViewHeight = uiView.contentSize.height
            self.visibleHeight = uiView.frame.size.height
            
            if let hostedView = uiView.subviews.first {
                print("hostedView height: \(hostedView.frame.size.height)")
                print("hostedView width: \(hostedView.frame.size.width)")
            }
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(contentOffset: self._contentOffset, scrollViewHeight: self._scrollViewHeight)
    }
    
    public class Coordinator: NSObject, UIScrollViewDelegate {
        let contentOffset: Binding<CGPoint>
        let scrollViewHeight: Binding<CGFloat>
        
        init(contentOffset: Binding<CGPoint>, scrollViewHeight: Binding<CGFloat>) {
            self.contentOffset = contentOffset
            self.scrollViewHeight = scrollViewHeight
        }
        
        public func scrollViewDidScroll(_ scrollView: UIScrollView) {
            contentOffset.wrappedValue = scrollView.contentOffset
        }
    }
}
