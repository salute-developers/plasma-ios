import Foundation

/// Диагностика сверки одного компонента.
struct ReconcileReport {
    let component: String
    let matched: Int
    let total: Int
    let gaps: [String]   // config-id без цели в Appearance (структурные/отсутствующие)
    let drift: [String]  // Appearance-свойства без config-id (потенциальный дрифт)
}

/// Сопоставляет config-id (`Props`) с целями Appearance, ничего не переименовывая.
/// На выходе — params, ключёванные по config-id, с координатами кода из Appearance
/// (`methodName`/`group`/`valueQualifiedType`). Пробелы помечаются пустым `methodName`.
struct Reconciler {
    /// Суффиксы-категории, отбрасываемые при сравнении «базы» имени.
    private static let categorySuffixes = ["typography", "appearance", "fillstyle", "brush", "style", "color", "shape"]

    /// Безопасные синонимы-эквиваленты (только однозначные, напр. опечаточные варианты).
    /// Семантические синонимы (label↔title и т.п.) НЕ включаем — они требуют явного
    private static let synonyms: [String: String] = [
        "disabledalpha": "disablealpha"
    ]

    static func normalize(_ s: String) -> String {
        let n = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return synonyms[n] ?? n
    }

    private static func base(_ normalized: String) -> String {
        for suffix in categorySuffixes where normalized.hasSuffix(suffix) && normalized.count > suffix.count {
            return String(normalized.dropLast(suffix.count))
        }
        return normalized
    }

