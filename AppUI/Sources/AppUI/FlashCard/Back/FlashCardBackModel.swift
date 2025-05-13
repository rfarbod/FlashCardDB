//
//  FlashCardBackModel.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import Foundation
import SwiftUI

public enum FlashCardBackState: Sendable {
    case incorrent
    case correct
    case noAnswer
}

public struct FlashCardBackModel: Sendable, Identifiable {
    public let id: String
    public let word: String
    public let meaning: String
    public let color: Color
    public let placeholder: String
    public var state: FlashCardBackState
    public var onSubmit: (@Sendable (String) -> ())?
    
    public init(
        id: String = Self.default.id,
        word: String = Self.default.word,
        meaning: String = Self.default.meaning,
        color: Color = Self.default.color,
        placeholder: String = Self.default.placeholder,
        state: FlashCardBackState = Self.default.state,
        onSubmit: (@Sendable (String) -> ())? = Self.default.onSubmit
    ) {
        self.id = id
        self.word = word
        self.meaning = meaning
        self.color = color
        self.placeholder = placeholder
        self.state = state
        self.onSubmit = onSubmit
    }
}

public extension FlashCardBackModel {
    static let `default`: FlashCardBackModel = .init(
        id: UUID().uuidString,
        word: "",
        meaning: "",
        color: .clear,
        placeholder: "Enter your answer here",
        state: .noAnswer,
        onSubmit: nil
    )
}
