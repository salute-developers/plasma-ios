import Foundation
import SwiftUI
import UIKit

public struct ScrollViewWrapper<Content: View>: UIViewRepresentable {
    @Binding var contentOffset: CGPoint
    @Binding var scrollViewHeight: CGFloat
    @Binding var visibleHeight: CGFloat
    @Binding var scrollEnded: Bool
    
    let content: () -> Content
    
    public init(
        contentOffset: Binding<CGPoint> = .constant(.zero),
        scrollViewHeight: Binding<CGFloat> = .constant(0),
        visibleHeight: Binding<CGFloat> = .constant(0),
        scrollEnded: Binding<Bool> = .constant(false),
        @ViewBuilder _ content: @escaping () -> Content) {
            self._contentOffset = contentOffset
            self._scrollViewHeight = scrollViewHeight
            self._visibleHeight = visibleHeight
            self._scrollEnded = scrollEnded
            self.content = content
        }
    
    public func makeUIView(context: UIViewRepresentableContext<ScrollViewWrapper>) -> UIScrollView {
        let view = UIScrollView()
        view.delegate = context.coordinator
        
        let controller = UIHostingController(rootView: content())
        controller.view.backgroundColor = .clear
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
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
        DispatchQueue.main.async {
            self.scrollViewHeight = uiView.contentSize.height
            self.visibleHeight = uiView.frame.size.height
            
            if let hostedView = uiView.subviews.first {
                hostedView.frame = CGRect(origin: .zero, size: uiView.contentSize)
            }
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    public class Coordinator: NSObject, UIScrollViewDelegate {
        let parent: ScrollViewWrapper
        var hideScrollbarTimer: Timer?
        
        init(_ parent: ScrollViewWrapper) {
            self.parent = parent
        }
        
        public func scrollViewDidScroll(_ scrollView: UIScrollView) {
            parent.contentOffset = scrollView.contentOffset
        }
        
        public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            parent.scrollEnded = false
        }
        
        public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate: Bool) {
            hideScrollbarTimer = Timer.scheduledTimer(
                withTimeInterval: 1,
                repeats: false
            ) { [weak self] _ in
                self?.parent.scrollEnded = true
            }
        }
    }
}
