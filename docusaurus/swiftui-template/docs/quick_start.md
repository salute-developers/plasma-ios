---
id: quick_start
title: Быстрый старт
sidebar_position: 1
slug: /
---

## iOS

1. Добавить зависимости в Package.swift или через Xcode:
```swift
dependencies: [
    .package(url: "https://github.com/salute-developers/plasma-ios", from: "{{ docs-artifactVersion }}"),
    .package(url: "https://github.com/salute-developers/plasma-ios", from: "{{ docs-artifactVersion }}")
]
```

Или подключить через Xcode:
- SDDSComponents
- SDDSIcons  
- SDDSThemeCore
- {{ docs-theme-codeReference }}

2. Инициализировать тему в App файле:
```swift
import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSThemeCore
import {{ docs-theme-codeReference }}

@main
struct YourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    {{ docs-theme-codeReference }}.Theme.initialize()
                }
        }
    }
}
```

3. Использовать компоненты и токены:
```swift
import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSThemeCore
import {{ docs-theme-codeReference }}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Использование BasicButton
            BasicButton(
                title: "Кнопка",
                appearance: {{ docs-theme-codeReference }}.BasicButton.l.default.appearance,
                action: {}
            )
            
            // Использование токенов цветов
            Rectangle()
                .fill({{ docs-theme-codeReference }}.ColorToken.backgroundDefaultPrimary.color)
                .frame(height: 50)
            
            // Использование токенов типографики
            Text("Заголовок")
                .typography({{ docs-theme-codeReference }}.TypographyToken.bodyLBold.token)
                .foregroundColor({{ docs-theme-codeReference }}.ColorToken.textDefaultPrimary.color)
            
            // Использование иконок
            Asset.starFill36.image
                .foregroundColor({{ docs-theme-codeReference }}.ColorToken.accentPrimary.color)
        }
        .padding()
    }
}
```

4. Готово! Теперь вы можете использовать все компоненты SDDS в своем iOS приложении.