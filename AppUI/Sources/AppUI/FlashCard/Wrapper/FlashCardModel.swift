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
    
    public init(
        id: String,
        frontCard: FlashCardFrontModel,
        backCard: FlashCardBackModel
    ) {
        self.id = id
        self.frontCard = frontCard
        self.backCard = backCard
    }
}
