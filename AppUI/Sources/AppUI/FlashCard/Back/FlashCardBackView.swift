//
//  FlashCardBackVie.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public struct FlashCardBackView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 30
    }
    
    @State private var typedText: String = ""
    
    public let model: FlashCardBackModel
    
    public var body: some View {
        VStack {
            Text(model.word)
                .font(.largeTitle)
            
            switch model.state {
            case .incorrent:
                Image(systemName: "xmark")
                    .resizable()
                    .renderingMode(.template)
                    .padding()
                    .foregroundStyle(Color(.red))
                    .frame(width: 75, height: 75)
                
                Text("Incorrect!")
                
            case .correct:
                Image(systemName: "checkmark.seal")
                    .resizable()
                    .padding()
                    .frame(width: 75, height: 75)
                
                Text("Correct!")
                
            case .noAnswer:
                if model.state == .noAnswer {
                    TextField(
                        model.placeholder,
                        text: $typedText
                    )
                    .onSubmit {
                        model.onSubmit?(typedText)
                    }
                }
            }
        }
    }
}
