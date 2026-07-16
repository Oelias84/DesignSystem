//
//  BankCardView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 16/07/2026.
//

import SwiftUI

public struct BankCardView: View {

    private let title: String
    private let balance: String
    private let suffix: String

    public init(
        title: String,
        balance: String,
        suffix: String
    ) {
        self.title = title
        self.balance = balance
        self.suffix = suffix
    }

    public var body: some View {
        Image(.cardBackground)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 194)
        
            .overlay {
                VStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(DSFont.captionSemi)
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text(balance)
                            .font(DSFont.heading2Heavy)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Image(.visa)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 19)
                            
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 9) {
                            Text("••/••")
                                .font(DSFont.captionBold)
                                .foregroundStyle(.white.opacity(0.4))
                            
                            Text("•••• •••• •••• \(suffix)")
                                .font(DSFont.captionBold)
                                .foregroundStyle(.white.opacity(0.4))
                        }
                    }
                }
                .frame(height: 160)
                .padding(24)
            }
    }
}

#Preview {
    BankCardView(title: "Salary card", balance: "10,000$", suffix: "1234")
        .padding()
}
