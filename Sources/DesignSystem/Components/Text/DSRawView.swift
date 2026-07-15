//
//  DSRawView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 15/07/2026.
//

import SwiftUI

public struct DSRawView: View {
    
    private let title: String
    private let caption: String
    
    public init(title: String, caption: String) {
        self.title = title
        self.caption = caption
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(caption)
                .font(DSFont.caption)
                .foregroundStyle(Color.dark.opacity(0.6))
            
            Text(title)
                .font(DSFont.heading2Regular)
                .foregroundStyle(Color.dark)
                .padding(.top, 8)
            
            Divider()
                .padding(.top, 12)
        }
    }
}

#Preview {
    DSRawView(title: "Title", caption: "Caption")
        .padding()
}
