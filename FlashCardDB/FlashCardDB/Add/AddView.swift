//
//  AddView.swift
//  FlashCardDB
//
//  Created by Farbod Rahiminik on 5/14/25.
//

import AppDomain
import SwiftUI

struct AddView: View {
    @State var wordText: String = ""
    @State var meaningText: String = ""
    @Environment(\.dismiss) private var dismiss
    
    let onAdd: ((FlashCardBusinessModel) -> Void)?
    
    var body: some View {
        VStack {
            TextField("Add the new word", text: $wordText)
            TextField("Add its meaning", text: $meaningText)
            
            Button {
                guard !wordText.isEmpty, !meaningText.isEmpty else {
                    dismiss()
                    return
                }
                onAdd?(.init(
                    id: UUID().uuidString,
                    word: wordText,
                    meaning: meaningText,
                    isCorrect: nil
                ))
                
                dismiss()
            } label: {
               Text("Add")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(onAdd: nil)
            .previewDisplayName("Empty Fields")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
