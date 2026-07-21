//
//  DSRawView.swift
//  DesignSystem
//
//  Created by Ofir Elias on 15/07/2026.
//

import SwiftUI

public struct DSRawView: View {

    public enum DividerStyle {
        case solid
        case dashed
    }

    public struct CardData {
        let suffix: String
        let type: CType

        public init(suffix: String, type: CType) {
            self.suffix = suffix
            self.type = type
        }

        public enum CType: String, CaseIterable {
            case visa
            case masterCard
            case amex
            case discover
        }
    }

    private let title: String
    private let caption: String
    private let cardInfo: CardData?
    private let dividerStyle: DividerStyle

    public init(
        title: String,
        caption: String,
        cardInfo: CardData? = nil,
        dividerStyle: DividerStyle = .solid
    ) {
        self.title = title
        self.caption = caption
        self.cardInfo = cardInfo
        self.dividerStyle = dividerStyle
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(caption)
                        .font(DSFont.caption)
                        .foregroundStyle(Color.dark.opacity(0.6))
                    
                    Text(title)
                        .font(DSFont.heading2Regular)
                        .foregroundStyle(Color.dark)
                        .padding(.top, 8)
                }
                
                Spacer()
                
                if let cardInfo {
                    HStack(spacing: 12) {
                        cardTypeImage
                            .background (
                                RoundedRectangle(cornerRadius: 3.27)
                                    .fill(Color.lightGray)
                                    .frame(width: 32, height: 20)
                                    .padding(10)
                            )
                        
                        Text("· " + cardInfo.suffix)
                            .font(DSFont.caption)
                            .foregroundStyle(Color.dark.opacity(0.6))
                    }
                }
            }
            
            dividerView
                .padding(.top, 12)
        }
    }

    @ViewBuilder
    private var dividerView: some View {
        switch dividerStyle {
        case .solid:
            Divider()
        case .dashed:
            DashedLine()
        }
    }
    
    private var cardTypeImage: Image {
        switch cardInfo?.type {
        case .visa:
            return Image(.visa)
        default:
            return Image(systemName: "")
        }
    }
}

#Preview {
    DSRawView(
        title: "Title",
        caption: "Caption",
        cardInfo: DSRawView.CardData(suffix: "1234", type: .visa)
    )
        .padding()
}
