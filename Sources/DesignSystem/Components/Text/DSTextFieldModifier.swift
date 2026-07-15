//
//  DSTextFieldModifier.swift
//  DesignSystem
//
//  Created by Ofir Elias on 15/07/2026.
//

import SwiftUI

public struct DSTextFieldModifier: ViewModifier {
    
    private let title: String
    
    public init(title: String) {
        self.title = title
    }
    
    public func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(DSFont.caption)
                .foregroundStyle(Color.dark.opacity(0.6))
            
            content
                .font(DSFont.heading2Regular)
                .foregroundStyle(Color.dark)
                .padding(.top, 8)
            
            Divider()
                .padding(.top, 12)
        }
    }
}

extension View {
    public func dsTextField(title: String) -> some View {
        modifier(DSTextFieldModifier(title: title))
    }
}

#Preview {
    TextField("Place holder", text: .constant("Text"))
        .dsTextField(title: "Title")
        .padding()
}
