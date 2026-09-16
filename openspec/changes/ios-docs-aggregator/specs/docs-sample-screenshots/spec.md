# docs-sample-screenshots

Снятие скриншотов `@DocSample`-сэмплов существующей snapshot-инфраструктурой
(`SDDSDemoAppTests/SnapshotTests`) и доставка PNG в `assets/screenshots/` бандла.

## ADDED Requirements

### Requirement: Скриншоты сэмплов по реестру
Тестовый сьют SHALL рендерить каждый сэмпл из `samples.json`, у которого не выставлен
признак `needScreenshot=false` и чей компонент присутствует в `components-info.json`
(аналог фильтра `ProvidedStyleKeys` на Android), и сохранять PNG с именем
`<fqName с точками, заменёнными на "_">.png` в каталог, который агрегатор копирует в
`assets/screenshots/`.

#### Scenario: Скриншот снятого сэмпла
- **WHEN** сьют выполняется для сэмпла с fqName `SDDSComponentsFixtures.Samples.button.BasicButton_Simple`
- **THEN** в выходном каталоге появляется
  `SDDSComponentsFixtures_Samples_button_BasicButton_Simple.png`

#### Scenario: needScreenshot=false пропускается
- **WHEN** сэмпл помечен `needScreenshot=false`
- **THEN** PNG для него не создаётся и тест не падает

#### Scenario: Фильтр по компонентам
- **WHEN** компонент сэмпла отсутствует в `components-info.json`
- **THEN** скриншот не снимается (паритет с Android-фильтром)

### Requirement: Один вариант оформления для паритета
Для паритета с Android сьют SHALL снимать один вариант (Light); расширение до Dark/масштабов
допускается только после подтверждения ожиданий Documentation Service.

#### Scenario: Единственный файл на сэмпл
- **WHEN** сьют выполнен полностью
- **THEN** на каждый подходящий сэмпл приходится ровно один PNG
