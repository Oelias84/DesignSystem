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
        VStack(alignment: .center) {
            VStack {
                Image(type.resource)
            }
            .frame(width: 38, height: 38)
            .background(Color.main)
            .clipShape(RoundedRectangle(cornerRadius: 38/2, style: .continuous))
            .opacity(configuration.isPressed ? 0.7 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
            
            configuration.label
                .font(DSFont.caption)
                .frame(maxWidth: 46)
                .opacity(0.6)
                .multilineTextAlignment(.center)
        }
        .background {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 106, height: 106)
                .foregroundStyle(.white)
        }
    }
}

public extension ButtonStyle where Self == CartButtonStyle {
    static func cartButton(type: Self.CartType) -> CartButtonStyle { CartButtonStyle(type: type) }
}

#Preview {
    Button("Open Receipt") {}.buttonStyle(.cartButton(type: .star))
}

