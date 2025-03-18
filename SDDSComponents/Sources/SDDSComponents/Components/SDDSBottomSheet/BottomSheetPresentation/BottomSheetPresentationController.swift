import UIKit

typealias OnBottomSheetScrollChange = (CGFloat) -> Void
typealias OnChangeDetent = (BottomSheetDetent?) -> ()

final class BottomSheetPresentationController: UIPresentationController {
    var onBottomSheetScrollChange: OnBottomSheetScrollChange?
    var onChangeDetent: OnChangeDetent?
    var onDismiss: (() -> Void)?
    
    // MARK: - Настройки затемнения
    var isDimmingEnabled: Bool = true
    var dimmingAlpha: CGFloat = 0.5
    var dimmingAlphaWhenFull: CGFloat = 1.0
    var dimmingAlphaWhenInitial: CGFloat = 0.0
    
    private var dimmingView: UIView?
    private var panGestureRecognizer: UIPanGestureRecognizer
    private var isDismissEnabled: Bool = true
    
    // MARK: - Настройки detents
    private var detents: [BottomSheetDetent] = []
    private var supportsFullScreen: Bool = false
    private var startsInFullScreen: Bool = false
        
    // MARK: - Текущее смещение контента
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
        dimmingView = PassThroughView()
        dimmingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        dimmingView?.alpha = dimmingAlphaWhenInitial
        
