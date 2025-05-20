# SDDSBottomSheet

Модальное окно, которое появляется снизу экрана и может быть настроено с различными параметрами отображения.

## Параметры

| Параметр | Тип | Описание |
|----------|-----|-----------|
| appearance | BottomSheetAppearance? | Параметры внешнего вида bottom sheet (опционально) |
| header | ViewBuilder | Заголовок bottom sheet (по умолчанию EmptyView) |
| content | ViewBuilder | Основной контент bottom sheet |
| footer | ViewBuilder | Нижняя часть bottom sheet (по умолчанию EmptyView) |

## Окружение
- `bottomSheetAppearance`: Стандартные настройки внешнего вида bottom sheet

## Примеры использования

### Базовый bottom sheet с заголовком и контентом

```swift
@State private var isBottomSheetPresented: Bool = false
@State private var detent: BottomSheetDetent = .fitContent

View()
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
