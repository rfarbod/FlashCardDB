//
//  FlashCardSwiftDataRepository.swift
//  AppDomain
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftData

public final class FlashCardSwiftDataRepository: FlashCardRepository {
    private let context: ModelContext?
    private let descriptor: FetchDescriptor<FlashCardSwiftDataModel> = .init()
    
    public init(context: ModelContext?) {
        self.context = context
    }
    
    public func getFlashCards() throws -> [FlashCardBusinessModel] {
        guard let context else { throw FlashCardError.invalidContext }
        
        do {
            let results = try context.fetch(descriptor)
            
            return results.map { model in
                return FlashCardBusinessModel.init(
                    id: model.id,
                    word: model.word,
                    meaning: model.meaning
                )
            }
        } catch {
            throw FlashCardError.invalidQueryResult
        }
    }
    
    public func addFlashCard(flashCard: FlashCardBusinessModel) {
        context?.insert(FlashCardSwiftDataModel(
            id: flashCard.id,
            word: flashCard.word,
            meaning: flashCard.meaning
        ))
    }
}
