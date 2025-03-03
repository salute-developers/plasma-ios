import Foundation

struct ComponentConfiguration<Props: MergeableConfiguration>: Codable {
    struct View: Codable {
        let props: Props
    }
    
    struct Variation: Codable {
        let id: String
        let parent: String?
        let props: Props
        let view: [String: View]?
    }

    let view: [String: View]
    let props: Props
    let variations: [Variation]
}

extension ComponentConfiguration {
    var allProps: [String: ComponentConfiguration.Variation] {
        var result = [String: ComponentConfiguration.Variation]()
        for variation in self.variations {
            result[variation.id] = variation
        }
        return result
    }
    
    var allBaseKeys: [String] {
        return allProps.keys.map({ $0 }).filter {
            $0.variationPathComponents.count == 1
        }.sorted()
    }
    
    var allChildKeys: [String] {
        return allProps.keys.map({ $0 }).filter {
            $0.variationPathComponents.count > 1
        }.sorted()
    }
    
    func childKeys(for parentKey: String) -> [String] {
        let variations = self.variations
        return variations.filter({ $0.parent == parentKey }).map { $0.id }
    }
    
    func hasChild(rawKey: String) -> Bool {
        let index = allProps.firstIndex(where: { props in
            return props.value.parent == rawKey
        })
        return index != nil
    }
}
