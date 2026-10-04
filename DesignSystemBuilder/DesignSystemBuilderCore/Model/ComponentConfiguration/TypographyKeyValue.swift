import Foundation

/// Типографское значение конфига — то же `{type, value}`, что и у обычного ключа,
/// но названное своим типом.
///
/// Нужен там, где у свойства нет пары в iOS `Appearance`: тогда категорию в
/// `ios-api-meta.json` неоткуда взять, кроме как из самой Props-модели, и
/// `KeyValue<String>` отдал бы безликое `value` вместо `typography`.
struct TypographyKeyValue: Codable {
    let type: String?
    let value: String?

    init(type: String? = nil, value: String? = nil) {
        self.type = type
        self.value = value
    }
}
