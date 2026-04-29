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

public enum SelectTriggerStyle {
    case textField(TextFieldData)
    case button(ButtonData)
}

public struct SDDSSelect<HeaderContent: View, FooterContent: View, LoaderContent: View, EmptyStateContent: View>: View {
    public let triggerStyle: SelectTriggerStyle
    public let text: String
    public let chips: [ChipData]
    public let disabled: Bool
    public let readOnly: Bool
    private let _appearance: SelectAppearance?
    @Binding public var isDropdownPresented: Bool
    public let options: [SelectOption]
    public let selectionMode: SelectSelectionMode?
    public let closeOnSingleSelection: Bool
    public let isLoading: Bool
    public let shouldShowEmptyState: Bool
    public let placement: PopoverPlacement
    public let triggerAlignment: PopoverAlignment
    public let placementMode: PopoverPlacementMode
    public let onOptionTap: ((Int) -> Void)?
    
    private let headerContent: () -> HeaderContent
    private let footerContent: () -> FooterContent
    private let loaderContent: () -> LoaderContent
    private let emptyStateContent: () -> EmptyStateContent
    
    @Environment(\.selectAppearance) private var environmentAppearance
    
    @State private var triggerWidth: CGFloat = 0
    @State private var triggerHeight: CGFloat = 0
    @State private var measuredTextFieldInputFrame: CGRect = .zero
    @State private var contentHeight: CGFloat = 0
    @State private var loaderHeight: CGFloat = 0
    @State private var dropdownScrollOffset: CGFloat = 0
    
    private let maxDropdownHeight: CGFloat = 400
    
    public init(
        triggerStyle: SelectTriggerStyle = .textField(TextFieldData()),
        text: String = "",
        chips: [ChipData] = [],
        disabled: Bool = false,
        readOnly: Bool = false,
        appearance: SelectAppearance? = nil,
        isDropdownPresented: Binding<Bool>,
        options: [SelectOption],
        selectionMode: SelectSelectionMode? = nil,
        closeOnSingleSelection: Bool = false,
        isLoading: Bool = false,
        shouldShowEmptyState: Bool = false,
        placement: PopoverPlacement = .bottom,
        triggerAlignment: PopoverAlignment = .start,
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
        self.disabled = disabled
        self.readOnly = readOnly
        self._appearance = appearance
        self._isDropdownPresented = isDropdownPresented
        self.options = options
        self.selectionMode = selectionMode
        self.closeOnSingleSelection = closeOnSingleSelection
        self.isLoading = isLoading
        self.shouldShowEmptyState = shouldShowEmptyState
        self.placement = placement
        self.triggerAlignment = triggerAlignment
        self.placementMode = placementMode
        self.onOptionTap = onOptionTap
        self.headerContent = headerContent
        self.footerContent = footerContent
        self.loaderContent = loaderContent
        self.emptyStateContent = emptyStateContent
    }
    
