import Foundation

/// Целое из конфига. `theme-converter#279` завёл тип `integer` и стал писать число
/// там, где раньше была строка, а старые темы приезжают со строкой до сих пор —
/// читаем оба представления.
struct IntegerValue: Codable {
    let value: Double

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let number = try? container.decode(Double.self) {
            value = number
            return
        }
        let string = try container.decode(String.self)
        guard let number = Double(string) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Ожидалось целое, пришло «\(string)»"
            )
        }
        value = number
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
