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
        
        init(
            id: String = "default",
            parent: String? = nil,
            props: Props,
            view: [String: View]? = nil
        ) {
            self.id = id
            self.parent = parent
            self.props = props
            self.view = view
        }
        
        // Кастомный декодер с fallback для props
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decode(String.self, forKey: .id)
            self.parent = try container.decodeIfPresent(String.self, forKey: .parent)
            self.view = try container.decodeIfPresent([String: View].self, forKey: .view)
            
            // Если props отсутствует, создаем пустой Props
            if container.contains(.props) {
                self.props = try container.decode(Props.self, forKey: .props)
            } else {
                // Создаем пустой Props через декодирование пустого JSON
                let emptyJSON = "{}"
                let emptyData = emptyJSON.data(using: .utf8)!
                self.props = try JSONDecoder().decode(Props.self, from: emptyData)
            }
        }
        
        private enum CodingKeys: String, CodingKey {
            case id, parent, props, view
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(id, forKey: .id)
            try container.encodeIfPresent(parent, forKey: .parent)
            try container.encodeIfPresent(view, forKey: .view)
            
            // Всегда кодируем props, даже если он пустой
            try container.encode(props, forKey: .props)
        }
    }
    
    let view: [String: View]
    let props: Props?
    let variations: [Variation]
    
    init(view: [String: View]? = nil, props: Props? = nil, variations: [Variation]) {
        self.view = view ?? [:]
        self.props = props
        self.variations = variations
    }
    
    enum CodingKeys: String, CodingKey {
        case view, props, variations
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.view = try container.decodeIfPresent([String: View].self, forKey: .view) ?? [:]
        self.props = try container.decodeIfPresent(Props.self, forKey: .props)
        self.variations = try container.decode([Variation].self, forKey: .variations)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(view, forKey: .view)
        try container.encodeIfPresent(props, forKey: .props)
        try container.encode(variations, forKey: .variations)
    }
}

extension ComponentConfiguration {
    var allProps: [String: ComponentConfiguration.Variation] {
        var result = [String: ComponentConfiguration.Variation]()
        
        if variations.isEmpty, let props = props {
            result["default"] = ComponentConfiguration.Variation(props: props, view: view)
            return result
        }
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
    
    func allRecursiveChildKey(for parentKey: String) -> [String] {
        var result: [String] = []
        var visited = Set<String>()
        
        func dfs(_ key: String) {
            let directChildren = childKeys(for: key)
            for child in directChildren {
                guard !visited.contains(child) else { continue }
                visited.insert(child)
                result.append(child)
                dfs(child)
            }
        }
        
        dfs(parentKey)
        return result
    }
}
