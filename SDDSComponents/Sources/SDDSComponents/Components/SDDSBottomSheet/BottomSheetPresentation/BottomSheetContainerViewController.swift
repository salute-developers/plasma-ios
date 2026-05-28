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
        // Основной hosting: внутри SwiftUI `VStack` footer прячется через
        // `.hidden()` (env-флаг `bottomSheetExternalFooter`). Это снимает
        // двойной рендер во время snap-анимаций: SwiftUI-footer не появляется
        // в кадре, пока overlay-копия едет к новой позиции через CA.
        // Layout-место footer'а в `VStack` сохраняется, поэтому
        // `systemLayoutSizeFitting` продолжает корректно считать
        // fit-content высоту листа.
        let mainView = content.environment(\.bottomSheetExternalFooter, true)
        self.hostingController = UIHostingController(rootView: AnyView(mainView))
        self.cornerRadius = cornerRadius
        self.handleView = BottomSheetHandleUIView(appearance: appearance)
        self.appearance = appearance
        
        // Overlay-копия footer'а: рендерится во втором UIHostingController,
        // прибитом к нижней кромке контейнера через Auto Layout. Её Y берётся
        // из CA-интерполяции bottomAnchor, а не из SwiftUI layout pass'а,
        // поэтому при `UIView.animate { ... layoutIfNeeded() }` footer едет
        // плавно от текущей позиции к новой нижней кромке.
        let overlayView = BottomSheetFooterOverlayView(
            footer: content.footer,
            appearance: appearance,
            cornerRadius: cornerRadius
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
        overlay.isUserInteractionEnabled = true
        
        addChild(footerOverlayHostingController)
        view.addSubview(overlay)
        footerOverlayHostingController.didMove(toParent: self)
        // Поднимаем поверх hostingController.view, чтобы SwiftUI-footer
        // под ним не был виден во время snap-анимации.
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
///
/// Bottom-corners клипаются тем же `cornerRadius`, что и основной лист, чтобы
/// overlay не «срезал» скруглённые нижние углы исходного `SDDSBottomSheet`
/// квадратным прямоугольником.
private struct BottomSheetFooterOverlayView<Footer: View>: View {
    let footer: Footer
    let appearance: BottomSheetAppearance
    let cornerRadius: CGFloat
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
            .applyIf(cornerRadius > 0) {
                $0.shape(pathDrawer: CornerRadiusDrawer(
                    cornerRadius: cornerRadius,
                    cornerType: .specific([.bottomLeft, .bottomRight])
                ))
            }
    }
}
