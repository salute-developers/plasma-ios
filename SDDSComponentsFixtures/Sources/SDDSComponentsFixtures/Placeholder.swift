import Foundation

/// Use in doc samples for abstract values. The snippet extractor replaces
/// `placeholder(..., "doc text")` with `"doc text"` in generated snippets.
public func placeholder<T>(_ value: T, _ docText: String) -> T {
    value
}
