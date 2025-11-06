import SwiftUI

struct TabItemWidthPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGFloat] = [:]
    
    static func reduce(value: inout [String: CGFloat], nextValue: () -> [String: CGFloat]) {
        value.merge(nextValue()) { $1 }
    }
}

struct TabItemHeightPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGFloat] = [:]
    
    static func reduce(value: inout [String: CGFloat], nextValue: () -> [String: CGFloat]) {
        value.merge(nextValue()) { $1 }
    }
}

struct ContentWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TabItemPositionPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGPoint] = [:]
    
    static func reduce(value: inout [String: CGPoint], nextValue: () -> [String: CGPoint]) {
        value.merge(nextValue()) { $1 }
    }
}

