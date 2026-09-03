# ``SDDSComponents``

Библиотека UI-компонентов дизайн-системы SDDS для iOS: SwiftUI и UIKit.

@Metadata {
    @PageColor(green)
}

## Overview

Компонент отвечает за поведение и вёрстку, а весь внешний вид приходит из темы через
структуру `*Appearance`. Одна и та же ``BasicButton`` в разных темах выглядит по-разному,
хотя код вызова не меняется.

```swift
BasicButton(
    title: "Оплатить",
    subtitle: "",
    appearance: SDDSServTheme.BasicButton.l.accent.appearance,
    layoutMode: .wrapContent,
    action: {}
)
```

Если `appearance` не передать, компонент возьмёт значение из `EnvironmentValueProvider` —
его заполняет `Theme.initialize()` подключённой темы.

## Topics

### С чего начать

- <doc:GettingStarted>
- <doc:Theming>
- <doc:CustomTheme>

### Кнопки

- ``BasicButton``
- ``IconButton``
- ``LinkButton``
- ``SDDSButton``
- ``SDDSButtonGroup``

### Поля ввода

- ``SDDSTextField``
- ``SDDSTextArea``
- ``SDDSCodeField``
- ``SDDSCodeInput``
- ``SDDSAutocomplete``
- ``SDDSSelect``
- ``SDDSSelectItem``
- ``SDDSEditable``
- ``SDDSWheel``
- ``SDDSFormItem``
- ``SDDSFormHorizontal``
- ``SDDSFormVertical``

### Выбор

- ``SDDSCheckbox``
- ``SDDSCheckboxGroup``
- ``SDDSRadiobox``
- ``SDDSRadioboxGroup``
- ``SDDSSwitch``
- ``SDDSSegment``
- ``SDDSSegmentItem``
- ``SDDSChip``
- ``SDDSChipGroup``

### Навигация

- ``SDDSNavigationBar``
- ``SDDSTabs``
- ``SDDSTabItem``
- ``SDDSTabBar``
- ``SDDSTabBarIsland``
- ``SDDSTabBarItem``
- ``SDDSToolbar``
- ``SDDSDropdownMenu``
- ``SDDSPaginationDots``

### Обратная связь и оверлеи

- ``SDDSToast``
- ``SDDSNote``
- ``SDDSNoteCompact``
- ``SDDSModal``
- ``SDDSBottomSheet``
- ``SDDSDrawer``
- ``SDDSOverlay``

### Раскладка

- ``SDDSCard``
- ``SDDSCardContent``
- ``SDDSCell``
- ``SDDSList``
- ``SDDSListItem``
- ``SDDSDivider``
- ``SDDSCarousel``
- ``SDDSAccordion``
- ``SDDSAccordionItem``
- ``SDDSScrollbar``

### Отображение данных

- ``SDDSAvatar``
- ``SDDSAvatarGroup``
- ``SDDSBadge``
- ``SDDSCounter``
- ``SDDSIndicator``
- ``SDDSProgressView``
- ``SDDSCircularProgressBar``
- ``SDDSSpinner``
- ``SDDSLoader``
- ``SDDSRectSkeleton``
- ``SDDSTextSkeleton``
- ``SDDSImage``
- ``SDDSIcon``
- ``SDDSText``

### Модель внешнего вида

- ``AppearanceVariation``
- ``ComponentAppearanceVariation``
- ``Variation``
- ``BindingProperty``
