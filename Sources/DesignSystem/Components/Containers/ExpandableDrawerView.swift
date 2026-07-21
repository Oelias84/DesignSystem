//
//  ExpandableDrawerView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 20/07/2026.
//

import SwiftUI

public struct ExpandableDrawerView<Content: View>: View {

    private let title: String
    private let content: Content
    @State private var showDetails: Bool = false
    @State private var contentHeight: CGFloat = 0

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
                        .frame(width: 14, height: 14)
                        .rotationEffect(.degrees(showDetails ? 0 : 180))
                        .foregroundStyle(Color.dark.opacity(0.7))
                }
            }
            .padding([.top, .horizontal])

            ScrollView {
                content
                    .padding(.horizontal)
                    .background {
                        GeometryReader { proxy in
                            Color.clear.preference(key: DrawerContentHeightKey.self, value: proxy.size.height)
                        }
                    }
            }
            .padding(.top)
            .frame(maxHeight: showDetails ? contentHeight : 0)
            .opacity(showDetails ? 1 : 0)
            .clipped()
            .onPreferenceChange(DrawerContentHeightKey.self) { contentHeight = $0 }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            UnevenRoundedRectangle(
                cornerRadii: RectangleCornerRadii(
                    topLeading: 24,
                    bottomLeading: 0,
                    bottomTrailing: 0,
                    topTrailing: 24
                ),
                style: .continuous
            )
            .fill(Color.surface)
        )
    }
}

private struct DrawerContentHeightKey: PreferenceKey {
    static let defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ExpandableDrawerView(title: "Operation details") {
        DSRawView(title: "Title", caption: "Caption")
    }
    .padding()
}
