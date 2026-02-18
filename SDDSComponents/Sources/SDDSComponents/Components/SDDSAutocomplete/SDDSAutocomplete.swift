import SwiftUI
import SDDSThemeCore

// MARK: - SDDSAutocomplete

/**
 `SDDSAutocomplete` представляет собой компонент автодополнения, который является оберткой над `SDDSTextField` с поддержкой выпадающего меню.
 
 Компонент объединяет функциональность текстового поля и выпадающего меню для предоставления пользователю вариантов автодополнения.
 
 - Parameters:
    - value: Значение текстового поля (`single` или `multiple`). ``TextFieldValue``
    - title: Заголовок поля автодополнения.
    - optionalTitle: Дополнительный заголовок (например, для опциональных полей).
    - placeholder: Текст placeholder, отображаемый при пустом поле.
    - caption: Подпись под полем автодополнения.
    - textBefore: Префикс перед текстом или плейсхолдером.
    - textAfter: Суффикс после текста или плейсхолдером.
    - disabled: Флаг, указывающий, отключено ли поле.
    - readOnly: Флаг, указывающий, включено ли поле только на режим чтения.
    - required: Флаг, указывающий, является ли поле обязательным.
    - divider: Флаг, указывающий, показывать ли линию разделителя.
    - appearance: Параметры внешнего вида компонента автодополнения.
    - layout: Макет текстового поля (`default`, `clear`). ``TextFieldLayout``
    - accessibility: Параметры доступности.
    - iconContent: Левая иконка.
    - actionContent: Правая иконка действия.
    - isDropdownPresented: Binding для управления видимостью выпадающего меню.
    - items: Массив элементов списка для отображения в выпадающем меню.
    - isLoading: Флаг, указывающий, идет ли загрузка данных.
    - loaderContent: ViewBuilder для создания лоадера (для начальной загрузки и пагинации).
    - emptyStateContent: ViewBuilder для создания контента пустого состояния (когда нет элементов и не идет загрузка).
 
 ## Окружение
 
 - `autocompleteAppearance`: Стандартные настройки внешнего вида компонента автодополнения
 
 ## Пример использования
 
 ```swift
 @State private var value = TextFieldValue.single("")
 @State private var isDropdownPresented = false
 @State private var items: [SDDSListItem<EmptyView>] = [
     SDDSListItem(title: "Option 1"),
     SDDSListItem(title: "Option 2")
 ]
 @State private var isLoading = false
 
 SDDSAutocomplete(
     value: $value,
     title: "Search",
     placeholder: "Enter search query",
     appearance: AutocompleteNormal.m.appearance,
     isDropdownPresented: $isDropdownPresented,
     items: items,
     isLoading: isLoading
 ) {
     SDDSSpinner(appearance: SpinnerAppearance.defaultValue)
 } emptyState: {
     Text("No results found")
 }
 ```
 */
public struct SDDSAutocomplete<IconContent: View, ActionContent: View, RightContent: View, LoaderContent: View, EmptyStateContent: View>: View {
    @Binding public var value: TextFieldValue
    public let title: String
    public let optionalTitle: String
    public let placeholder: String
    public let caption: String
    public let textBefore: String
    public let textAfter: String
    public let disabled: Bool
    public let readOnly: Bool
    public let divider: Bool
    public let mask: TextFieldMask?
    public let maskDisplayMode: MaskDisplayMode
    private let _appearance: AutocompleteAppearance?
    public let layout: TextFieldLayout
    public let accessibility: TextFieldAccessibility
    
    let iconContent: Action<IconContent>
    let actionContent: Action<ActionContent>
    let onMaskComplete: ((Bool) -> Void)?
    
