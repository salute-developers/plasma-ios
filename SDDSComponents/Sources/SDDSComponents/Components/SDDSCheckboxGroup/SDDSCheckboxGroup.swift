import Foundation
import SwiftUI

public typealias CheckboxGroupOnChange = ((_ index: Int, _ state: SelectionControlState) -> ())
public typealias CheckboxGroupOnParentChange = ((_ state: SelectionControlState) -> ())

/**
 `CheckboxGroupBehaviour` определяет поведение группы чекбоксов.

 - Cases:
    - hierarchical: Группа чекбоксов с родительским и дочерними элементами. Изменение состояния родительского чекбокса влияет на состояние всех дочерних элементов. Изменение состояния любого дочернего элемента также обновляет состояние родительского.
        - Parameters:
            - parent: Родительский чекбокс, состояние которого влияет на все дочерние элементы.
            - child: Массив дочерних чекбоксов, состояние которых может влиять на родительский чекбокс.
    - `default`: Группа чекбоксов, инициализированная списком без логики управления состоянием между элементами.
        - Parameters:
            - data: Массив данных для инициализации группы чекбоксов.
 */
public enum CheckboxGroupBehaviour {
    case hierarchical(parent: CheckboxData, child: [CheckboxData], onChildChange: CheckboxGroupOnChange? = nil, onParentChange: CheckboxGroupOnParentChange? = nil)
    case `default`(data: [CheckboxData], onChange: CheckboxGroupOnChange? = nil)
}

/**
 `CheckboxGroupSizeConfiguration` задает конфигурацию размеров`.
 
 - Parameters:
    - horizontalIndent: Горизонтальный отступ для всех элементов, начиная со второго.
    - verticalSpacing: Вертикальный отступ между элементами.
 */
public protocol CheckboxGroupSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var horizontalIndent: CGFloat { get }
    var verticalSpacing: CGFloat { get }
}

/**
 `SDDSCheckboxGroup` представляет собой группу чекбоксов, настроенных с помощью `CheckboxData`.
 
 - Parameters:
    - behaviour: Поведение группы чекбоксов, определенное перечислением `CheckboxGroupBehaviour`.
    - size: Конфигурация размеров.
 */
public struct SDDSCheckboxGroup: View {
    @State private var parentState: SelectionControlState?
    @State private var childStates: [SelectionControlState]
    let behaviour: CheckboxGroupBehaviour
    let size: CheckboxGroupSizeConfiguration
    
    public init(behaviour: CheckboxGroupBehaviour, size: CheckboxGroupSizeConfiguration) {
        self.behaviour = behaviour
        
        switch behaviour {
        case .hierarchical(let parent, let children, _, _):
            self._parentState = State(initialValue: parent.state.wrappedValue)
            self._childStates = State(initialValue: children.map { $0.state.wrappedValue })
        case .default(let data, _):
            self._parentState = State(initialValue: nil)
            self._childStates = State(initialValue: data.map { $0.state.wrappedValue })
        }
        
        self.size = size
    }
    
    public var body: some View {
        VStack(spacing: size.verticalSpacing) {
            switch behaviour {
            case .hierarchical(let parent, let children, let onChildChange, let onParentChange):
                SDDSCheckbox(
                    state: Binding(
                        get: { self.parentState ?? .deselected },
                        set: { 
                            self.updateParentState($0)
                            onParentChange?($0)
                        }
                    ),
                    title: parent.title,
                    subtitle: parent.subtitle,
                    isEnabled: parent.isEnabled,
                    images: parent.images,
                    size: parent.size,
                    appearance: parent.appearance,
                    accessibility: parent.accessibility
                )
                ForEach(Array(children.enumerated()), id: \.offset) { index, child in
                    SDDSCheckbox(
                        state: Binding(
                            get: { self.childStates[index] },
                            set: { 
                                self.updateChildState($0, at: index)
                                onChildChange?(index, $0)
                            }
                        ),
                        title: child.title,
                        subtitle: child.subtitle,
                        isEnabled: child.isEnabled,
                        images: child.images,
                        size: child.size,
                        appearance: child.appearance,
                        accessibility: child.accessibility
                    )
                    .padding(.leading, size.horizontalIndent)
                }
            case .default(let data, let onChange):
                ForEach(Array(data.enumerated()), id: \.offset) { index, item in
                    SDDSCheckbox(
                        state: Binding(
                            get: { self.childStates[index] },
                            set: { 
                                self.childStates[index] = $0
                                onChange?(index, $0)
                            }
                        ),
                        title: item.title,
                        subtitle: item.subtitle,
                        isEnabled: item.isEnabled,
                        images: item.images,
                        size: item.size,
                        appearance: item.appearance,
                        accessibility: item.accessibility
                    )
                    .padding(.leading, index > 0 ? size.horizontalIndent : 0)
                }
            }
        }
    }
    
    private func updateParentState(_ newState: SelectionControlState) {
        parentState = newState
        childStates = Array(repeating: newState, count: childStates.count)
        if case .hierarchical(_, let children, _, _) = behaviour {
            for (index, _) in children.enumerated() {
                children[index].state.wrappedValue = newState
            }
        }
    }
    
    private func updateChildState(_ newState: SelectionControlState, at index: Int) {
        childStates[index] = newState
        if case .hierarchical(let parent, let children, _, _) = behaviour {
            children[index].state.wrappedValue = newState
            if childStates.allSatisfy({ $0 == .selected }) {
                parentState = .selected
            } else if childStates.allSatisfy({ $0 == .deselected }) {
                parentState = .deselected
            } else {
                parentState = .indeterminate
            }
            parent.state.wrappedValue = parentState ?? .deselected
        }
    }
}
