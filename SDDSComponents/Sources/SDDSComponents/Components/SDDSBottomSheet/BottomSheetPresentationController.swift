import UIKit

typealias OnBottomSheetScrollChange = (CGFloat) -> Void

final class BottomSheetPresentationController: UIPresentationController {
    // Настройки затемнения
    var isDimmingEnabled: Bool = true
    var dimmingAlpha: CGFloat = 0.5
    var dimmingAlphaWhenFull: CGFloat = 1.0
    var dimmingAlphaWhenInitial: CGFloat = 0.0
    
    // Callback для отслеживания прогресса скролла
    var onBottomSheetScrollChange: OnBottomSheetScrollChange?
    
    private var dimmingView: UIView?
    private var panGestureRecognizer: UIPanGestureRecognizer
    private var isDismissEnabled: Bool = true
    
    // Настройки detents
    private var detents: [BottomSheetDetent] = []
    private var supportsFullScreen: Bool = false
    private var startsInFullScreen: Bool = false
        
    // Текущее смещение контента
    private var initialHeight: CGFloat = 0
    private var currentHeight: CGFloat = 0
    private var isDragging: Bool = false
    private var isAnimating: Bool = false
    private var isFullScreen: Bool = false
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        panGestureRecognizer = UIPanGestureRecognizer(target: nil, action: nil)
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
        setupPanGesture()
    }
    
    func setDetents(_ detents: [BottomSheetDetent]) {
        self.detents = detents
        self.supportsFullScreen = detents.contains(.fullScreen)
        self.startsInFullScreen = detents == [.fullScreen]
        
        if startsInFullScreen {
            isFullScreen = true
        }
    }
    
    private func setupDimmingView() {
        dimmingView = UIView()
        dimmingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView?.alpha = 0
    }
    
    private func setupPanGesture() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        presentedViewController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func setDimmingAlpha(_ alpha: CGFloat) {
        dimmingAlpha = alpha
        if isDimmingEnabled {
            dimmingView?.alpha = alpha
        }
    }
    
    func setDimmingAlphaWhenFull(_ alpha: CGFloat) {
        dimmingAlphaWhenFull = alpha
    }
    
    func setDimmingAlphaWhenInitial(_ alpha: CGFloat) {
        dimmingAlphaWhenInitial = alpha
    }
    
    private func updateScrollProgress() {
        guard let containerView = containerView else { return }
        
        let progress: CGFloat
        if supportsFullScreen {
            progress = (currentHeight - initialHeight) / (containerView.bounds.height - initialHeight)
        } else {
            progress = 0
        }
        
        onBottomSheetScrollChange?(max(0, min(1, progress)))
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let containerView = containerView else { return }
        
        let translation = gesture.translation(in: presentedViewController.view)
        let velocity = gesture.velocity(in: presentedViewController.view)
        
        switch gesture.state {
        case .began:
            if initialHeight == 0 {
                initialHeight = presentedViewController.view.frame.height
            }
            currentHeight = presentedViewController.view.frame.height
            isDragging = true
            isFullScreen = currentHeight >= containerView.bounds.height
            
        case .changed:
            let newHeight: CGFloat
            if translation.y < 0 {
                // Скролл вверх
                if supportsFullScreen {
                    newHeight = min(containerView.bounds.height, initialHeight - translation.y)
                } else {
                    newHeight = initialHeight
                }
            } else if isFullScreen {
                // Скролл вниз из полного экрана
                newHeight = max(initialHeight, containerView.bounds.height - translation.y)
            } else {
                // Скролл вниз из частичного экрана
                newHeight = max(initialHeight, presentedViewController.view.frame.height - translation.y)
            }
            
            currentHeight = newHeight
            presentedViewController.view.frame.size.height = newHeight
            presentedViewController.view.frame.origin.y = containerView.bounds.height - newHeight
            
            // Обновляем прозрачность затемнения
            if isDimmingEnabled {
                let progress = (newHeight - initialHeight) / (containerView.bounds.height - initialHeight)
                let alpha = dimmingAlphaWhenInitial + (dimmingAlphaWhenFull - dimmingAlphaWhenInitial) * progress
                dimmingView?.alpha = alpha
            }
            
            // Обновляем прогресс скролла
            updateScrollProgress()
            
        case .ended:
            isDragging = false
            let snapToFull = velocity.y < 0 && supportsFullScreen // Двигаемся вверх
            let snapToInitial = velocity.y >= 0 && presentedViewController.view.frame.height > containerView.bounds.height * 0.75
            let snapToDismiss = velocity.y >= 0 && presentedViewController.view.frame.height <= containerView.bounds.height * 0.5
            
            if snapToFull {
                animateToFullState()
            } else if snapToInitial {
                animateToInitialState()
            } else if snapToDismiss && isDismissEnabled {
                if isFullScreen {
                    animateToInitialState()
                } else {
                    dismissIfEnabled()
                }
            }
            
        case .cancelled:
            isDragging = false
            
        default:
            break
        }
    }
    
    private func animateToInitialState() {
        guard let containerView = containerView else { return }
        isAnimating = true
        UIView.animate(withDuration: 0.3) {
            self.presentedViewController.view.frame.size.height = self.initialHeight
            self.presentedViewController.view.frame.origin.y = containerView.bounds.height - self.initialHeight
            if self.isDimmingEnabled {
                self.dimmingView?.alpha = self.dimmingAlphaWhenInitial
            }
        } completion: { _ in
            self.isAnimating = false
            self.isFullScreen = false
            self.currentHeight = self.initialHeight
            self.updateScrollProgress()
        }
    }
    
    private func animateToFullState() {
        guard let containerView = containerView else { return }
        isAnimating = true
        UIView.animate(withDuration: 0.3) {
            self.presentedViewController.view.frame.size.height = containerView.bounds.height
            self.presentedViewController.view.frame.origin.y = 0
            if self.isDimmingEnabled {
                self.dimmingView?.alpha = self.dimmingAlphaWhenFull
            }
        } completion: { _ in
            self.isAnimating = false
            self.isFullScreen = true
            self.currentHeight = containerView.bounds.height
            self.updateScrollProgress()
        }
    }
    
    private func dismissIfEnabled() {
        if isDismissEnabled {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        dimmingView?.frame = containerView.bounds
        containerView.insertSubview(dimmingView!, at: 0)
        
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                if self.isDimmingEnabled {
                    self.dimmingView?.alpha = self.dimmingAlpha
                }
            }, completion: nil)
        } else if isDimmingEnabled {
            dimmingView?.alpha = dimmingAlpha
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView?.alpha = self.dimmingAlphaWhenInitial
            }, completion: nil)
        } else {
            dimmingView?.alpha = dimmingAlphaWhenInitial
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        if !isDragging && !isAnimating {
            presentedViewController.view.frame = frameOfPresentedViewInContainerView
        }
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        let contentSize = presentedViewController.view.systemLayoutSizeFitting(
            CGSize(width: parentSize.width, height: UIView.layoutFittingExpandedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        
        return CGSize(width: parentSize.width, height: min(contentSize.height, parentSize.height))
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        let size = self.size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView.bounds.size)
        return CGRect(x: 0, y: containerView.bounds.height - size.height, width: size.width, height: size.height)
    }
}
