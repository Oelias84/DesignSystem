import Testing
import SwiftUI
@testable import DesignSystem

@Test func cartTypeMapping() {
    #expect(CartButtonStyle.CartType.star.resource == .star)
    #expect(CartButtonStyle.CartType.receipt.resource == .receipt)
    #expect(CartButtonStyle.CartType.arrowClockwise.resource == .arrowClockwise)
}

@Test func colorTokensResolveInBundle() {
    #expect(UIColor(named: "main", in: .module, compatibleWith: nil) != nil)
    #expect(UIColor(named: "dark", in: .module, compatibleWith: nil) != nil)
    #expect(UIColor(named: "dsGreen", in: .module, compatibleWith: nil) != nil)
    #expect(UIColor(named: "lightGray", in: .module, compatibleWith: nil) != nil)
}

@Test func mainColorMatchesExpectedRGB() {
    let color = UIColor(Color.main)
    var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    color.getRed(&r, green: &g, blue: &b, alpha: &a)
    #expect(Int((r * 255).rounded()) == 0x3D)
    #expect(Int((g * 255).rounded()) == 0x70)
    #expect(Int((b * 255).rounded()) == 0xFF)
}
