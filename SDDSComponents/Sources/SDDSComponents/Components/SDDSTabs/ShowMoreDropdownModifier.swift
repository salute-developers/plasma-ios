import SwiftUI

struct ShowMoreDropdownModifier: ViewModifier {
    let isShowMoreItem: Bool
    @Binding var isPresented: Bool
    let clipMode: TabsClipMode
    let appearance: TabsAppearance
    let colorScheme: ColorScheme
    let dropdownContentHeight: CGFloat
    @State private var dropdownContentHeightState: CGFloat = 0
    
    func body(content: Content) -> some View {
        if isShowMoreItem,
           case .showMore(_, let dropdownItems, let maxHeight) = clipMode,
           let menuAppearance = appearance.dropdownMenuAppearance {
            let contentHeight = dropdownContentHeight > 0 ? min(dropdownContentHeight, maxHeight) : maxHeight
            content.dropdownMenu(
                isPresented: $isPresented,
                appearance: menuAppearance,
                placement: .bottom,
                alignment: .end,
                contentHeight: contentHeight,
                content: {
                    if let listAppearance = appearance.dropdownMenuAppearance?.listAppearance {
                        let finalHeight = dropdownContentHeight > 0 ? min(dropdownContentHeight, maxHeight) : maxHeight
                        SDDSList(
                            items: dropdownItems.map { item in
                                SDDSListItem(
                                    title: item.label ?? "",
                                    rightContentEnabled: false,
                                    disabled: item.isDisabled,
                                    appearance: listAppearance.listItemAppearance,
                                    onTap: {
                                        isPresented = false
                                    }
                                )
                            },
                            contentHeight: $dropdownContentHeightState,
                            showDividers: true,
                            maxHeight: maxHeight,
                            appearance: listAppearance
                        )
                        .frame(height: finalHeight)
                        .padding([.top, .bottom], appearance.dropdownMenuAppearance?.size.offset ?? 0)
                    }
                }
            )
        } else {
            content
        }
    }
}

