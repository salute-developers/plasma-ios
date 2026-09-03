//
//  Точка применения темы SDDSServTheme для съёмки скриншотов документации.
//
//  Каждая тема объявляет одноимённые `Theme` и `setDefaultValues()`, поэтому
//  импортировать их все в одном файле нельзя — вызовы стали бы неоднозначными.
//  Здесь ровно один импорт темы, наружу торчит уникальное имя.
//

import SDDSComponents
import SDDSThemeCore
import SDDSServTheme

enum SDDSServThemeDocCase {
    /// Каталог темы в репозитории: Themes/<это>/docs/screenshots.
    static let directoryName = "SDDSservTheme"

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
        provider.set(value: CircularProgressBar.l.`default`.appearance, forKey: CircularProgressBarAppearance.self)
        provider.set(value: DrawerCloseOuter.m.appearance, forKey: DrawerAppearance.self)
        provider.set(value: Loader.`default`.appearance, forKey: LoaderAppearance.self)
        provider.set(value: Modal.`default`.appearance, forKey: ModalAppearance.self)
        provider.set(value: NotificationLoose.m.appearance, forKey: NotificationAppearance.self)
        provider.set(value: Popover.m.appearance, forKey: PopoverAppearance.self)
        provider.set(value: ScrollBar.m.appearance, forKey: ScrollbarAppearance.self)
        provider.set(value: TextSkeleton.`default`.appearance, forKey: SkeletonAppearance.self)
        provider.set(value: Spinner.l.`default`.appearance, forKey: SpinnerAppearance.self)
        provider.set(value: TabItemDefault.l.appearance, forKey: TabItemAppearance.self)
        provider.set(value: TabsDefault.l.appearance, forKey: TabsAppearance.self)
        provider.set(value: Toast.pilled.appearance, forKey: ToastAppearance.self)
    }
}
