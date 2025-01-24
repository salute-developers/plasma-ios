import Foundation

/**
 `StrechMode` определяет режим растяжения элементов в контейнере.

 - Cases:
    - fixed: Элементы остаются фиксированными.
    - flexible: Элементы растягиваются настолько, насколько это возможно, не изменяя своего размера, если их много.
 */
public enum StrechMode {
    case fixed
    case flexible
}
