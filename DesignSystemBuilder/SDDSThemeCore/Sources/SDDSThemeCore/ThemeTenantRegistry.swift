import Foundation

public final class ThemeTenantRegistry {

    public static let shared = ThemeTenantRegistry()

    public typealias ColorResolver = (_ id: String) -> ColorToken?
    public typealias GradientResolver = (_ id: String) -> GradientToken?
    public typealias ShapeResolver = (_ id: String) -> ShapeToken?
    public typealias ShadowResolver = (_ id: String) -> ShadowToken?
    public typealias SpacingResolver = (_ id: String) -> SpacingToken?
    public typealias TypographyResolver = (_ id: String) -> AdaptiveTypographyToken?

    private let lock = NSLock()

    private var activeTenants: [String: Tenant] = [:]
    private var colorResolvers: [String: [String: ColorResolver]] = [:]
    private var gradientResolvers: [String: [String: GradientResolver]] = [:]
    private var shapeResolvers: [String: [String: ShapeResolver]] = [:]
    private var shadowResolvers: [String: [String: ShadowResolver]] = [:]
    private var spacingResolvers: [String: [String: SpacingResolver]] = [:]
    private var typographyResolvers: [String: [String: TypographyResolver]] = [:]

    public init() {}

    // MARK: - Active tenant

    public func activeTenant(for theme: String) -> Tenant {
        lock.lock(); defer { lock.unlock() }
        return activeTenants[theme] ?? .none
    }

    public func setActive(_ tenant: Tenant, for theme: String) {
        lock.lock(); defer { lock.unlock() }
        if tenant.isNone {
            activeTenants.removeValue(forKey: theme)
        } else {
            activeTenants[theme] = tenant
        }
    }

    public func reset() {
        lock.lock(); defer { lock.unlock() }
        activeTenants.removeAll()
        colorResolvers.removeAll()
        gradientResolvers.removeAll()
        shapeResolvers.removeAll()
        shadowResolvers.removeAll()
        spacingResolvers.removeAll()
        typographyResolvers.removeAll()
    }

    // MARK: - Registration

    public func registerColors(theme: String, tenant: Tenant, resolver: @escaping ColorResolver) {
        lock.lock(); defer { lock.unlock() }
        colorResolvers[theme, default: [:]][tenant.name] = resolver
    }

    public func registerGradients(theme: String, tenant: Tenant, resolver: @escaping GradientResolver) {
        lock.lock(); defer { lock.unlock() }
        gradientResolvers[theme, default: [:]][tenant.name] = resolver
    }

    public func registerShapes(theme: String, tenant: Tenant, resolver: @escaping ShapeResolver) {
        lock.lock(); defer { lock.unlock() }
        shapeResolvers[theme, default: [:]][tenant.name] = resolver
    }

    public func registerShadows(theme: String, tenant: Tenant, resolver: @escaping ShadowResolver) {
        lock.lock(); defer { lock.unlock() }
        shadowResolvers[theme, default: [:]][tenant.name] = resolver
    }

    public func registerSpacings(theme: String, tenant: Tenant, resolver: @escaping SpacingResolver) {
        lock.lock(); defer { lock.unlock() }
        spacingResolvers[theme, default: [:]][tenant.name] = resolver
    }

    public func registerTypographies(theme: String, tenant: Tenant, resolver: @escaping TypographyResolver) {
        lock.lock(); defer { lock.unlock() }
        typographyResolvers[theme, default: [:]][tenant.name] = resolver
    }

    // MARK: - Resolution

    public func resolveColor(theme: String, id: String, base: ColorToken) -> ColorToken {
        guard let resolver = currentResolver(in: colorResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    public func resolveGradient(theme: String, id: String, base: GradientToken) -> GradientToken {
        guard let resolver = currentResolver(in: gradientResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    public func resolveShape(theme: String, id: String, base: ShapeToken) -> ShapeToken {
        guard let resolver = currentResolver(in: shapeResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    public func resolveShadow(theme: String, id: String, base: ShadowToken) -> ShadowToken {
        guard let resolver = currentResolver(in: shadowResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    public func resolveSpacing(theme: String, id: String, base: SpacingToken) -> SpacingToken {
        guard let resolver = currentResolver(in: spacingResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    public func resolveTypography(theme: String, id: String, base: AdaptiveTypographyToken) -> AdaptiveTypographyToken {
        guard let resolver = currentResolver(in: typographyResolvers, for: theme),
              let overlay = resolver(id) else { return base }
        return overlay
    }

    // MARK: - Private

    private func currentResolver<R>(in resolvers: [String: [String: R]], for theme: String) -> R? {
        lock.lock(); defer { lock.unlock() }
        guard let tenant = activeTenants[theme], !tenant.isNone else { return nil }
        return resolvers[theme]?[tenant.name]
    }
}
