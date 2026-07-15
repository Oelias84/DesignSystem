//
//  PrimaryButtonStyle.swift
//  DesignSystem
//
//  Created by Ofir Elias on 14/07/2026.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(DSFont.heading2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(Color.primary)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .opacity(configuration.isPressed ? 0.7 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { PrimaryButtonStyle() }
}

#Preview {
    Button("Button") {}.buttonStyle(.primary)
}
