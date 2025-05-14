//
//  FlashCardJSONRepository.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import Foundation

public final class FlashCardJSONRepository: FlashCardRepository {
    private let jsonDecoder: JSONDecoder
    
    public init(
        jsonDecoder: JSONDecoder = .init()
    ) {
        self.jsonDecoder = jsonDecoder
    }
    
    public func getFlashCards() throws -> [FlashCardBusinessModel] {
        guard let fileURL = Bundle.main.url(
            forResource: "FlashCards",
            withExtension: "json"
        ) else {
            throw FlashCardError.invalidJSONPath
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let flashCards = try jsonDecoder.decode([FlashCardBusinessModel].self, from: data)
            
            return flashCards
        } catch {
            throw FlashCardError.decodingFailed
        }
    }
    
    public func addFlashCard(flashCard: FlashCardBusinessModel) {
        //logic to add flash card to the json file
        print(flashCard)
    }
}
