import Foundation
import SwiftUI
import UIKit
import SDDSThemeCore

private struct SelectScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct SelectOption: Identifiable, Hashable {
    public let id: UUID
    public let label: String
    public let title: String
    public let subtitle: String
    public let isSelected: Bool
    public let isEnabled: Bool
    
    public init(
        id: UUID = UUID(),
        label: String = "",
        title: String,
        subtitle: String = "",
        isSelected: Bool = false,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.label = label
        self.title = title
        self.subtitle = subtitle
        self.isSelected = isSelected
        self.isEnabled = isEnabled
    }
}

public enum SelectTriggerStyle: Hashable {
    case textField
    case button
}

public struct SDDSSelect<HeaderContent: View, FooterContent: View, LoaderContent: View, EmptyStateContent: View>: View {
    public let triggerStyle: SelectTriggerStyle
    public let text: String
    public let chips: [ChipData]
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let textBefore: String
    public let textAfter: String
    public let disabled: Bool
    public let readOnly: Bool
    private let _appearance: SelectAppearance?
    @Binding public var isDropdownPresented: Bool
    public let options: [SelectOption]
    public let selectionMode: SelectSelectionMode?
    public let closeOnSingleSelection: Bool
    public let isLoading: Bool
    public let shouldShowEmptyState: Bool
    public let placementMode: PopoverPlacementMode
    public let onOptionTap: ((Int) -> Void)?
    
    private let headerContent: () -> HeaderContent
    private let footerContent: () -> FooterContent
    private let loaderContent: () -> LoaderContent
    private let emptyStateContent: () -> EmptyStateContent
    
    @Environment(\.selectAppearance) private var environmentAppearance
    
    @State private var triggerWidth: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    @State private var loaderHeight: CGFloat = 0
    @State private var dropdownScrollOffset: CGFloat = 0
    
    private let maxDropdownHeight: CGFloat = 400
    
    public init(
        triggerStyle: SelectTriggerStyle = .textField,
        text: String = "",
        chips: [ChipData] = [],
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        textBefore: String = "",
        textAfter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        appearance: SelectAppearance? = nil,
        isDropdownPresented: Binding<Bool>,
        options: [SelectOption],
        selectionMode: SelectSelectionMode? = nil,
        closeOnSingleSelection: Bool = false,
        isLoading: Bool = false,
        shouldShowEmptyState: Bool = false,
        placementMode: PopoverPlacementMode = .strict,
        onOptionTap: ((Int) -> Void)? = nil,
        @ViewBuilder headerContent: @escaping () -> HeaderContent = { EmptyView() },
        @ViewBuilder footerContent: @escaping () -> FooterContent = { EmptyView() },
        @ViewBuilder loaderContent: @escaping () -> LoaderContent = { EmptyView() },
        @ViewBuilder emptyStateContent: @escaping () -> EmptyStateContent = { EmptyView() }
    ) {
        self.triggerStyle = triggerStyle
        self.text = text
        self.chips = chips
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.disabled = disabled
        self.readOnly = readOnly
        self._appearance = appearance
        self._isDropdownPresented = isDropdownPresented
        self.options = options
        self.selectionMode = selectionMode
        self.closeOnSingleSelection = closeOnSingleSelection
        self.isLoading = isLoading
        self.shouldShowEmptyState = shouldShowEmptyState
        self.placementMode = placementMode
        self.onOptionTap = onOptionTap
        self.headerContent = headerContent
        self.footerContent = footerContent
        self.loaderContent = loaderContent
        self.emptyStateContent = emptyStateContent
    }
    
