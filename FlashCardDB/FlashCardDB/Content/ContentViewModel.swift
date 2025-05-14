//
//  ContentViewModel.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import AppUI
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
            model.flashCards = try repository.getFlashCards().enumerated().map({ index, flashCard in
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
                            let isCorrect = self.submittedAnswer(answer: answer, meaning: flashCard.meaning)
                            self.model.flashCards[index].backCard.state = isCorrect ? .correct : .incorrent
                        }
                    ),
                    onVerticalSwipe: { [weak self] direction in
                        guard let self else { return }
                        self.onVerticalSwipe(direction: direction)
                    },
                    onHorizontalSwipe: { [weak self] _ in
                        guard let self else { return }
                        self.onHorizontalSwipe()
                    }
                )
            })
        } catch {
            print("Faild fetching saved flash cards")
        }
    }
    
    func submittedAnswer(answer: String, meaning: String) -> Bool {
        answer.trimmingCharacters(in: .whitespaces).lowercased() == meaning.trimmingCharacters(in: .whitespaces).lowercased()
    }
    
    func onVerticalSwipe(direction: SwipeDirection) {
        if direction == .up {
            model.topIndex = min(model.topIndex + 1, model.flashCards.count - 1)
        } else if direction == .down {
            model.topIndex = max(model.topIndex - 1, 0)
        }
    }
    
    func onHorizontalSwipe() {
    }
}
