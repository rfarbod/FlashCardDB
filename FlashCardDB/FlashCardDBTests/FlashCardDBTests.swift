//
//  FlashCardDBTests.swift
//  FlashCardDBTests
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import XCTest
@testable import AppDomain
@testable import FlashCardDB

private final class DummyFlashCardRepository: FlashCardRepository {
    func getFlashCards() throws -> [FlashCardBusinessModel] { [] }
    func addFlashCard(flashCard: FlashCardBusinessModel) { }
    func setAnswer(for id: String, isCorrect: Bool) { }
}

private final class DummyXPRepository: XPRepository {
    func getXP() -> Int { 0 }
    func addXP(points: Int) { }
    func removeXP(points: Int) { }
}

final class ContentViewModelTests: XCTestCase {
    
    var viewModel: ContentViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ContentViewModel(
            model: ContentModel(),
            repository: DummyFlashCardRepository(),
            xpRepository: DummyXPRepository()
        )
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testCheckIfCorrect_exactMatch() {
        XCTAssertTrue(
            viewModel.checkIfCorrect(answer: "swift", meaning: "swift"),
            "Exact match should return true"
        )
    }
    
    func testCheckIfCorrect_withLeadingAndTrailingSpaces() {
        XCTAssertTrue(
            viewModel.checkIfCorrect(answer: "  swift  ", meaning: "swift"),
            "Extra spaces should be trimmed before comparison"
        )
    }
    
    func testCheckIfCorrect_withWeirdCapitalization() {
        XCTAssertTrue(
            viewModel.checkIfCorrect(answer: "SwIfT", meaning: "swift"),
            "Capitalization should be ignored"
        )
    }
    
    func testCheckIfCorrect_withSpacesAndCaps() {
        XCTAssertTrue(
            viewModel.checkIfCorrect(answer: "  SwIfT  ", meaning: "swift"),
            "Combination of spaces and caps should still match"
        )
    }
    
    func testCheckIfCorrect_incorrectAnswer() {
        XCTAssertFalse(
            viewModel.checkIfCorrect(answer: "swiftui", meaning: "swift"),
            "Different words should return false"
        )
    }
}
