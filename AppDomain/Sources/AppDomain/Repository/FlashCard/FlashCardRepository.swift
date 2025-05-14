//
//  FlashCardRepository.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

public protocol FlashCardRepository {
    func getFlashCards() throws -> [FlashCardBusinessModel]
    func addFlashCard(flashCard : FlashCardBusinessModel)
}
