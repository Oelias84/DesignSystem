//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Ofir Elias on 14/07/2026.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) private var isEnabled

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(DSFont.heading2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: 52)
            .background(Color.main)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .opacity(isEnabled ? (configuration.isPressed ? 0.7 : 1) : 0.4)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { PrimaryButtonStyle() }
}

#Preview {
    Button("Button") {}.buttonStyle(.primary)
        .padding()
}
