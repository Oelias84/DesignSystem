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
    assertRGB(Color.main, r: 0x3D, g: 0x70, b: 0xFF)
}

@Test func darkColorMatchesExpectedRGB() {
    assertRGB(Color.dark, r: 0x28, g: 0x2A, b: 0x31)
}

@Test func dsGreenColorMatchesExpectedRGB() {
    assertRGB(Color.dsGreen, r: 0x53, g: 0xB0, b: 0x52)
}

@Test func lightGrayColorMatchesExpectedRGB() {
    assertRGB(Color.lightGray, r: 0xF3, g: 0xF6, b: 0xFA)
}

private func assertRGB(_ color: Color, r expectedR: Int, g expectedG: Int, b expectedB: Int, sourceLocation: SourceLocation = #_sourceLocation) {
    let uiColor = UIColor(color)
    var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
    uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
    #expect(Int((r * 255).rounded()) == expectedR, sourceLocation: sourceLocation)
    #expect(Int((g * 255).rounded()) == expectedG, sourceLocation: sourceLocation)
    #expect(Int((b * 255).rounded()) == expectedB, sourceLocation: sourceLocation)
}
