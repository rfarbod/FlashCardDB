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
