//
//  ResizableDrawerView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 20/07/2026.
//

import SwiftUI

public struct ResizableDrawerView<Content: View>: View {

    private let title: String
    private let content: Content
    @State private var showDetails: Bool = false

    public init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 18) {
                Image(.info)
                    .foregroundStyle(Color.main)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.lightGray)
                            .frame(width: 36, height: 36)
                    }

                Text(title)
                    .font(DSFont.heading2Regular)
                    .foregroundStyle(Color.dark)

                Spacer()

                Button {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        showDetails.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14)
                        .rotationEffect(.degrees(showDetails ? 0 : 180))
                        .foregroundStyle(Color.dark.opacity(0.7))
                }
            }
            .padding([.top, .horizontal])

            VStack {
                if showDetails {
                    ScrollView {
                        content
                            .padding(.horizontal)
                    }
                    .padding(.top)
                    .frame(maxHeight: 186)
                }
            }
            .frame(minHeight: 18)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.surface)
        )
    }
}

#Preview {
    ResizableDrawerView(title: "Operation details") {
        DSRawView(title: "Title", caption: "Caption")
    }
    .padding()
}
