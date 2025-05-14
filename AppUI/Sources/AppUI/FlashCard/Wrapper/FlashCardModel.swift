//
//  FlashCardModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

public struct FlashCardModel: Identifiable {
    public let id: String
    public let frontCard: FlashCardFrontModel
    public let backCard: FlashCardBackModel
    public let onVerticalSwipe: ((SwipeDirection) -> Void)?
    public let onHorizontalSwipe: ((SwipeDirection) -> Void)?
    
    public init(
        id: String,
        frontCard: FlashCardFrontModel,
        backCard: FlashCardBackModel,
        onVerticalSwipe: ((SwipeDirection) -> Void)? = nil,
        onHorizontalSwipe: ((SwipeDirection) -> Void)? = nil
    ) {
        self.id = id
        self.frontCard = frontCard
        self.backCard = backCard
        self.onVerticalSwipe = onVerticalSwipe
        self.onHorizontalSwipe = onHorizontalSwipe
    }
}