    /// Реконсайлит один компонент. `overrides` — курируемая таблица `configId → имя
    /// свойства/группы Appearance` (sidecar, без правок Swift), имеет высший приоритет.
    func reconcile(
        meta: ComponentApiMeta,
        fields: [PropsField],
        overrides: [String: String] = [:]
    ) -> (ComponentApiMeta, ReconcileReport) {
        // Индекс Appearance-параметров по нормализованным methodName и id (id несёт marker-override).
        var index: [String: [Param]] = [:]
        for param in meta.params {
            let keys = param.explicitId
                ? Set([Self.normalize(param.id)])
                : Set([Self.normalize(param.methodName), Self.normalize(param.id)])
            for key in keys {
                index[key, default: []].append(param)
            }
        }

        var usedParamKeys = Set<String>()
        var newParams: [Param] = []
        var gaps: [String] = []

        for field in fields {
            // это точное объявление config-id, высший приоритет.
            // Только для реально размеченных свойств (id != имя property), чтобы случайно
            // одноимённое свойство не перехватило вложенный компонент (напр. Wheel.dividerStyle).
            if let match = bestMatch(for: field, in: index) ?? index[Self.normalize(field.id)]?.first(where: {
                Self.normalize($0.id) == Self.normalize(field.id) && $0.id != $0.methodName && $0.state == nil
            }) {
                usedParamKeys.insert(Self.normalize(match.methodName))
                newParams.append(Param(
                    type: match.type, id: field.id, methodName: match.methodName, paramName: match.paramName,
                    paramQualifiedType: match.paramQualifiedType, paramSimpleType: match.paramSimpleType,
                    valueQualifiedType: match.valueQualifiedType, group: match.group,
                    state: match.state, copyOf: match.copyOf, valueEnum: match.valueEnum, fromVariation: match.fromVariation, markupValue: match.markupValue, markupZero: match.markupZero,
                    rawNumber: match.rawNumber, alwaysEmit: match.alwaysEmit, stateOnly: match.stateOnly
                ))
                continue
            }
            // Курируемый override (sidecar) — для структурных исключений, если заданы.
            if let target = overrides[field.id],
               let match = index[Self.normalize(target)]?.first {
                usedParamKeys.insert(Self.normalize(match.methodName))
                newParams.append(Param(
                    type: match.type, id: field.id, methodName: match.methodName, paramName: match.paramName,
                    paramQualifiedType: match.paramQualifiedType, paramSimpleType: match.paramSimpleType,
                    valueQualifiedType: match.valueQualifiedType, group: match.group,
                    state: match.state, copyOf: match.copyOf, valueEnum: match.valueEnum, fromVariation: match.fromVariation, markupValue: match.markupValue, markupZero: match.markupZero,
                    rawNumber: match.rawNumber, alwaysEmit: match.alwaysEmit, stateOnly: match.stateOnly
                ))
                continue
            }
            if let match = bestMatch(for: field, in: index) {
                usedParamKeys.insert(Self.normalize(match.methodName))
                newParams.append(Param(
                    type: match.type,
                    id: field.id,
                    methodName: match.methodName,
                    paramName: match.paramName,
                    paramQualifiedType: match.paramQualifiedType,
                    paramSimpleType: match.paramSimpleType,
                    valueQualifiedType: match.valueQualifiedType,
                    group: match.group,
                    state: match.state,
                    copyOf: match.copyOf,
                    valueEnum: match.valueEnum,
                    fromVariation: match.fromVariation,
                    markupValue: match.markupValue,
                    markupZero: match.markupZero,
                    rawNumber: match.rawNumber,
                    alwaysEmit: match.alwaysEmit,
                    stateOnly: match.stateOnly
                ))
            } else {
                gaps.append(field.id)
                newParams.append(Param(
                    type: field.category,
                    id: field.id,
                    methodName: "",
                    paramName: "",
                    paramQualifiedType: "",
                    paramSimpleType: "",
                    valueQualifiedType: field.nestedProps ?? "",
                    group: "root",
                    unmapped: true
                ))
            }
        }

        // Свойство с разметочным значением конфиг-поля не имеет по определению —
        // сохраняем его так же, как явно размеченные.
        for param in meta.params
        where (param.explicitId || param.markupValue != nil || param.markupZero != nil)
            && !usedParamKeys.contains(Self.normalize(param.methodName)) {
            newParams.append(param)
            usedParamKeys.insert(Self.normalize(param.methodName))
        }

        let drift = meta.params
            .filter { !usedParamKeys.contains(Self.normalize($0.methodName)) }
            .map { $0.id }

        let reconciled = ComponentApiMeta(
            componentName: meta.componentName,
            qualifiedName: meta.qualifiedName,
            styleQualifiedName: meta.styleQualifiedName,
            sizeQualifiedName: meta.sizeQualifiedName,
            components: meta.components,
            resolvedTypes: meta.resolvedTypes,
            stateEnum: meta.stateEnum,
            params: newParams
        )
        let report = ReconcileReport(
            component: meta.componentName,
            matched: fields.count - gaps.count,
            total: fields.count,
            gaps: gaps,
            drift: Array(Set(drift)).sorted()
        )
        return (reconciled, report)
    }

    /// Лучший Appearance-параметр для config-поля: exact → alias(Style↔Typography/Appearance)
    /// → совпадение базы + категории.
    private func bestMatch(for field: PropsField, in index: [String: [Param]]) -> Param? {
        let fnorm = Self.normalize(field.id)
        let fbase = Self.base(fnorm)

        var best: Param?
        var bestScore = 0
        for (_, params) in index {
            for param in params {
                if param.explicitId, Self.normalize(param.id) != fnorm { continue }
                if param.state != nil { continue }
                let pnorm = Self.normalize(param.methodName)
                let pbase = Self.base(pnorm)
                var score = 0
                if pnorm == fnorm { score = 100 }
                else if pbase == fbase && !fbase.isEmpty { score = 80 }
                else if !fbase.isEmpty && (pbase.contains(fbase) || fbase.contains(pbase)) { score = 40 }
                if param.type == field.category { score += 15 }
                // Согласование alias по категориям (config `*Style` ↔ Appearance typography/component_style).
                if field.id.lowercased().hasSuffix("style") && (param.type == "typography" || param.type == "component_style") { score += 10 }
                if score > bestScore { bestScore = score; best = param }
            }
        }
        return bestScore >= 80 ? best : nil
    }
}
