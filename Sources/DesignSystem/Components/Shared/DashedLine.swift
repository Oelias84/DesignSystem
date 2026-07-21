//
//  DashedLine.swift
//  DesignSystem
//
//  Created by Ofir Elias on 20/07/2026.
//

import SwiftUI

struct DashedLine: View {
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(height: 1)
            .overlay {
                GeometryReader { proxy in
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: proxy.size.width, y: 0))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4]))
                    .foregroundStyle(Color.dark.opacity(0.2))
                }
            }
    }
}