    @Binding public var isDropdownPresented: Bool
    public let items: [SDDSListItem<RightContent>]
    public let isLoading: Bool
    public let shouldShowEmptyState: Bool
    public let placementMode: PopoverPlacementMode
    let onItemSelected: ((Int) -> Void)?
    let loaderContent: () -> LoaderContent
    let emptyStateContent: () -> EmptyStateContent
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.autocompleteAppearance) private var environmentAppearance
    
    @State private var contentHeight: CGFloat = 0
    @State private var textFieldWidth: CGFloat = 0
    private let maxDropdownHeight: CGFloat = 400
    
    private var calculatedContentHeight: CGFloat {
        min(contentHeight + (isLoading ? 50 : 0), maxDropdownHeight)
    }
    
    public init(
        value: Binding<TextFieldValue>,
        title: String = "",
        optionalTitle: String = "",
        placeholder: String = "",
        caption: String = "",
        textBefore: String = "",
        textAfter: String = "",
        disabled: Bool = false,
        readOnly: Bool = false,
        required: Bool = false,
        divider: Bool = true,
        mask: TextFieldMask? = nil,
        maskDisplayMode: MaskDisplayMode = .onInput,
        appearance: AutocompleteAppearance? = nil,
        layout: TextFieldLayout = .default,
        accessibility: TextFieldAccessibility = TextFieldAccessibility(),
        iconContent: Action<IconContent> = Action { EmptyView() },
        actionContent: Action<ActionContent> = Action { EmptyView() },
        onMaskComplete: ((Bool) -> Void)? = nil,
        isDropdownPresented: Binding<Bool>,
        items: [SDDSListItem<RightContent>] = [],
        isLoading: Bool = false,
        shouldShowEmptyState: Bool = false,
        placementMode: PopoverPlacementMode = .strict,
        onItemSelected: ((Int) -> Void)? = nil,
        @ViewBuilder loaderContent: @escaping () -> LoaderContent = { EmptyView() },
        @ViewBuilder emptyStateContent: @escaping () -> EmptyStateContent = { EmptyView() }
    ) {
        _value = value
        self.caption = caption
        self.textBefore = textBefore
        self.textAfter = textAfter
        self.disabled = disabled
        self.readOnly = readOnly
        self.divider = divider
        self.mask = mask
        self.maskDisplayMode = maskDisplayMode
        self.title = title
        self.optionalTitle = optionalTitle
        self.placeholder = placeholder.isEmpty && mask != nil ? mask!.placeholder : placeholder
        self._appearance = appearance
        self.layout = layout
        self.accessibility = accessibility
        self.iconContent = iconContent
        self.actionContent = actionContent
        self.onMaskComplete = onMaskComplete
        _isDropdownPresented = isDropdownPresented
        self.items = items
        self.isLoading = isLoading
        self.shouldShowEmptyState = shouldShowEmptyState
        self.placementMode = placementMode
        self.onItemSelected = onItemSelected
        self.loaderContent = loaderContent
        self.emptyStateContent = emptyStateContent
    }
    
    public var body: some View {
        SDDSTextField(
            value: $value,
            title: title,
            optionalTitle: optionalTitle,
            placeholder: placeholder,
            caption: caption,
            textBefore: textBefore,
            textAfter: textAfter,
            disabled: disabled,
            readOnly: readOnly,
            required: false,
            divider: divider,
            mask: mask,
            maskDisplayMode: maskDisplayMode,
            appearance: appearance.textFieldAppearance,
            layout: layout,
            accessibility: accessibility,
            iconContent: iconContent,
            actionContent: actionContent,
            onMaskComplete: onMaskComplete
        )
        .id("textField")
        .readSize(onChange: { size in
            textFieldWidth = size.width
        })
        .dropdownMenu(
            isPresented: $isDropdownPresented,
            appearance: dropdownAppearance,
            placement: .bottom,
            alignment: .start,
            placementMode: placementMode,
            contentHeight: calculatedContentHeight,
            contentId: "\(items.count)-\(shouldShowEmptyState)-\(isLoading)-\(contentHeight)"
        ) {
            HStack(alignment: .top, spacing: 0) {
                dropdownContent
                    .frame(width: textFieldWidth > 0 ? textFieldWidth : nil, alignment: .leading)
                Spacer(minLength: 0)
            }
        }
    }
    
    var appearance: AutocompleteAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var dropdownAppearance: DropdownMenuAppearance {
        var appearance = appearance.dropdownAppearance
        var size = DefaultDropdownMenuSize()
        size.offset = -18
        size.shape = appearance.size.shape
        size.width = textFieldWidth > 0 ? textFieldWidth : appearance.size.width
        appearance.size = size
        
        return appearance
    }
    
    @ViewBuilder
    private var dropdownContent: some View {
        if items.isEmpty && shouldShowEmptyState {
            emptyStateContent()
                .frame(height: 91)
        } else if items.isEmpty {
            EmptyView()
        } else {
            let handleItemTap: ((Int) -> Void)? = {
                guard let onItemSelected = onItemSelected else { return nil }
                return { index in
                    onItemSelected(index)
                    isDropdownPresented = false
                }
            }()
            
            Group {
                if isLoading {
                    SDDSList(
                        items: items,
                        contentHeight: $contentHeight,
                        maxHeight: maxDropdownHeight,
                        appearance: appearance.dropdownAppearance.listAppearance,
                        lastItem: {
                            loaderContent()
                                .frame(maxWidth: .infinity, alignment: .center)
                        },
                        onItemTap: handleItemTap
                    )
                } else {
                    SDDSList(
                        items: items,
                        contentHeight: $contentHeight,
                        maxHeight: maxDropdownHeight,
                        appearance: appearance.dropdownAppearance.listAppearance,
                        onItemTap: handleItemTap
                    )
                }
            }
            .id("SDDSList-\(items.count)")
            .frame(height: calculatedContentHeight, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .bottom], appearance.dropdownAppearance.size.offset)
            .shape(pathDrawer: appearance.dropdownAppearance.size.shape)
            .clipped()
        }
    }
}