        if let passThroughView = dimmingView as? PassThroughView {
            passThroughView.onTap = { [weak self] in
                self?.presentedViewController.dismiss(animated: true) {
                    self?.onDismiss?()
                }
            }
        }
    }
    
    private func setupPanGesture() {
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        presentedViewController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func handleTapGesture() {
        onDismiss?()
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
        
        let safeAreaInsets = containerView.safeAreaInsets
        let translation = gesture.translation(in: presentedViewController.view)
        let velocity = gesture.velocity(in: presentedViewController.view)
        
        switch gesture.state {
        case .began:
            if initialHeight == 0 {
                initialHeight = presentedViewController.view.frame.height
            }
            currentHeight = presentedViewController.view.frame.height
            isDragging = true
            isFullScreen = currentHeight >= containerView.bounds.height - safeAreaInsets.top
            
        case .changed:            
            var newHeight: CGFloat = currentHeight
            var newY: CGFloat = 0
            if translation.y < 0 {
                // Скролл вниз из полного экрана
                if isFullScreen {
                    return
                }
                // Скролл вверх из частичного экрана
                if supportsFullScreen {
                    newHeight = min(containerView.bounds.height - safeAreaInsets.top, initialHeight - translation.y)
                } else {
                    newHeight = initialHeight
                }
                newY = containerView.bounds.height - newHeight
            } else if isFullScreen {
                // Скролл вниз из полного экрана
                newHeight = max(initialHeight, containerView.bounds.height - safeAreaInsets.top - translation.y)
                newY = containerView.bounds.height - newHeight
            } else {
                // Скролл вниз из частичного экрана
                let offset = max(presentedViewController.view.frame.height - translation.y, 0)
                newY = containerView.bounds.height - offset
            }
            
            currentHeight = newHeight
            presentedViewController.view.frame.size.height = newHeight
            presentedViewController.view.frame.origin.y = newY
            
            // Обновляем прозрачность затемнения
            if isDimmingEnabled {
                let progress = (newHeight - initialHeight) / (containerView.bounds.height - safeAreaInsets.top - initialHeight)
                let alpha = dimmingAlphaWhenInitial + (dimmingAlphaWhenFull - dimmingAlphaWhenInitial) * progress
                dimmingView?.alpha = alpha
            }
            
            // Обновляем прогресс скролла
            updateScrollProgress()
            
        case .ended:
            isDragging = false
            let velocityThreshold: CGFloat = 600
            let heightThreshold = containerView.bounds.height * 0.5
            
            let isQuickSwipeUp = velocity.y < -velocityThreshold
            let isQuickSwipeDown = velocity.y > velocityThreshold
            let isAboveHalfScreen = presentedViewController.view.frame.height > heightThreshold
            
            let snapToFull = (isQuickSwipeUp || isAboveHalfScreen) && supportsFullScreen
            
            if snapToFull && !isQuickSwipeDown {
                animateToFullState()
            } else if isFullScreen && isQuickSwipeDown {
                // Если мы в fullscreen и пользователь быстро смахнул вниз, возвращаемся в initialState
                animateToInitialState()
            } else if !isFullScreen && (isQuickSwipeDown || presentedViewController.view.frame.height < initialHeight * 0.5) {
                // Если мы в initial state и пользователь быстро смахнул вниз или потянул контент ниже половины initial height
                dismissIfEnabled()
            } else {
                // В остальных случаях возвращаемся в initialState
                animateToInitialState()
            }
            
        case .cancelled:
            isDragging = false
            animateToInitialState()
            
        default:
            break
        }
    }
    
    private func animateToInitialState() {
        guard let containerView = containerView else { return }
        isAnimating = true
        onChangeDetent?(.fitContent)
        UIView.animate(withDuration: 0.3) {
            self.presentedViewController.view.frame.origin.y = self.frameOfPresentedViewInContainerView.origin.y
            if self.isDimmingEnabled {
                self.dimmingView?.alpha = self.dimmingAlphaWhenInitial
            }
        } completion: { _ in
            self.presentedViewController.view.frame.size.height = self.frameOfPresentedViewInContainerView.height
            self.isAnimating = false
            self.isFullScreen = false
            self.currentHeight = self.initialHeight
            self.updateScrollProgress()
        }
    }
    
    private func animateToFullState() {
        guard let containerView = containerView else { return }
        isAnimating = true
        onChangeDetent?(.fullScreen)
        
        let safeAreaInsets = containerView.safeAreaInsets
        
        UIView.animate(withDuration: 0.3) {
            self.presentedViewController.view.frame.origin.y = safeAreaInsets.top
            self.presentedViewController.view.frame.size.height = containerView.bounds.height - safeAreaInsets.top
            if self.isDimmingEnabled {
                self.dimmingView?.alpha = self.dimmingAlphaWhenFull
            }
        } completion: { _ in
            self.isAnimating = false
            self.isFullScreen = true
            self.currentHeight = containerView.bounds.height - safeAreaInsets.top
            self.updateScrollProgress()
        }
    }
    
    private func dismissIfEnabled() {
        guard let containerView = containerView, isDismissEnabled else { return }
        onChangeDetent?(nil)
        
        // Получаем текущую скорость свайпа
        let velocity = panGestureRecognizer.velocity(in: presentedViewController.view)
        
        // Рассчитываем время анимации на основе скорости
        let distance = containerView.bounds.height - presentedViewController.view.frame.origin.y
        let velocityY = abs(velocity.y)
        let duration = min(0.2, distance / velocityY)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut) {
            self.presentedViewController.view.frame.origin.y = containerView.bounds.height
            if self.isDimmingEnabled {
                self.dimmingView?.alpha = self.dimmingAlphaWhenInitial
            }
        } completion: { [weak self] _ in
            guard let self = self else {
                return
            }
            self.presentedViewController.dismiss(animated: true) {
                self.onDismiss?()
            }
        }
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView, let dimmingView = dimmingView else { return }
        
        dimmingView.frame = containerView.bounds
        dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        containerView.insertSubview(dimmingView, at: 0)
        
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                if self.isDimmingEnabled {
                    dimmingView.alpha = self.dimmingAlphaWhenInitial
                }
            }, completion: nil)
        } else if isDimmingEnabled {
            dimmingView.alpha = dimmingAlphaWhenInitial
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
        presentedViewController.view.setNeedsLayout()
        presentedViewController.view.layoutIfNeeded()
        
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

private final class PassThroughView: UIView {
    var onTap: (() -> Void)?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let event = event, event.type == .touches {
            onTap?()
        }
        
        return nil
    }
}
