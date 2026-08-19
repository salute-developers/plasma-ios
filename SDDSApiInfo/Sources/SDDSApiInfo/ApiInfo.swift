public enum ApiState {
    case activated
    case checked
    case collapsed
    case error
    case focused
    case indeterminate
    case inactive
}

public enum ApiValueType {
    case value
    case color
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
