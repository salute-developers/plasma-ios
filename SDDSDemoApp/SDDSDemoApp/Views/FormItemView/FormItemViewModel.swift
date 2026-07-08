import Foundation
import Combine
import SDDSComponents
// FormItem имеет binding-конфиг в SDDSserv (матрица size×required×title×view) и в
// HomeDS (одна ручка view). Импортируем тему там, где она слинкована в текущем
// варианте демо (гейтинг как в SDDSDemoAppViewModel).
#if !SANDBOX_DS_PLASMA_HOME_DS && !SANDBOX_DS_PLASMA_B2C
import SDDSServTheme
#endif
#if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C
import PlasmaHomeDSTheme
#endif

final class FormItemViewModel: ComponentViewModel<FormItemVariationProvider> {
    @Published var content: String = "Form item text content.\nSecond line text."
    @Published var title: String = "Title"
    @Published var titleCaption: String = ""
    @Published var caption: String = "Caption"
    @Published var counter: String = ""
    @Published var optional: String = "Optional"
    @Published var hasHint: Bool = false
    @Published var hasCaptionIcon: Bool = true
    @Published var enabled: Bool = true
    @Published var showHintTooltip: Bool = false

    /// Значения binding-«ручек» текущей темы. При изменении — резолвит `appearance`.
    @Published var bindingValues: [String: String] {
        didSet { applyBindingAppearance() }
    }

    /// Binding-«ручки» FormItem для выбранной темы: serv — полная матрица,
    /// HomeDS — только `view`, прочие темы — пусто.
    var bindingProperties: [BindingProperty] {
        Self.bindingProperties(for: theme)
    }

    static func bindingProperties(for theme: Theme) -> [BindingProperty] {
        #if !SANDBOX_DS_PLASMA_HOME_DS && !SANDBOX_DS_PLASMA_B2C
        if theme == .sdddsServTheme { return SDDSServTheme.FormItemStyles.bindingProperties }
        #endif
        #if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C
        if theme == .plasmaHomeDSTheme { return PlasmaHomeDSTheme.FormItemStyles.bindingProperties }
        #endif
        return []
    }

    static func defaultBindingValues(for theme: Theme) -> [String: String] {
        Dictionary(uniqueKeysWithValues: bindingProperties(for: theme).map { ($0.name, $0.defaultValue) })
    }

    /// Показывать ли binding-пикеры: когда у выбранной темы есть binding-ручки.
    var showsBindingPickers: Bool {
        !bindingProperties.isEmpty
    }

    init(theme: Theme = .sdddsServTheme, uiState: FormItemUiState = .init()) {
        self.bindingValues = Self.defaultBindingValues(for: theme)
        super.init(
            variationProvider: FormItemVariationProvider(theme: theme),
            theme: theme
        )
        apply(uiState: uiState)
        applyBindingAppearance()

        // При смене темы: сбрасываем «ручки» на дефолты новой темы (didSet →
        // перерезолв appearance). receive(on:) — чтобы отработать после базового
        // theme.didSet, который синхронно проставляет appearance из variation.
        $theme
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newTheme in
                guard let self else { return }
                self.bindingValues = Self.defaultBindingValues(for: newTheme)
            }
            .store(in: &cancellables)
    }

    /// Обновляет `appearance`: для тем с binding-конфигом (serv — матрица,
    /// HomeDS — view) резолвит стиль из «ручек»; для остальных — дефолтная
    /// внешность темы (её родной дизайн FormItem).
    private func applyBindingAppearance() {
        let currentTheme = theme
        #if !SANDBOX_DS_PLASMA_HOME_DS && !SANDBOX_DS_PLASMA_B2C
        if currentTheme == .sdddsServTheme {
            appearance = SDDSServTheme.FormItemStyles.resolveStyle(bindings: bindingValues).appearance
            return
        }
        #endif
        #if !SANDBOX_DS_SERV && !SANDBOX_DS_PLASMA_B2C
        if currentTheme == .plasmaHomeDSTheme {
            appearance = PlasmaHomeDSTheme.FormItemStyles.resolveStyle(bindings: bindingValues).appearance
            return
        }
        #endif
        if let themeDefault = variationProvider.variations.first?.appearance {
            appearance = themeDefault
        }
    }

    private func apply(uiState: FormItemUiState) {
        content = uiState.content
        title = uiState.title
        titleCaption = uiState.titleCaption
        caption = uiState.caption
        counter = uiState.counter
        optional = uiState.optional
        hasHint = uiState.hasHint
        hasCaptionIcon = uiState.hasCaptionIcon
        enabled = uiState.enabled
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
    }
}
