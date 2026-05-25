import UIKit
import SwiftUI
import SDDSThemeCore

final class BottomSheetContainerViewController: UIViewController {
    private let hostingController: UIHostingController<AnyView>
    private let footerOverlayHostingController: UIHostingController<AnyView>
    private let handleView: BottomSheetHandleUIView
    private let cornerRadius: CGFloat
    private let appearance: BottomSheetAppearance
    
    private var handleBottomConstraint: NSLayoutConstraint?
    private var handleTopConstraint: NSLayoutConstraint?
    
    init<H: View, C: View, F: View>(
        content: SDDSBottomSheet<H, C, F>,
        cornerRadius: CGFloat,
        appearance: BottomSheetAppearance,
        subtheme: SubthemeData
    ) {
        // В основном hosting'е footer присутствует в layout-дереве
        // (для корректного fit-content sizing), но рендерится с opacity = 0.
        // Видимый footer рисует overlay-хост (см. ниже), который прибит
        // к нижней кромке контейнера через Auto Layout и плавно интерполируется
        // CA-анимацией при snap'е, в отличие от SwiftUI-layout pass'а,
        // который снэпает позицию внутреннего footer'а в финальное положение
        // (что и давало эффект «задвоения» во время анимации).
        let mainContent = content
            .environment(\.bottomSheetExternalFooter, true)
        self.hostingController = UIHostingController(rootView: AnyView(mainContent))
        self.cornerRadius = cornerRadius
        self.handleView = BottomSheetHandleUIView(appearance: appearance)
        self.appearance = appearance
        
        let overlayView = BottomSheetFooterOverlayView(
            footer: content.footer,
            appearance: appearance
        )
        .environment(\.subtheme, subtheme)
        self.footerOverlayHostingController = UIHostingController(rootView: AnyView(overlayView))
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        setupHostingController()
        setupFooterOverlay()
    }
    
    private func setupHostingController() {
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.layer.cornerRadius = cornerRadius
        hostingController.view.clipsToBounds = false
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.addSubview(handleView)
        
        handleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            handleView.widthAnchor.constraint(equalToConstant: appearance.size.handleWidth),
            handleView.heightAnchor.constraint(equalToConstant: appearance.size.handleHeight),
            handleView.centerXAnchor.constraint(equalTo: hostingController.view.centerXAnchor)
        ])
        
        let handleTotalOffset: CGFloat
        switch appearance.handlePlacement {
        case .outer, .auto:
            handleBottomConstraint = handleView.bottomAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: -appearance.size.handleOffset)
            NSLayoutConstraint.activate([handleBottomConstraint!])
            handleTotalOffset = appearance.size.handleOffset + appearance.size.handleHeight
        case .inner:
            handleTopConstraint = handleView.topAnchor.constraint(equalTo: hostingController.view.topAnchor, constant: appearance.size.handleOffset)
            NSLayoutConstraint.activate([handleTopConstraint!])
            handleTotalOffset = 0
        case .none:
            handleView.isHidden = true
            handleTotalOffset = 0
        }
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: handleTotalOffset),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupFooterOverlay() {
        let overlay = footerOverlayHostingController.view!
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = .clear
        
        addChild(footerOverlayHostingController)
        view.addSubview(overlay)
        footerOverlayHostingController.didMove(toParent: self)
        // Поднимаем поверх hostingController.view, чтобы при snap-анимации
        // невидимый (opacity=0) SwiftUI-footer под ним всё равно был перекрыт.
        view.bringSubviewToFront(overlay)
        
        NSLayoutConstraint.activate([
            overlay.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlay.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func updateHandlePosition(progress: CGFloat) {
        guard appearance.handlePlacement == .auto else { return }
        
        // В outer позиции handle находится над контентом
        let outerPosition = -appearance.size.handleOffset
        // В inner позиции handle находится внутри контента, но не выше safe area
        let safeAreaTop = view.safeAreaInsets.top
        let innerPosition = max(appearance.size.handleOffset + appearance.size.handleHeight, safeAreaTop)
        
        // Интерполируем между позициями
        let currentPosition = outerPosition + (innerPosition - outerPosition) * progress
        
        handleBottomConstraint?.constant = currentPosition
    }
}

/// Overlay-обёртка для footer'а: рендерится во втором UIHostingController,
/// который прибит к нижней кромке контейнера и едет плавно вместе с frame.size.height
/// благодаря CA-анимации Auto Layout (а не SwiftUI-layout pass'у внутри VStack).
private struct BottomSheetFooterOverlayView<Footer: View>: View {
    let footer: Footer
    let appearance: BottomSheetAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    var body: some View {
        footer
            .applyIf(appearance.size.paddingStart > 0) {
                $0.padding(.leading, appearance.size.paddingStart)
            }
            .applyIf(appearance.size.paddingEnd > 0) {
                $0.padding(.trailing, appearance.size.paddingEnd)
            }
            .applyIf(appearance.size.paddingBottom > 0) {
                $0.padding(.bottom, appearance.size.paddingBottom)
            }
            .frame(maxWidth: .infinity)
            .background(appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
    }
}
