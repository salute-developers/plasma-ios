//
//  Точка применения темы PlasmaHomeDSTheme для съёмки скриншотов документации.
//
//  Каждая тема объявляет одноимённые `Theme` и `setDefaultValues()`, поэтому
//  импортировать их все в одном файле нельзя — вызовы стали бы неоднозначными.
//  Здесь ровно один импорт темы, наружу торчит уникальное имя.
//

import SDDSComponents
import SDDSThemeCore
import PlasmaHomeDSTheme

enum PlasmaHomeDSThemeDocCase {
    /// Каталог темы в репозитории: Themes/<это>/docs/screenshots.
    static let directoryName = "PlasmaHomeDSTheme"

    static func apply() {
        Theme.initialize()
        applyDocDefaults()
    }

    /// Дефолты для компонентов, которых нет в `EnvironmentValueProvider+DefaultValues`
    /// темы. Ставятся ТОЛЬКО здесь, в тестовом окружении: провайдер глобальный, и
    /// правка самих тем меняет рендер всего приложения — на этом уже падали снапшоты
    /// `TabsSnapshotTest` (см. change ios-docs-aggregator, задача 10).
    ///
    /// Вариация берётся та же, что использует сэмпл, — это зафиксированный командой
    /// канонический вариант. Если конкретная тема такой вариации не объявляет, берётся
    /// ближайшая из имеющихся. Ключи без канонического варианта в сэмплах не покрыты.
    private static func applyDocDefaults() {
        let provider = EnvironmentValueProvider.shared
        provider.set(value: BottomSheet.`default`.appearance, forKey: BottomSheetAppearance.self)
        provider.set(value: Card.l.appearance, forKey: CardAppearance.self)
        provider.set(value: Carousel.buttonsPlacementInner.appearance, forKey: CarouselAppearance.self)
        provider.set(value: CircularProgressBar.l.`default`.appearance, forKey: CircularProgressBarAppearance.self)
        provider.set(value: Divider.`default`.appearance, forKey: DividerAppearance.self)
        provider.set(value: ListItem.m.appearance, forKey: ListItemAppearance.self)
        provider.set(value: Loader.`default`.appearance, forKey: LoaderAppearance.self)
        provider.set(value: Overlay.`default`.appearance, forKey: OverlayAppearance.self)
        provider.set(value: TextSkeleton.`default`.appearance, forKey: SkeletonAppearance.self)
        provider.set(value: Spinner.m.`default`.appearance, forKey: SpinnerAppearance.self)
        provider.set(value: Switch.l.appearance, forKey: SwitchAppearance.self)
        provider.set(value: TextField.l.appearance, forKey: TextFieldAppearance.self)
        provider.set(value: Toast.`default`.appearance, forKey: ToastAppearance.self)
    }
}
