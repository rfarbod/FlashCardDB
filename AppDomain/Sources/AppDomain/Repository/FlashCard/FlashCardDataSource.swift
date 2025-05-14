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
            return try jsonData.getFlashCards()
        } else {
            return swiftDataFlashCards
        }
    }
}
