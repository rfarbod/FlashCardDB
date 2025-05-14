//
//  FlashCardView.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public struct FlashCardView: View {
    public var model: FlashCardModel
    
    public init(
        model: FlashCardModel
    ) {
        self.model = model
    }
    
    public var body: some View {
        FlippableView(
            frontColor: model.frontCard.color,
            backColor: model.backCard.color,
            onVerticalSwipe: { direction in
                model.onVerticalSwipe?(direction)
            },
            onHorizontalSwipe: { direction in
                model.onHorizontalSwipe?(direction)
            },
            front: {
                FlashCardFrontView(model: model.frontCard)
            },
            back: {
                FlashCardBackView(model: model.backCard)
            }
        )
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        let front = FlashCardFrontModel(
            id: "1",
            word: "Hello",
            color: .accentColor
        )
        
        let back = FlashCardBackModel(
            id: "1",
            word: "Hello",
            meaning: "سلام",
            color: .purple,
            placeholder: "Enter your answer",
            state: .noAnswer,
            onSubmit: { answer in
                print("Submitted: \(answer)")
            }
        )
        
        let cardModel = FlashCardModel(
            id: "1",
            frontCard: front,
            backCard: back,
            onVerticalSwipe: nil,
            onHorizontalSwipe: nil
        )
        
        return FlashCardView(model: cardModel)
            .frame(width: 300, height: 450)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
