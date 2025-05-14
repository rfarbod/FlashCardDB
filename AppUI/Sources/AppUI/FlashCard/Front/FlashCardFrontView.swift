//
//  FlashCardVIew.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public struct FlashCardFrontView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 30
    }
    
    public var model: FlashCardFrontModel
    
    public init(
        model: FlashCardFrontModel
    ) {
        self.model = model
    }
    
    public var body: some View {
        Text(model.word)
            .font(.largeTitle)
    }
}

struct FlashCardFrontView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlashCardFrontView(
                model: FlashCardFrontModel(
                    id: "1",
                    word: "Apple",
                    color: .accentColor
                )
            )
            .previewDisplayName("Apple Card")

            FlashCardFrontView(
                model: FlashCardFrontModel(
                    id: "2",
                    word: "Library",
                    color: .blue
                )
            )
            .previewDisplayName("Library Card")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
