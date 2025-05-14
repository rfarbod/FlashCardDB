//
//  FlashCardDataSource.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

public final class FlashCardDataSource: FlashCardRepository {
    let swiftData: FlashCardSwiftDataRepository
    let jsonData: FlashCardJSONRepository
    
    public init(
        swiftData: FlashCardSwiftDataRepository,
        jsonData: FlashCardJSONRepository
    ) {
        self.swiftData = swiftData
        self.jsonData = jsonData
    }
    
    public func getFlashCards() throws -> [FlashCardBusinessModel] {
        let swiftDataFlashCards = try swiftData.getFlashCards()
        
        if swiftDataFlashCards.isEmpty {
            try jsonData.getFlashCards().forEach { [weak self] businessModel in
                self?.swiftData.addFlashCard(flashCard: businessModel)
            }
            
            return try swiftData.getFlashCards()
        } else {
            return swiftDataFlashCards
        }
    }
    
    public func addFlashCard(flashCard: FlashCardBusinessModel) {
        // logic to decide where to add the flash card but for now we just add it to swift data
        swiftData.addFlashCard(flashCard: flashCard)
    }
    
    public func setAnswer(for flashCardId: String, isCorrect: Bool) {
        swiftData.setAnswer(for: flashCardId, isCorrect: isCorrect)
    }
}
