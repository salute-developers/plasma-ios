import Foundation

public protocol SkeletonLineWidthProvider {
    func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat
}

public struct FullWidthLineProvider: SkeletonLineWidthProvider {
    public init() {}
    
    public func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat {
        1.0
    }
}

public struct VariedWidthLineProvider: SkeletonLineWidthProvider {
    public init() {}
    
    public func widthFactor(lineIndex: Int, lineCount: Int) -> CGFloat {
        if lineIndex == lineCount - 1 {
            // Last line: 50% ± 15%
            return 0.5 + CGFloat.random(in: -0.15...0.15)
        } else {
            // Other lines: 90% ± 5%
            return 0.9 + CGFloat.random(in: -0.05...0.05)
        }
    }
} 