    public init(
        triggerStyle: SelectTriggerStyle = .textField,
        text: String = "",
        chips: [ChipData] = [],
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        textBefore: String = "",
        textAfter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        appearance: SelectAppearance? = nil,
        state: SDDSSelectState,
        options: [SelectOption],
        selectionMode: SelectSelectionMode? = nil,
        closeOnSingleSelection: Bool = false,
        isLoading: Bool = false,
        shouldShowEmptyState: Bool = false,
        placementMode: PopoverPlacementMode = .strict,
        onOptionTap: ((Int) -> Void)? = nil,
        @ViewBuilder headerContent: @escaping () -> HeaderContent = { EmptyView() },
        @ViewBuilder footerContent: @escaping () -> FooterContent = { EmptyView() },
        @ViewBuilder loaderContent: @escaping () -> LoaderContent = { EmptyView() },
        @ViewBuilder emptyStateContent: @escaping () -> EmptyStateContent = { EmptyView() }
    ) {
        self.init(
            triggerStyle: triggerStyle,
            text: text,
            chips: chips,
            title: title,
            optionalTitle: optionalTitle,
            placeholder: placeholder,
            caption: caption,
            textBefore: textBefore,
            textAfter: textAfter,
            disabled: disabled,
            readOnly: readOnly,
            appearance: appearance,
            isDropdownPresented: Binding(
                get: { state.isOpened },
                set: { state.isOpened = $0 }
            ),
            options: options,
            selectionMode: selectionMode,
            closeOnSingleSelection: closeOnSingleSelection,
            isLoading: isLoading,
            shouldShowEmptyState: shouldShowEmptyState,
            placementMode: placementMode,
            onOptionTap: onOptionTap,
            headerContent: headerContent,
            footerContent: footerContent,
            loaderContent: loaderContent,
            emptyStateContent: emptyStateContent
        )
    }
    
    public var body: some View {
        trigger
            .id("selectTrigger")
            .readSize { size in
                triggerWidth = size.width
            }
            .dropdownMenu(
                isPresented: presentedBinding,
                appearance: dropdownAppearance,
                placement: .bottom,
                alignment: .start,
                placementMode: placementMode,
                contentHeight: calculatedContentHeight,
                protectContentTaps: true,
                contentId: "\(options.count)-\(isLoading)-\(shouldShowEmptyState)-\(contentHeight)-\(selectionContentId)-\(text)-\(chips.count)"
            ) {
                dropdownContent
                    .frame(width: resolvedDropdownWidth, alignment: .leading)
            }
            .onChange(of: disabled) { isDisabled in
                if isDisabled {
                    isDropdownPresented = false
                }
            }
            .onChange(of: readOnly) { isReadOnly in
                if isReadOnly {
                    isDropdownPresented = false
                }
            }
    }
    
    private var appearance: SelectAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var calculatedContentHeight: CGFloat? {
        let optionHeight = appearance.selectItemAppearance.size.height
        let estimatedOptionsHeight = optionHeight > 0 ? CGFloat(options.count) * optionHeight : 0
        let estimatedLoaderHeight = isLoading ? loaderHeight : 0
        
        let measuredHeight = contentHeight + estimatedLoaderHeight
        
        let estimatedHeight: CGFloat
        if options.isEmpty {
            estimatedHeight = measuredHeight
        } else {
            estimatedHeight = estimatedOptionsHeight + estimatedLoaderHeight
        }
        
        let baseHeight = max(measuredHeight, estimatedHeight)
        if baseHeight <= 0 {
            return nil
        }
        return min(baseHeight, maxDropdownHeight)
    }
    
    private var resolvedListHeight: CGFloat? {
        if let calculatedContentHeight {
            return calculatedContentHeight
        }
        let optionHeight = appearance.selectItemAppearance.size.height
        guard optionHeight > 0, !options.isEmpty else { return nil }
        return min(CGFloat(options.count) * optionHeight, maxDropdownHeight)
    }
    
    private var resolvedDropdownWidth: CGFloat? {
        let width = triggerWidth > 0 ? triggerWidth : appearance.dropdownAppearance.size.width
        return width > 0 ? width : nil
    }
    
    private var selectionContentId: String {
        options.map { $0.isSelected ? "1" : "0" }.joined()
    }
    
