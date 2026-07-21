//
//  ReceiptView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 20/07/2026.
//

import SwiftUI

public struct ReceiptView<Content: View>: View {

    private let title: String
    private let content: Content
    private let onClose: (() -> Void)?

    public init(title: String, onClose: (() -> Void)? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.onClose = onClose
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 18) {
                Text(title)
                    .font(DSFont.heading2Regular)
                    .foregroundStyle(Color.dark)

                if let onClose {
                    Spacer()

                    Button(action: onClose) {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(Color.dark.opacity(0.6))
                            .frame(width: 28, height: 28)
                            .background(Color.lightGray)
                            .clipShape(Circle())
                    }
                }
            }

            DashedLine()

            VStack(alignment: .leading, spacing: 12) {
                content
            }
        }
        .padding(20)
        .padding(.bottom, 28)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.surface)
                .shadow(color: .black.opacity(0.08), radius: 12, y: 4)
        )
    }
}

#Preview {
    ReceiptView(title: "Operation details", onClose: {}) {
        DSRawView(title: "100$", caption: "Transfer amount", dividerStyle: .dashed)
        DSRawView(title: "Alexander Dmitrievich", caption: "Name of recipient", dividerStyle: .dashed)
        DSRawView(title: "No commission", caption: "Commission", dividerStyle: .dashed)
    }
    .padding()
}
