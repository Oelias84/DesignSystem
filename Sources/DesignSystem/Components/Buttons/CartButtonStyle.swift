//
//  ReceiptButtonStyle.swift
//  DesignSystem
//
//  Created by Ofir Elias on 14/07/2026.
//

import SwiftUI

public struct CartButtonStyle: ButtonStyle {
    
    public enum CartType {
        case receipt, star, arrowClockwise
        
        var resource: ImageResource {
            switch self {
            case .arrowClockwise: .arrowClockwise
            case .receipt: .receipt
            case .star: .star
            }
        }
    }
    
    private let type: CartType
    
    public init(type: CartType) {
        self.type = type
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .center, spacing: 8) {
            Image(type.resource)
                .frame(width: 38, height: 38)
                .background(Color.main)
                .clipShape(RoundedRectangle(cornerRadius: 38/2, style: .continuous))

            configuration.label
                .font(DSFont.caption)
                .opacity(0.6)
                .multilineTextAlignment(.center)
                .lineLimit(2, reservesSpace: true)
        }
        .padding(8)
        .frame(width: 106, height: 106)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .opacity(configuration.isPressed ? 0.7 : 1)
        .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

public extension ButtonStyle where Self == CartButtonStyle {
    static func cartButton(type: Self.CartType) -> CartButtonStyle { CartButtonStyle(type: type) }
}

#Preview {
    Button("Open Receipt") {}.buttonStyle(.cartButton(type: .star))
}