    private var presentedBinding: Binding<Bool> {
        Binding(
            get: { isDropdownPresented && !disabled && !readOnly },
            set: { isDropdownPresented = $0 }
        )
    }
    
    private var resolvedSelectionMode: SelectSelectionMode {
        if let selectionMode {
            return selectionMode
        }
        return appearance.selectItemAppearance.itemType == .single ? .single : .multiple
    }
    
    private var textFieldTriggerAppearance: TextFieldAppearance {
        var adjustedAppearance = appearance.textFieldAppearance
        if !readOnly {
            adjustedAppearance.backgroundColorReadOnly = adjustedAppearance.backgroundColor
        }
        return adjustedAppearance
    }
    
    private var textFieldTriggerValue: TextFieldValue {
        switch resolvedSelectionMode {
        case .single:
            return .single(text)
        case .multiple:
            if chips.isEmpty {
                return .single(text)
            }
            return .multiple("", chips)
        }
    }
    
    private var buttonTitle: String {
        switch resolvedSelectionMode {
        case .single:
            return text.isEmpty ? placeholder : text
        case .multiple:
            let titles = chips.map(\.title).joined(separator: ", ")
            return titles.isEmpty ? placeholder : titles
        }
    }
    
    private var resolvedButtonTitle: String {
        let availableWidth = max(buttonContentAvailableWidth, 0)
        return truncated(buttonTitle, maxWidth: availableWidth)
    }
    
    private var buttonContentAvailableWidth: CGFloat {
        let widthBase = triggerWidth > 0 ? triggerWidth : appearance.dropdownAppearance.size.width
        let paddings = appearance.buttonAppearance.size.paddings
        return widthBase - paddings.leading - paddings.trailing
    }
    
