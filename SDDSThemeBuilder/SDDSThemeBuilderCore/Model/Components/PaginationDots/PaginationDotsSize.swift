import Foundation

struct PaginationDotsSize: CodeGenerationSize {
    typealias Props = PaginationDotsProps
    
    var orientation: String?
    var gap: String?
    var edgeShrinkFactor: String?
    var dotWidth: String?
    var dotWidthActivated: String?
    var dotHeight: String?
    var dotHeightActivated: String?
    var edgeCount: String?
    
    init(variation: PaginationDotsConfiguration.Variation, nullify: Bool = false) {
        self.init(props: variation.props, id: variation.id, nullify: nullify)
    }
    
    init(props: PaginationDotsProps, id: String? = nil, nullify: Bool = false) {
        self.orientation = PaginationDotsOrientationContextBuilder(id: props.orientation?.value, nullify: nullify).context
        self.gap = CGFloatContextBuilder(props.gap?.value, nullify: nullify).context
        self.edgeShrinkFactor = CGFloatContextBuilder(props.edgeShrinkFactor?.value, nullify: nullify).context
        self.dotWidth = CGFloatContextBuilder(props.dotWidth?.value, nullify: nullify).context
        self.dotWidthActivated = CGFloatContextBuilder(props.dotWidth?.value(for: [.activated]), nullify: nullify).context
        self.dotHeight = CGFloatContextBuilder(props.dotHeight?.value, nullify: nullify).context
        self.dotHeightActivated = CGFloatContextBuilder(props.dotHeight?.value(for: [.activated]), nullify: nullify).context
        self.edgeCount = PaginationDotsEdgeCountContextBuilder(value: props.edgeCount?.value, nullify: nullify).context
    }
    
    init() {
        self.orientation = PaginationDotsOrientationContextBuilder.defaultContext
        self.gap = CGFloat.defaultContext
        self.edgeShrinkFactor = CGFloat.defaultContext
        self.dotWidth = CGFloat.defaultContext
        self.dotWidthActivated = CGFloat.defaultContext
        self.dotHeight = CGFloat.defaultContext
        self.dotHeightActivated = CGFloat.defaultContext
        self.edgeCount = Int.defaultContext
    }
}

final class PaginationDotsEdgeCountContextBuilder: CodeGenerationContextBuilder {
    let value: String?
    let nullify: Bool
    
    init(value: String?, nullify: Bool = false) {
        self.value = value
        self.nullify = nullify
    }
    
    var context: String? {
        guard let value = value, let intValue = Int(value) else {
            return nullify ? nil : Int.defaultContext
        }
        return "Int(\(intValue))"
    }
}
