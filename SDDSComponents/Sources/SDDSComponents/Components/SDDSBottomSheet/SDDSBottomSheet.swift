import SwiftUI
import Foundation
import SDDSThemeCore

extension SDDSBottomSheet: Equatable {
    static public func == (lhs: SDDSBottomSheet<Header, Content, Footer>, rhs: SDDSBottomSheet<Header, Content, Footer>) -> Bool {
        return false
    }
}

/**
 `SDDSBottomSheet` представляет собой модальное окно, которое появляется снизу экрана и может быть настроено с различными параметрами отображения.

 - Parameters:
    - appearance: Параметры внешнего вида bottom sheet
    - header: Заголовок bottom sheet
    - content: Основной контент bottom sheet
    - footer: Нижняя часть bottom sheet

 ## Окружение
 
 - `bottomSheetAppearance`: Стандартные настройки внешнего вида bottom sheet

 ## Примеры использования

 ```swift
 // Базовый bottom sheet с заголовком и контентом
 @State private var isBottomSheetPresented: Bool = false
 @State private var detent: BottomSheetDetent = .fitContent
 
MyView()
 .bottomSheet(isPresented: $isBottomSheetPresented, detent: $detent) {
     SDDSBottomSheet(
         appearance: viewModel.appearance,
         header: {
            Text("User Profile")
                .padding(.bottom, 2)
         },
         content: {
            VStack(alignment: .leading) {
            Text("Settings")
            Text("Manage your account")
                .foregroundColor(.gray)
            }
         },
         footer: {
            VStack {
                Text("Confirm Action")
                Text("This cannot be undone")
                    .foregroundColor(.red)
            }
         }
     )
 }
 ```
 */
public struct SDDSBottomSheet<Header: View, Content: View, Footer: View>: View {
    @Environment(\.bottomSheetAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: BottomSheetAppearance?
    
    public let header: Header
    public let content: Content
    public let footer: Footer
    
    public init(
        appearance: BottomSheetAppearance? = nil,
        @ViewBuilder header: () -> Header = { EmptyView() },
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer = { EmptyView() }
    ) {
        self._appearance = appearance
        self.header = header()
        self.content = content()
        self.footer = footer()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            header
            content
            Spacer()
            footer
        }
        .applyIf(appearance.size.paddingTop > 0) {
            $0.padding(.top, appearance.size.paddingTop)
        }
        .applyIf(appearance.size.paddingBottom > 0) {
            $0.padding(.bottom, appearance.size.paddingBottom)
        }
        .applyIf(appearance.size.paddingStart > 0) {
            $0.padding(.leading, appearance.size.paddingStart)
        }
        .applyIf(appearance.size.paddingEnd > 0) {
            $0.padding(.trailing, appearance.size.paddingEnd)
        }
        .frame(maxWidth: .infinity)
        .background(appearance.backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: appearance.size.pathDrawer)
        .frame(maxHeight: .infinity, alignment: .top)
    }
        
    var appearance: BottomSheetAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var shouldShowHandle: Bool {
        appearance.handlePlacement != .none
    }
    
    private var handlePlacement: BottomSheetHandlePlacement {
        switch appearance.handlePlacement {
        case .auto:
            return .outer
        case .inner, .outer, .none:
            return appearance.handlePlacement
        }
    }
    
    private var showHandleOutside: Bool {
        handlePlacement == .outer || handlePlacement == .auto
    }
    
    private var contentOffset: CGFloat {
        shouldShowHandle && handlePlacement == .outer ? appearance.size.handleOffset + appearance.size.handleHeight : 0
    }
}

#Preview {
    SDDSBottomSheet(
        appearance: .init(
            size: DefaultBottomSheetSize(),
            backgroundColor: Color.white.token,
            handleColor: Color.accentColor.token,
            handlePlacement: .auto
        ),
        header: {
            Text("Header")
        },
        content: {
            Text("Content")
        },
        footer: {
            Text("Footer")
        }
    )
}
