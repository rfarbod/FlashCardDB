//
//  ContentViewModel.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppDomain
import Combine
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var model: ContentModel
    var repository: FlashCardRepository
    
    init(
        model: ContentModel = .init(),
        repository: FlashCardRepository
    ) {
        self.model = model
        self.repository = repository
    }
    
    func getItems() {
        do {
            model.flashCards = try repository.getFlashCards().map({ flashCard in
                return .init(
                    id: flashCard.id,
                    frontCard: .init(
                        id: flashCard.id,
                        word: flashCard.word,
                        color: Color.purple
                    ),
                    backCard: .init(
                        id: flashCard.id,
                        word: flashCard.word,
                        meaning: flashCard.meaning,
                        color: Color.pink,
                        state: .noAnswer,
                        onSubmit: { [weak self] answer in
                            guard let self else { return }
                            self.submittedAnswer(answer: answer)
                        }
                    )
                )
            })
        } catch {
            print("Faild fetching saved flash cards")
        }
    }
    
    func submittedAnswer(answer: String) {
        print(answer)
    }
}
