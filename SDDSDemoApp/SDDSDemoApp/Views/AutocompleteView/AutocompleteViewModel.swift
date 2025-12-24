import Foundation
import Combine
import SwiftUI
import SDDSComponents

enum AutocompleteFieldAlignment: String, CaseIterable {
    case topLeft
    case topCenter
    case topRight
    case centerLeft
    case center
    case centerRight
    case bottomLeft
    case bottomCenter
    case bottomRight
}

final class AutocompleteViewModel: ComponentViewModel<AutocompleteVariationProvider> {
    @Published var value: TextFieldValue = .single("")
    @Published var withEmptyState: Bool = false
    @Published var showLoading: Bool = false
    @Published var fieldAlignment: AutocompleteFieldAlignment = .center
    @Published var listItems: [SDDSListItem<EmptyView>] = []
    @Published var shouldShowEmptyState: Bool = false
    @Published var isDropdownPresented: Bool = false
    
    @Published var layout: AutocompleteLayout = .normal {
        didSet {
            variationProvider.layout = layout
            self.selectVariation(variations.first)
        }
    }
    
    let allNames: [String] = [
        "Иван Петров",
        "Мария Смирнова",
        "Александр Иванов",
        "Анна Козлова",
        "Дмитрий Волков",
        "Елена Новикова",
        "Сергей Морозов",
        "Ольга Лебедева",
        "Андрей Соколов",
        "Татьяна Кузнецова"
    ]
    
    var searchText: String {
        if case .single(let text) = value {
            return text
        }
        return ""
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        }
        return allNames.filter { name in
            name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    
    private func updateListItems() {
        updateListItems(with: value)
    }
    
    func updateListItems(with value: TextFieldValue) {
        let currentSearchText: String
        if case .single(let text) = value {
            currentSearchText = text
        } else {
            currentSearchText = ""
        }
        
        // Если текст пустой, не показываем элементы и не открываем dropdown
        guard !currentSearchText.isEmpty else {
            listItems = []
            shouldShowEmptyState = false
            isDropdownPresented = false
            return
        }
        
        // Фильтруем только если есть текст
        let filtered = allNames.filter { name in
            name.localizedCaseInsensitiveContains(currentSearchText)
        }
        
        let currentShouldShowEmptyState: Bool
        if withEmptyState && !currentSearchText.isEmpty {
            currentShouldShowEmptyState = filtered.isEmpty
        } else {
            currentShouldShowEmptyState = false
        }
        
        shouldShowEmptyState = currentShouldShowEmptyState
        
        if currentShouldShowEmptyState {
            listItems = []
        } else {
            listItems = filtered.map { name in
                SDDSListItem(
                    title: name,
                    rightContentEnabled: false,
                    disabled: false,
                    appearance: appearance.dropdownAppearance.listAppearance.listItemAppearance,
                    onTap: nil
                )
            }
        }
        
        isDropdownPresented = !currentSearchText.isEmpty
    }
    
    init() {
        super.init(variationProvider: AutocompleteVariationProvider())
        
        if !searchText.isEmpty {
            updateListItems()
        } else {
            listItems = []
            shouldShowEmptyState = false
            isDropdownPresented = false
        }
        
        
        $withEmptyState
            .sink { [weak self] _ in
                self?.updateListItems()
            }
            .store(in: &cancellables)
        
        $showLoading
            .sink { [weak self] _ in
                self?.updateListItems()
            }
            .store(in: &cancellables)
    }
}

