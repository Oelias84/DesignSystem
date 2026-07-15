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
    #expect(UIColor(named: "green", in: .module, compatibleWith: nil) != nil)
    #expect(UIColor(named: "lightGray", in: .module, compatibleWith: nil) != nil)
}
