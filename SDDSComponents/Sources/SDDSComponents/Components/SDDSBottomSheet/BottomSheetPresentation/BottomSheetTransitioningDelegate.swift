import UIKit

final class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    var configuration = BottomSheetPresentationConfiguration()
    var onBottomSheetScrollChange: OnBottomSheetScrollChange?
    var onChangeDetent: OnChangeDetent?
    var onDismiss: (() -> Void)?
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let controller = BottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
        controller.dimmingAlphaWhenFull = configuration.dimmingAlphaWhenFull
        controller.dimmingAlphaWhenInitial = configuration.dimmingAlphaWhenInitial
        controller.dimmingAlpha = configuration.dimmingAlpha
        controller.isDimmingEnabled = configuration.isDimmingEnabled
        controller.setDetents(configuration.detents)
        controller.onBottomSheetScrollChange = onBottomSheetScrollChange
        controller.onDismiss = onDismiss
        controller.onChangeDetent = onChangeDetent
        return controller
    }
}