    @ViewBuilder
    private var trigger: some View {
        switch triggerStyle {
        case .textField:
            SDDSTextField(
                value: .constant(textFieldTriggerValue),
                title: title,
                optionalTitle: optionalTitle,
                placeholder: placeholder,
                caption: caption,
                textBefore: textBefore,
                textAfter: textAfter,
                disabled: disabled,
                readOnly: true,
                appearance: textFieldTriggerAppearance
            )
            .id("\(resolvedSelectionMode)-\(text)-\(chips.map(\.id.uuidString).joined(separator: ","))")
            .contentShape(Rectangle())
            .highPriorityGesture(
                TapGesture().onEnded {
                    handleTextFieldTriggerTap()
                }
            )
            .frame(maxWidth: .infinity, alignment: .leading)
        case .button:
            SDDSButton(
                title: resolvedButtonTitle,
                subtitle: "",
                isDisabled: disabled || readOnly,
                appearance: appearance.buttonAppearance,
                layoutMode: .fixedWidth(.packed)
            ) {
                toggleDropdownIfAllowed()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func toggleDropdownIfAllowed() {
        guard !disabled, !readOnly else { return }
        isDropdownPresented.toggle()
    }
    
    private func handleTextFieldTriggerTap() {
        guard !disabled, !readOnly else { return }
        
        let wasPresented = isDropdownPresented
        isDropdownPresented.toggle()
        
        // Fallback: force open if toggle was swallowed by view hierarchy updates.
        if !wasPresented {
            DispatchQueue.main.async {
                if !isDropdownPresented {
                    isDropdownPresented = true
                }
            }
        }
    }
    
    private var dropdownAppearance: DropdownMenuAppearance {
        let selectAppearance = appearance
        var appearance = selectAppearance.dropdownAppearance
        var size = DefaultDropdownMenuSize()
        if triggerStyle == .textField {
            let captionTypography = selectAppearance.textFieldAppearance.captionTypography
                .typography(with: selectAppearance.textFieldAppearance.size)
            size.offset = -(selectAppearance.textFieldAppearance.size.captionTopPadding + (captionTypography?.lineHeight ?? 0))
        } else {
            size.offset = 0
        }
        size.shape = appearance.size.shape
        size.width = triggerWidth > 0 ? triggerWidth : appearance.size.width
        appearance.size = size
        
        return appearance
    }
    
    @ViewBuilder
    private var dropdownContent: some View {
        VStack(spacing: 0) {
            if !isHeaderEmpty {
                headerContent()
            }
            
            if options.isEmpty {
                if shouldShowEmptyState {
                    emptyStateContent()
                } else if isLoading {
                    loaderContent()
                } else {
                    EmptyView()
                }
            } else {
                Group {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(Array(options.enumerated()), id: \.element.id) { index, option in
                                SDDSSelectItem(
                                    label: option.label,
                                    title: option.title,
                                    subtitle: option.subtitle,
                                    isSelected: option.isSelected,
                                    isEnabled: option.isEnabled && !disabled && !readOnly,
                                    appearance: appearance.selectItemAppearance,
                                    onTap: nil
                                )

                            }
                            
                            if isLoading {
                                loaderContent()
                                    .readSize { size in
                                        loaderHeight = size.height
                                    }
                            }
                        }
                        .readSize { size in
                            contentHeight = size.height
                        }
                        .background(
                            GeometryReader { geometry in
                                Color.clear.preference(
                                    key: SelectScrollOffsetPreferenceKey.self,
                                    value: -geometry.frame(in: .named("select-scroll")).origin.y
                                )
                            }
                        )
                    }
                    .coordinateSpace(name: "select-scroll")
                    .onPreferenceChange(SelectScrollOffsetPreferenceKey.self) { offset in
                        dropdownScrollOffset = offset
                    }
                    .frame(height: resolvedListHeight, alignment: .topLeading)
                    .simultaneousGesture(
                        DragGesture(minimumDistance: 0)
                            .onEnded { value in
                                guard abs(value.translation.height) < 8, abs(value.translation.width) < 8 else { return }
                                let itemHeight = appearance.selectItemAppearance.size.height
                                guard itemHeight > 0 else { return }
                                
                                let adjustedY = value.location.y + dropdownScrollOffset
                                let index = Int(adjustedY / itemHeight)
                                guard index >= 0, index < options.count else { return }
                                guard options[index].isEnabled, !disabled, !readOnly else { return }
                                
                                handleOptionTap(index)
                            }
                    )
                }
                .id("SDDSSelectList-\(options.count)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: maxDropdownHeight)
            }
            
            if !isFooterEmpty {
                footerContent()
            }
        }
        .shape(pathDrawer: appearance.dropdownAppearance.size.shape)
        .clipped()
    }
    
    private var isHeaderEmpty: Bool {
        HeaderContent.self == EmptyView.self
    }
    
    private var isFooterEmpty: Bool {
        FooterContent.self == EmptyView.self
    }
    
    private func handleOptionTap(_ index: Int) {
        onOptionTap?(index)
        if closeOnSingleSelection && resolvedSelectionMode == .single && appearance.selectItemAppearance.itemType == .single {
            isDropdownPresented = false
        }
    }
    
    private func truncated(_ text: String, maxWidth: CGFloat) -> String {
        guard maxWidth > 0 else { return text }
        guard let typography = appearance.buttonAppearance.titleTypography.typography(with: appearance.buttonAppearance.size) else {
            return text
        }
        
        let font = typography.uiFont
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        let textWidth = (text as NSString).size(withAttributes: attributes).width
        if textWidth <= maxWidth {
            return text
        }
        
        let ellipsis = "..."
        let ellipsisWidth = (ellipsis as NSString).size(withAttributes: attributes).width
        let targetWidth = max(maxWidth - ellipsisWidth, 0)
        let characters = Array(text)
        
        var low = 0
        var high = characters.count
        while low < high {
            let mid = (low + high + 1) / 2
            let candidate = String(characters.prefix(mid))
            let candidateWidth = (candidate as NSString).size(withAttributes: attributes).width
            if candidateWidth <= targetWidth {
                low = mid
            } else {
                high = mid - 1
            }
        }
        
        return String(characters.prefix(low)) + ellipsis
    }
}

