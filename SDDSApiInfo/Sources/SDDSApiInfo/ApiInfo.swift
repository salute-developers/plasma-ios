public enum ApiState {
    case activated
    case checked
    case collapsed
    case error
    case focused
    case indeterminate
    case inactive
    case textInlined
}

public enum ApiValueType {
    case value
    case color
    /// Безразмерный коэффициент: альфа, множитель, угол. На Android это `float`,
    /// на iOS тип тот же `CGFloat`, что и у размеров, поэтому различаем разметкой.
    case float
    /// Целое значение дизайн-системы (длительность, количество). Swift-тип при этом может
    /// быть и `Double` — тип в мете описывает значение в дизайн-системе, а не Swift-API.
    case integer
    case shape
    case shadow
    case icon
    case iconSize
    case typography
    case componentStyle
}

/// Маркер стиля компонента. `components` перечисляет имена компонентов, которые
/// генерятся из этого `*Appearance` — как Android `@ApiInfo(components = [...])`.
/// Нужен там, где на один тип приходится несколько компонентов (`BadgeClear`/`IconBadge`
/// → `BadgeAppearance`); одноимённый компонент перечислять не надо.
@attached(peer)
public macro ApiInfo(components: [String] = []) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiComponent(_ name: String) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiStateEnum(_ name: String) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

/// Собственные состояния компонента — те, что встречаются в его конфигурациях оформления
/// и не входят в состояния взаимодействия (`pressed`, `hovered`, `focused`, `selected`,
/// `activated`, `readonly`, `disabled`): их словарь общий для всех компонентов.
///
/// Набор должен быть полным: по нему состояния заводятся при импорте, и состояние,
/// которое есть в конфигурации, но не объявлено здесь, импортировать не из чего.
/// Полноту проверяет генерация — она видит конфигурации и падает на незаявленном состоянии.
///
/// Нужен там, где отдельного Swift-типа состояний нет; если тип есть, он объявляется
/// через `@ApiStateEnum`.
@attached(peer)
public macro ApiStates(_ states: ApiState...) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiName(_ id: String, state: ApiState? = nil) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiType(_ type: ApiValueType) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiCopy(_ property: String) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiIgnore() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiDefault() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

@attached(peer)
public macro ApiFromVariation() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

/// Значение задаётся разметкой, а не конфигом: литерал (`CGFloat(0)`) либо выражение
/// над ключами конфига — `point(x, y)`, `size(w, h)`, `insets(top, leading, bottom,
/// trailing)`, `alpha(key)`. `zero` — значение для нулевой структуры, если оно другое.
@attached(peer)
public macro ApiValue(_ expression: String? = nil, zero: String? = nil) = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

/// Числовое значение из конфига печатается как есть (`0.4`), без обёртки `CGFloat(...)`.
@attached(peer)
public macro ApiRawNumber() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

/// Значение берётся ТОЛЬКО из состояния, указанного в `@ApiName(state:)`. Если конфиг
/// этого состояния не несёт, свойство не заполняется — обычное поведение откатилось бы
/// на базовое значение ключа. Нужно там, где состояние есть не у всех компонентов,
/// делящих один протокол размеров (`indeterminate` есть у чекбокса, но не у радиокнопки).
@attached(peer)
public macro ApiStateOnly() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")

/// Свойство эмитится всегда, даже если конфиг не содержит значения для него
/// (обычный случай — свойство молча пропускается).
@attached(peer)
public macro ApiAlwaysEmit() = #externalMacro(module: "SDDSApiInfoMacros", type: "MarkerMacro")
