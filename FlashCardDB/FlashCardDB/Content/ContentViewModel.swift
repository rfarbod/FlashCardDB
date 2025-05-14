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
    var xpRepository: XPRepository
    
    init(
        model: ContentModel = .init(),
        repository: FlashCardRepository,
        xpRepository: XPRepository
    ) {
        self.model = model
        self.repository = repository
        self.xpRepository = xpRepository
    }
    
    func getItems() {
        do {
            model.flashCards = try repository.getFlashCards().enumerated().map({ index, flashCard in
                return .init(
                    id: flashCard.id,
                    frontCard: .init(
                        id: flashCard.id,
                        word: flashCard.word,
                        color: Color.randomBright
                    ),
                    backCard: .init(
                        id: flashCard.id,
                        word: flashCard.word,
                        meaning: flashCard.meaning,
                        color: Color.randomBright,
                        state: getStateFromIsCorrect(isCorrect: flashCard.isCorrect),
                        onSubmit: { [weak self] answer in
                            guard let self else { return }
                            
                            self.onSubmit(
                                answer: answer,
                                meaning: flashCard.meaning,
                                id: flashCard.id
                            )
                        }
                    ),
                    onVerticalSwipe: { [weak self] direction in
                        guard let self else { return }
                        self.onVerticalSwipe(direction: direction)
                    }
                )
            })
        } catch {
            print("Faild fetching saved flash cards")
        }
    }
    
    func getCorrectAnswersCount() {
        do {
            let results = try repository.getFlashCards()
            model.correctAnswers = results.filter( { $0.isCorrect == true }).count
        } catch {
            print("no correct answer")
        }
    }
    
    func onVerticalSwipe(direction: SwipeDirection) {
        if direction == .up {
            model.topIndex = min(model.topIndex + 1, model.flashCards.count - 1)
        } else if direction == .down {
            model.topIndex = max(model.topIndex - 1, 0)
        }
    }
    
    func getXPPoints() {
        model.xp = xpRepository.getXP()
    }
    
    func addNewFlashCard(flashCard: FlashCardBusinessModel) {
        repository.addFlashCard(flashCard: flashCard)
        getItems()
    }
    
    private func onSubmit(
        answer: String,
        meaning: String,
        id: String
    ) {
        let isCorrect = checkIfCorrect(answer: answer, meaning: meaning)
        
        if let index = model.flashCards.firstIndex(where: { $0.id == id }) {
            model.flashCards[index].backCard.state = isCorrect ? .correct : .incorrent
        }
        
        repository.setAnswer(for: id, isCorrect: isCorrect)
        
        if isCorrect { addXP(amount: 10) }
        
        getCorrectAnswersCount()
    }
    
    func checkIfCorrect(answer: String, meaning: String) -> Bool {
        answer.trimmingCharacters(in: .whitespaces).lowercased() == meaning.trimmingCharacters(in: .whitespaces).lowercased()
    }
    
    private func addXP(amount: Int) {
        xpRepository.addXP(points: amount)
        getXPPoints()
    }
    
    private func removeXP(amount: Int) {
        xpRepository.removeXP(points: amount)
        getXPPoints()
    }
    
    private func getStateFromIsCorrect(isCorrect: Bool?) -> FlashCardBackState {
        switch isCorrect {
        case true:
            return .correct
        case false:
            return .incorrent
        default:
            return .noAnswer
        }
    }
}
