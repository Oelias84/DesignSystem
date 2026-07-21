//
//  DrawerContainer.swift
//  DesignSystem
//
//  Created by Ofir Elias on 16/07/2026.
//

import SwiftUI

public struct DrawerContainer<Content: View>: View {
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
                    .font(DSFont.heading2)
                    .foregroundStyle(Color.dark)
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showDetails.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                        .rotationEffect(.degrees(showDetails ? 180 : 0))
                        .foregroundStyle(Color.dark.opacity(0.3))
                }
            }
            .background()
            
            if showDetails {
                ScrollView {
                    content
                }
            }
            
            Spacer()
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.surface)
        )
    }
}

#Preview {
    VStack {}
        .sheet(isPresented: .constant(true)) {
            DrawerContainer(title: "Operation details") {
                ForEach(0..<10) { item in
                    if item == 0 {
                        DSRawView(
                            title: "Title",
                            caption: "Caption",
                            cardInfo: .init(
                                suffix: "1234",
                                type: .visa
                            )
                        )

                    } else {
                        DSRawView(title: "Title", caption: "Caption")
                    }
                }
            }
        }.presentationDetents([.medium, .large])
    
}
