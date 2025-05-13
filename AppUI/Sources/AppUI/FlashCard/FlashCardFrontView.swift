//
//  FlashCardVIew.swift
//  AppUI
//
//  Created by Farbod Rahiminik on 5/13/25.
//

import SwiftUI

public struct FlashCardFrontView: View {
    private enum Constants {
        static let cornerRadius: CGFloat = 30
    }
    
    public var model: FlashCardModel
    
    public var body: some View {
        Text(model.word)
            .font(.largeTitle)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
            }
    }
}
