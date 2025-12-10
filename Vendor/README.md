# Vendor Dependencies

Эта папка содержит внешние зависимости, добавленные как git submodules.

## InputMask

**Версия:** 7.3.2  
**Репозиторий:** https://github.com/RedMadRobot/input-mask-ios  
**Лицензия:** MIT  
**Используется в:** SDDSComponents

### Описание

InputMask - библиотека для форматирования пользовательского ввода в текстовые поля.
Поддерживает различные маски: телефоны, даты, карты, серийные номера и т.д.

### Обновление

Для обновления до последней версии:

```bash
cd Vendor/InputMask
git pull origin master
cd ../..
git add Vendor/InputMask
git commit -m "Update InputMask to latest version"
```

Или до конкретной версии:

```bash
cd Vendor/InputMask
git checkout 7.3.2  # или другой tag
cd ../..
git add Vendor/InputMask
git commit -m "Update InputMask to 7.3.2"
```

### Использование в SDDSComponents

InputMask встроен в SDDSComponents как статическая зависимость через SPM.
Пользователям библиотеки НЕ нужно подключать InputMask отдельно.

В коде SDDSComponents используйте:

```swift
@_implementationOnly import InputMask

// Ваш код с использованием InputMask
let mask = Mask(format: "+7 ([000]) [000]-[00]-[00]")
```

`@_implementationOnly` гарантирует, что InputMask остается деталью реализации
и не становится частью публичного API SDDSComponents.

### Для разработчиков

При клонировании репозитория не забудьте инициализировать submodules:

```bash
git clone <your-repo>
git submodule update --init --recursive
```

