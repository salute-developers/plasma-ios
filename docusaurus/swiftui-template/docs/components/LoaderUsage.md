---
title: Loader
---

`SDDSLoader` - это компонент-обертка, который отображает либо `SDDSSpinner`, либо `SDDSCircularProgressBar` в зависимости от переданного `appearance`.

## Описание

`SDDSLoader` позволяет легко переключаться между различными типами индикаторов загрузки, используя единый интерфейс. Компонент автоматически выбирает подходящий индикатор на основе настроек `LoaderAppearance`.

## Структура

### LoaderAppearance
- `spinnerAppearance: SpinnerAppearance?` - настройки для Spinner
- `circularProgressAppearance: CircularProgressBarAppearance?` - настройки для CircularProgressBar

### LoaderSizeConfiguration
- Loader не имеет собственных размеров
- Все размеры определяются через вложенные компоненты

## Использование

### Базовое использование с Spinner
```swift
// @sample: SDDSComponentsFixtures/Samples/Loader/SDDSLoader_Simple.swift
```

### С CircularProgressBar
```swift
SDDSLoader(appearance: LoaderAppearance(
    circularProgressAppearance: CircularProgressBarAppearance.defaultValue
))
.environment(\.circularProgressBarData, SDDSCircularProgressBarData(
    progress: 0.75,
    hasTrack: true,
    content: AnyView(Text("75%")),
    appearance: CircularProgressBarAppearance.defaultValue
))
```

## Инжекция параметров через Environment

Для корректной работы компонента необходимо инжектировать параметры вложенных компонентов через environment:

### SDDSSpinnerData
```swift
.environment(\.spinnerData, SDDSSpinnerData(
    isAnimating: true,                    // Состояние анимации
    appearance: spinnerAppearance         // Настройки внешнего вида
))
```

### SDDSCircularProgressBarData
```swift
.environment(\.circularProgressBarData, SDDSCircularProgressBarData(
    progress: 0.5,                        // Прогресс от 0.0 до 1.0
    hasTrack: true,                       // Показывать ли трек
    content: AnyView(icon),               // Кастомный контент в центре
    appearance: circularProgressAppearance // Настройки внешнего вида
))
```

## Логика отображения

1. Если передан `spinnerAppearance` - отображается `SDDSSpinner`
2. Если передан `circularProgressAppearance` - отображается `SDDSCircularProgressBar`
3. Если ни один не передан - отображается `SDDSSpinner` с дефолтными настройками

## Примеры интеграции

### В SwiftUI View с переключением типов
```swift
struct LoaderView: View {
    @ObservedObject private var viewModel: LoaderViewModel
    
    var body: some View {
        VStack {
            switch viewModel.loaderType {
            case .spinner:
                SDDSLoader(appearance: viewModel.appearance)
                    .environment(\.spinnerData, spinnerData)
            case .circularProgress:
                SDDSLoader(appearance: viewModel.appearance)
                    .environment(\.circularProgressBarData, circularProgressBarData)
            }
        }
    }
    
    private var spinnerData: SDDSSpinnerData {
        .init(
            isAnimating: viewModel.spinnerViewModel.isAnimating,
            appearance: viewModel.appearance.spinnerAppearance
        )
    }
    
    private var circularProgressBarData: SDDSCircularProgressBarData {
        let circularProgressViewModel = viewModel.circularProgressViewModel
        return .init(
            progress: circularProgressViewModel.progress,
            hasTrack: circularProgressViewModel.hasTrack,
            content: circularProgressBarContent,
            appearance: viewModel.appearance.circularProgressAppearance
        )
    }
}
```

### С LoaderAppearance и ViewModel
```swift
final class LoaderViewModel: ComponentViewModel<LoaderVariationProvider> {
    @Published var spinnerViewModel: SpinnerViewModel
    @Published var circularProgressViewModel: CircularProgressBarViewModel
    @Published var loaderType: LoaderType = .spinner
    
    override func onUpdateAppearance() {
        super.onUpdateAppearance()
        
        // Обновляем appearance вложенных компонентов
        spinnerViewModel.appearance = appearance.spinnerAppearance ?? .defaultValue
        circularProgressViewModel.appearance = appearance.circularProgressAppearance ?? .defaultValue
    }
}
```

## Зависимости

- `SDDSSpinner` - для отображения спиннера
- `SDDSCircularProgressBar` - для отображения кругового прогресс-бара
- `SpinnerAppearance` - настройки внешнего вида спиннера
- `CircularProgressBarAppearance` - настройки внешнего вида прогресс-бара