    public var body: some View {
        stableTrigger
            .id("selectTrigger")
            .dropdownMenu(
                isPresented: presentedBinding,
                appearance: dropdownAppearance,
                placement: placement,
                alignment: triggerAlignment,
                placementMode: placementMode,
                contentHeight: calculatedContentHeight,
                protectContentTaps: true,
                triggerFrameInsets: textFieldTriggerFrameInsets,
                placementCheckSize: placementCheckSize,
                fitCalculationMode: .overlayCentered,
                onTriggerTap: {
                    handleTriggerTap()
                },
                contentId: "\(options.count)-\(isLoading)-\(shouldShowEmptyState)-\(selectionContentId)"
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
            .onChange(of: isDropdownPresented) { isPresented in
                if !isPresented {
                    resetMeasuredDropdownState()
                }
            }
            .onChange(of: dropdownLayoutKey) { _ in
                resetMeasuredDropdownState()
            }
    }
    
    @ViewBuilder
    private var stableTrigger: some View {
        ZStack(alignment: .leading) {
            if case .textField(_) = triggerStyle, triggerWidth > 1, triggerHeight > 1 {
                Color.clear
                    .frame(width: triggerWidth, height: triggerHeight)
            }
            trigger
                .readSize { size in
                    // Measure only the real trigger, so placeholder can also shrink on size changes.
                    guard size.width > 1, size.height > 1 else { return }
                    if abs(triggerWidth - size.width) > 0.5 {
                        triggerWidth = size.width
                    }
                    if abs(triggerHeight - size.height) > 0.5 {
                        triggerHeight = size.height
                    }
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
        
        let baseHeight: CGFloat
        if options.isEmpty {
            baseHeight = measuredHeight
        } else if optionHeight > 0 {
            baseHeight = estimatedOptionsHeight + estimatedLoaderHeight
        } else {
            baseHeight = measuredHeight
        }
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

    /// Optional explicit size for loose-placement fit checks.
    /// Needed for Select because runtime clipping can under-report measured overlay size near screen edges.
    private var placementCheckSize: CGSize? {
        guard placementMode == .loose else { return nil }
        guard let width = resolvedDropdownWidth else { return nil }
        let height = calculatedContentHeight ?? resolvedListHeight
        guard let height, height > 0 else { return nil }
        return CGSize(width: width, height: height)
    }
    
    private var selectionContentId: String {
        options.map { $0.isSelected ? "1" : "0" }.joined()
    }
    
    private var textFieldTriggerRenderKey: String {
        let chipIDs = chips.map { $0.id.uuidString }.joined(separator: ",")
        return "\(resolvedSelectionMode)-\(text)-\(chipIDs)"
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
        var adjustedAppearance = resolvedTextFieldData.appearance ?? appearance.textFieldAppearance
        if isDropdownPresented && !readOnly && !disabled {
            adjustedAppearance.backgroundColorReadOnly = adjustedAppearance.backgroundColorFocused
            adjustedAppearance.lineColorReadOnly = adjustedAppearance.lineColorFocused
            adjustedAppearance.captionColorReadOnly = adjustedAppearance.captionColorFocused
            adjustedAppearance.placeholderColorReadOnly = adjustedAppearance.placeholderColorFocused
            adjustedAppearance.startContentColorReadOnly = adjustedAppearance.startContentColorFocused
            adjustedAppearance.endContentColorReadOnly = adjustedAppearance.endContentColorFocused
            adjustedAppearance.textColorReadOnly = adjustedAppearance.textColorFocused
        } else if !readOnly {
            adjustedAppearance.backgroundColorReadOnly = adjustedAppearance.backgroundColor
        }
        return adjustedAppearance
    }
    
    private var resolvedTextFieldData: TextFieldData {
        switch triggerStyle {
        case .textField(let data):
            return data
        case .button(_):
            return TextFieldData()
        }
    }
    
    private var resolvedButtonData: ButtonData {
        switch triggerStyle {
        case .button(let data):
            return data
        case .textField(_):
            return ButtonData(title: "", appearance: appearance.buttonAppearance, action: {})
        }
    }
    
    private var textFieldTriggerValue: TextFieldValue {
        switch resolvedSelectionMode {
        case .single:
            return .single(text)
        case .multiple:
            if chips.isEmpty {
                return .single(text)
            }
            return .multiple("", resolvedChips)
        }
    }
    
    private var resolvedChips: [ChipData] {
        let chipAppearance = appearance.textFieldAppearance.chipAppearance
        return chips.map { chip in
            ChipData(
                id: chip.id,
                title: chip.title,
                isEnabled: chip.isEnabled,
                iconImage: chip.iconImage,
                buttonImage: chip.buttonImage,
                appearance: chipAppearance,
                accessibility: chip.accessibility,
                removeAction: chip.removeAction
            )
        }
    }
    
    private var buttonTitle: String {
        switch resolvedSelectionMode {
        case .single:
            return text.isEmpty ? resolvedButtonData.title : text
        case .multiple:
            let titles = chips.map(\.title).joined(separator: ", ")
            return titles.isEmpty ? resolvedButtonData.title : titles
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
        case .textField(_):
            let textFieldData = resolvedTextFieldData
            SDDSTextField(
                value: .constant(textFieldTriggerValue),
                title: textFieldData.title,
                optionalTitle: textFieldData.optionalTitle,
                placeholder: textFieldData.placeholder,
                caption: textFieldData.caption,
                textBefore: textFieldData.textBefore,
                textAfter: textFieldData.textAfter,
                disabled: disabled,
                readOnly: true,
                required: textFieldData.required,
                divider: textFieldData.divider,
                mask: textFieldData.mask,
                maskDisplayMode: textFieldData.maskDisplayMode,
                secureEntry: textFieldData.secureEntry,
                keyboardType: textFieldData.keyboardType,
                appearance: textFieldTriggerAppearance,
                layout: textFieldData.layout,
                accessibility: textFieldData.accessibility,
                iconContent: Action {
                    if let iconContent = textFieldData.iconContent {
                        iconContent()
                    } else {
                        AnyView(EmptyView())
                    }
                },
                actionContent: Action {
                    textFieldData.actionContent?() ?? AnyView(EmptyView())
                },
                onMaskComplete: textFieldData.onMaskComplete,
                onInputFrameChange: { frame in
                    guard frame.width > 1, frame.height > 1 else { return }
                    // Avoid noisy updates that can trigger unnecessary popover relayouts.
                    if abs(measuredTextFieldInputFrame.minX - frame.minX) > 0.5 ||
                        abs(measuredTextFieldInputFrame.minY - frame.minY) > 0.5 ||
                        abs(measuredTextFieldInputFrame.width - frame.width) > 0.5 ||
                        abs(measuredTextFieldInputFrame.height - frame.height) > 0.5 {
                        measuredTextFieldInputFrame = frame
                    }
                }
            )
            .id(textFieldTriggerRenderKey)
            .contentShape(Rectangle())
            .highPriorityGesture(
                TapGesture().onEnded {
                    handleTextFieldTriggerTap()
                }
            )
            .frame(maxWidth: .infinity, alignment: .leading)
        case .button(_):
            let buttonData = resolvedButtonData
            SDDSButton(
                title: resolvedButtonTitle,
                subtitle: buttonData.subtitle,
                iconAttributes: buttonData.iconAttributes,
                isDisabled: buttonData.isDisabled || disabled || readOnly,
                isLoading: buttonData.isLoading,
                spinnerImage: buttonData.spinnerImage,
                buttonStyle: buttonData.buttonStyle,
                appearance: buttonData.appearance,
                layoutMode: buttonData.layoutMode,
                accessibility: buttonData.accessibility,
                isSelected: buttonData.isSelected
            ) {
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleDropdownIfAllowed()
                    }
                    .allowsHitTesting(!(buttonData.isDisabled || disabled || readOnly))
            }
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    private func toggleDropdownIfAllowed() {
        guard !disabled, !readOnly else { return }
        isDropdownPresented.toggle()
    }
    
    private func handleTextFieldTriggerTap() {
        guard !disabled, !readOnly else { return }
        isDropdownPresented.toggle()
    }
    
    private func handleTriggerTap() {
        switch triggerStyle {
        case .textField(_):
            handleTextFieldTriggerTap()
        case .button(_):
            toggleDropdownIfAllowed()
        }
    }
    
    private var dropdownAppearance: DropdownMenuAppearance {
        let selectAppearance = appearance
        var appearance = selectAppearance.dropdownAppearance
        var size = DefaultDropdownMenuSize()
        size.offset = 0
        size.shape = appearance.size.shape
        size.width = triggerWidth > 0 ? triggerWidth : appearance.size.width
        appearance.size = size
        
        return appearance
    }
    
    private var textFieldTriggerFrameInsets: EdgeInsets {
        guard case .textField(_) = triggerStyle else {
            return .init()
        }
        
        if measuredTextFieldInputFrame.width > 1, measuredTextFieldInputFrame.height > 1,
           triggerWidth > 1, triggerHeight > 1 {
            let top = max(measuredTextFieldInputFrame.minY, 0)
            let bottom = max(triggerHeight - measuredTextFieldInputFrame.maxY, 0)
            let leading = max(measuredTextFieldInputFrame.minX, 0)
            let trailing = max(triggerWidth - measuredTextFieldInputFrame.maxX, 0)
            return EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
        }
        
        let textFieldAppearance = resolvedTextFieldData.appearance ?? appearance.textFieldAppearance
        let textFieldData = resolvedTextFieldData
        let titleTypography = textFieldAppearance.titleTypography
            .typography(with: textFieldAppearance.size)
        let captionTypography = textFieldAppearance.captionTypography
            .typography(with: textFieldAppearance.size)
        
        let hasOuterTitle = textFieldAppearance.labelPlacement == .outer && !resolvedTextFieldData.title.isEmpty
        let hasCaption = !resolvedTextFieldData.caption.isEmpty
        
        let rawTopInset = hasOuterTitle
            ? textFieldAppearance.size.titleBottomPadding + (titleTypography?.lineHeight ?? 0)
            : 0
        let rawBottomInset = hasCaption
            ? textFieldAppearance.size.captionTopPadding + (captionTypography?.lineHeight ?? 0)
            : 0
        
        // Match SDDSTextField.fieldView vertical size:
        // fieldHeight (+ dividerHeight when clear layout and divider enabled).
        let fieldViewHeight = textFieldAppearance.size.fieldHeight
            + ((textFieldData.layout == .clear && textFieldData.divider) ? textFieldAppearance.size.dividerHeight : 0)
        
        let normalizedInsets = normalizedInputInsets(
            top: rawTopInset,
            bottom: rawBottomInset,
            fieldHeight: fieldViewHeight,
            measuredTotalHeight: triggerHeight,
            hasOuterTitle: hasOuterTitle,
            hasCaption: hasCaption
        )
        
        // Anchor popover to the input box area, not full textfield (title+caption).
        return EdgeInsets(top: normalizedInsets.top, leading: 0, bottom: normalizedInsets.bottom, trailing: 0)
    }
    
    private func normalizedInputInsets(
        top: CGFloat,
        bottom: CGFloat,
        fieldHeight: CGFloat,
        measuredTotalHeight: CGFloat,
        hasOuterTitle: Bool,
        hasCaption: Bool
    ) -> (top: CGFloat, bottom: CGFloat) {
        let measuredNonFieldHeight = max(measuredTotalHeight - fieldHeight, 0)
        let rawTotal = max(top + bottom, 0)
        
        if measuredNonFieldHeight > 0 {
            if hasOuterTitle && hasCaption {
                if rawTotal > 0 {
                    let scale = measuredNonFieldHeight / rawTotal
                    return (top * scale, bottom * scale)
                } else {
                    return (measuredNonFieldHeight / 2, measuredNonFieldHeight / 2)
                }
            } else if hasOuterTitle {
                return (measuredNonFieldHeight, 0)
            } else if hasCaption {
                return (0, measuredNonFieldHeight)
            }
        }
        
        return (top, bottom)
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
    
    private var dropdownLayoutKey: String {
        "\(triggerStyleKindKey)-\(resolvedSelectionMode)-\(appearance.selectItemAppearance.size.height)-\(isLoading)-\(shouldShowEmptyState)-\(options.count)"
    }
    
    private var triggerStyleKindKey: String {
        switch triggerStyle {
        case .textField(_):
            return "textField"
        case .button(_):
            return "button"
        }
    }
    
    private func resetMeasuredDropdownState() {
        contentHeight = 0
        loaderHeight = 0
        dropdownScrollOffset = 0
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

