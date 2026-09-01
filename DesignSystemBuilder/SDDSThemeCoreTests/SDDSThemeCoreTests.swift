//
//  SDDSThemeCoreTests.swift
//  SDDSThemeCoreTests
//
//  Created by Vladimir Kaltyrin on 04.06.2024.
//

import XCTest
import SwiftUI
import UIKit
@testable import SDDSThemeCore

final class SDDSThemeCoreTests: XCTestCase {

    func testExample() throws {
        // Placeholder smoke test.
    }
}

// MARK: - TypographyToken system-font weight wiring
//
// Sentinel `fontName == "SF Pro"` транслируется в `.system(...)` /
// `UIFont.systemFont(ofSize:weight:)`. До правки в TypographyToken+Extensions
// этот путь игнорировал TypographyToken.weight — все размеры рендерились
// одним весом. Эти тесты фиксируют, что weight теперь применяется.

final class TypographyTokenSystemFontTests: XCTestCase {

    private func token(weight: TypographyToken.Weight, size: CGFloat = 16) -> TypographyToken {
        TypographyToken(
            fontName: "SF Pro",
            weight: weight,
            style: .normal,
            size: size,
            lineHeight: 20,
            kerning: 0
        )
    }

    private func customToken(weight: TypographyToken.Weight, size: CGFloat = 16) -> TypographyToken {
        TypographyToken(
            fontName: "SBSansDisplay-Regular",
            weight: weight,
            style: .normal,
            size: size,
            lineHeight: 20,
            kerning: 0
        )
    }

    /// Извлекает `UIFont.Weight` из дескриптора. У системных шрифтов он
    /// сохраняется в `traits[.weight]`.
    private func weight(of font: UIFont) -> UIFont.Weight? {
        let traits = font.fontDescriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any]
        guard let raw = traits?[.weight] as? CGFloat else { return nil }
        return UIFont.Weight(rawValue: raw)
    }

    func test_uiFont_systemFont_appliesWeight_semibold() {
        let font = token(weight: .semibold).uiFont
        XCTAssertEqual(font.pointSize, 16)
        XCTAssertEqual(weight(of: font), .semibold,
            "system-font sentinel must propagate TypographyToken.weight to UIFont")
    }

    func test_uiFont_systemFont_appliesWeight_regular() {
        let font = token(weight: .regular).uiFont
        XCTAssertEqual(weight(of: font), .regular)
    }

    func test_uiFont_systemFont_normalIsRegular() {
        // `.normal` (типографическая «обычная» нотация) маппится в `.regular`.
        let font = token(weight: .normal).uiFont
        XCTAssertEqual(weight(of: font), .regular)
    }

    func test_uiFont_systemFont_appliesWeight_ultraLight() {
        let font = token(weight: .ultraLight).uiFont
        XCTAssertEqual(weight(of: font), .ultraLight)
    }

    func test_uiFont_systemFont_pointSize_preserved() {
        let font = token(weight: .medium, size: 24).uiFont
        XCTAssertEqual(font.pointSize, 24)
    }

    func test_uiFont_customFont_unchanged_whenNotInstalled() {
        // SBSansDisplay-Regular не зарегистрирован в тесте → fallback на
        // systemFont(ofSize:weight:). Это сохранение существующего поведения:
        // до правки на fallback тоже шли — но теперь fallback тоже weighted.
        let font = customToken(weight: .bold).uiFont
        XCTAssertEqual(font.pointSize, 16)
        XCTAssertEqual(weight(of: font), .bold,
            "fallback to system font on missing custom font must also respect weight")
    }
}

// MARK: - Tenant

final class TenantTests: XCTestCase {

    func test_none_isEmpty() {
        XCTAssertTrue(Tenant.none.isNone)
        XCTAssertEqual(Tenant.none.name, "")
    }

    func test_named_isNotNone() {
        let gold = Tenant(name: "Gold")
        XCTAssertFalse(gold.isNone)
        XCTAssertEqual(gold.name, "Gold")
    }

    func test_equalityAndHashing() {
        let a = Tenant(name: "Gold")
        let b = Tenant(name: "Gold")
        let c = Tenant(name: "Silver")
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
        XCTAssertEqual(a.hashValue, b.hashValue)
    }
}

// MARK: - ThemeTenantRegistry

final class ThemeTenantRegistryTests: XCTestCase {

    private let gold = Tenant(name: "Gold")
    private let silver = Tenant(name: "Silver")
    private let base = ColorToken(id: "backgroundDefaultPrimary", darkColor: .black, lightColor: .white)
    private let baseGradient = GradientToken(id: "backgroundDefaultGradient", description: "base", darkGradients: [], lightGradients: [])
    private let baseShape = ShapeToken(cornerRadius: 4)
    private let baseShadow = ShadowToken(layers: [])
    private let baseSpacing = SpacingToken(value: 8)
    private let baseTypography = AdaptiveTypographyToken(
        small: TypographyToken(fontName: "Sf", weight: .regular, style: .normal, size: 12, lineHeight: 14, kerning: 0),
        medium: TypographyToken(fontName: "Sf", weight: .regular, style: .normal, size: 14, lineHeight: 16, kerning: 0),
        large: TypographyToken(fontName: "Sf", weight: .regular, style: .normal, size: 16, lineHeight: 18, kerning: 0)
    )

    override func setUp() {
        super.setUp()
        ThemeTenantRegistry.shared.reset()
    }

    override func tearDown() {
        ThemeTenantRegistry.shared.reset()
        super.tearDown()
    }

