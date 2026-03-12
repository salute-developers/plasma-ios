import Foundation
import SwiftUI

public enum SelectSelectionMode: Hashable {
    case single
    case multiple
}

public final class SDDSSelectState: ObservableObject {
    @Published public var isOpened: Bool
    
    public init(isOpened: Bool = false) {
        self.isOpened = isOpened
    }
    
    public func open() {
        isOpened = true
    }
    
    public func close() {
        isOpened = false
    }
    
    public func toggle() {
        isOpened.toggle()
    }
}

public struct SelectSelectionResult {
    public let selectedIDs: Set<UUID>
    public let shouldCloseDropdown: Bool
    public let didChangeSelection: Bool
}

public final class SelectDataStateManager {
    public private(set) var mode: SelectSelectionMode
    private var selectedIDs: Set<UUID>
    
    public init(
        mode: SelectSelectionMode = .single,
        selectedIDs: Set<UUID> = []
    ) {
        self.mode = mode
        self.selectedIDs = selectedIDs
    }
    
    public var selectedOptionIDs: Set<UUID> {
        selectedIDs
    }
    
    public func updateMode(_ mode: SelectSelectionMode) {
        self.mode = mode
        if mode == .single, let first = selectedIDs.first {
            selectedIDs = [first]
        }
    }
    
    @discardableResult
    public func handleTap(
        options: [SelectOption],
        at index: Int,
        isReadOnly: Bool = false
    ) -> SelectSelectionResult {
        guard !isReadOnly, index >= 0, index < options.count else {
            return .init(selectedIDs: selectedIDs, shouldCloseDropdown: false, didChangeSelection: false)
        }
        
        let option = options[index]
        guard option.isEnabled else {
            return .init(selectedIDs: selectedIDs, shouldCloseDropdown: false, didChangeSelection: false)
        }
        
        let before = selectedIDs
        
        switch mode {
        case .single:
            if selectedIDs.contains(option.id) {
                // Android parity: retap selected item clears selection.
                selectedIDs.removeAll()
            } else {
                selectedIDs = [option.id]
            }
            return .init(
                selectedIDs: selectedIDs,
                shouldCloseDropdown: true,
                didChangeSelection: before != selectedIDs
            )
        case .multiple:
            if selectedIDs.contains(option.id) {
                selectedIDs.remove(option.id)
            } else {
                selectedIDs.insert(option.id)
            }
            return .init(
                selectedIDs: selectedIDs,
                shouldCloseDropdown: false,
                didChangeSelection: before != selectedIDs
            )
        }
    }
}

