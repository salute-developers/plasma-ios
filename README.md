### SDDS iOS

Проект объединяет в себе набор решений по адаптации дизайн-системы SDDS для приложений iOS.

## Cборка проекта

Для сборки проекта необходимо запустить ruby script:
```
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace
```

Также можно собрать только необходимые модули, если передать их списком в качестве аргумента `m`:

```
ruby ./scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace -m SDDSSwiftUI,SDDSIcons
```

Артефакты сборки появятся в папке `/build`.