    // MARK: Activation

    func test_defaultActiveTenant_isNone() {
        XCTAssertEqual(ThemeTenantRegistry.shared.activeTenant, .none)
    }

    func test_setActive_updatesActiveTenant() {
        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.activeTenant, gold)
    }

    func test_reset_returnsToNoneAndClearsResolvers() {
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { _ in self.overlayColor }
        ThemeTenantRegistry.shared.setActive(gold)

        ThemeTenantRegistry.shared.reset()

        XCTAssertEqual(ThemeTenantRegistry.shared.activeTenant, .none)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), base)
    }

    // MARK: Colors

    func test_resolveColor_returnsBaseWhenNoTenantActive() {
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { _ in self.overlayColor }
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), base)
    }

    func test_resolveColor_returnsOverlayForActiveTenant() {
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { id in
            id == self.base.id ? self.overlayColor : nil
        }
        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), overlayColor)
    }

    func test_resolveColor_returnsBaseWhenActiveTenantHasNoOverlayForId() {
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { id in
            id == "unrelated" ? self.overlayColor : nil
        }
        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), base)
    }

    func test_resolveColor_returnsBaseWhenActiveTenantHasNoResolver() {
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { _ in self.overlayColor }
        ThemeTenantRegistry.shared.setActive(silver)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), base)
    }

    func test_resolveColor_pickerCorrectResolverPerActiveTenant() {
        let goldOverlay = ColorToken(id: base.id, darkColor: .yellow, lightColor: .yellow)
        let silverOverlay = ColorToken(id: base.id, darkColor: .gray, lightColor: .gray)
        ThemeTenantRegistry.shared.registerColors(tenant: gold) { _ in goldOverlay }
        ThemeTenantRegistry.shared.registerColors(tenant: silver) { _ in silverOverlay }

        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), goldOverlay)

        ThemeTenantRegistry.shared.setActive(silver)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), silverOverlay)

        ThemeTenantRegistry.shared.setActive(.none)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveColor(id: base.id, base: base), base)
    }

    // MARK: Gradients

    func test_resolveGradient_fallsBackAndOverlays() {
        let overlay = GradientToken(id: baseGradient.id, description: "gold")
        ThemeTenantRegistry.shared.registerGradients(tenant: gold) { id in
            id == self.baseGradient.id ? overlay : nil
        }

        // Inactive → base
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveGradient(id: baseGradient.id, base: baseGradient), baseGradient)

        // Active → overlay
        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveGradient(id: baseGradient.id, base: baseGradient), overlay)

        // Unknown id → base
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveGradient(id: "missing", base: baseGradient), baseGradient)
    }

    // MARK: Shape / Shadow / Spacing / Typography

    func test_resolveShape_fallsBackAndOverlays() {
        let overlay = ShapeToken(cornerRadius: 16)
        ThemeTenantRegistry.shared.registerShapes(tenant: gold) { id in
            id == "roundL" ? overlay : nil
        }

        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShape(id: "roundL", base: baseShape).cornerRadius, baseShape.cornerRadius)

        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShape(id: "roundL", base: baseShape).cornerRadius, overlay.cornerRadius)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShape(id: "unknown", base: baseShape).cornerRadius, baseShape.cornerRadius)
    }

    func test_resolveShadow_fallsBackAndOverlays() {
        let overlay = ShadowToken(layers: [
            ShadowToken.Layer(color: .black, offsetX: 0, offsetY: 1, blurRadius: 2, spreadRadius: 0)
        ])
        ThemeTenantRegistry.shared.registerShadows(tenant: gold) { id in
            id == "downHardL" ? overlay : nil
        }

        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShadow(id: "downHardL", base: baseShadow).layers.count, 0)

        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShadow(id: "downHardL", base: baseShadow).layers.count, 1)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveShadow(id: "unknown", base: baseShadow).layers.count, 0)
    }

    func test_resolveSpacing_fallsBackAndOverlays() {
        let overlay = SpacingToken(value: 24)
        ThemeTenantRegistry.shared.registerSpacings(tenant: gold) { id in
            id == "spacingM" ? overlay : nil
        }

        XCTAssertEqual(ThemeTenantRegistry.shared.resolveSpacing(id: "spacingM", base: baseSpacing).value, baseSpacing.value)

        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveSpacing(id: "spacingM", base: baseSpacing).value, overlay.value)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveSpacing(id: "missing", base: baseSpacing).value, baseSpacing.value)
    }

    func test_resolveTypography_fallsBackAndOverlays() {
        let big = TypographyToken(fontName: "Sf", weight: .bold, style: .normal, size: 32, lineHeight: 36, kerning: 0)
        let overlay = AdaptiveTypographyToken(small: big, medium: big, large: big)
        ThemeTenantRegistry.shared.registerTypographies(tenant: gold) { id in
            id == "headerL" ? overlay : nil
        }

        XCTAssertEqual(ThemeTenantRegistry.shared.resolveTypography(id: "headerL", base: baseTypography), baseTypography)

        ThemeTenantRegistry.shared.setActive(gold)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveTypography(id: "headerL", base: baseTypography), overlay)
        XCTAssertEqual(ThemeTenantRegistry.shared.resolveTypography(id: "missing", base: baseTypography), baseTypography)
    }

    // MARK: - Helpers

    private var overlayColor: ColorToken {
        ColorToken(id: base.id, darkColor: .yellow, lightColor: .yellow)
    }
}
