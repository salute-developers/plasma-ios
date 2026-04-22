import SwiftUI
import UIKit

final class HostingCarouselCell: UICollectionViewCell {
    static let reuseIdentifier = "HostingCarouselCell"

    private var hostController: UIHostingController<AnyView>?

    func apply(rootView: AnyView, parentViewController: UIViewController?) {
        if let hostController {
            hostController.rootView = rootView
            hostController.view.frame = contentView.bounds
            return
        }

        let host = UIHostingController(rootView: rootView)
        host.view.backgroundColor = .clear
        host.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(host.view)
        NSLayoutConstraint.activate([
            host.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            host.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

        if let parentViewController {
            parentViewController.addChild(host)
            host.didMove(toParent: parentViewController)
        }

        hostController = host
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        sequence(first: self.next, next: { $0?.next })
            .first { $0 is UIViewController } as? UIViewController
    }
}
